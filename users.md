# User module — `/users`, `/admin/users`, `/representatives`

Read [README.md](README.md) first: the response envelope, the mandatory
`X-Device-Id` header, the role hierarchy and the error format are defined there.

Three controllers, three access tiers:

| Controller | Base path | Gate |
| --- | --- | --- |
| [Self-service](#self-service--users) | `/users` | Bearer token, any role |
| [Admin](#admin--adminusers) | `/admin/users` | `@Roles(SALES_ADMIN, GENERAL_MANAGER)` — exact list |
| [Approval queue](#approval-queue--representatives) | `/representatives` | `@MinRole(SALES_MANAGER)` — rank 2 and up |

## Endpoint index

| Method | Path | Role | 2FA | Notes |
| --- | --- | --- | --- | --- |
| PUT | [`/users/me/password`](#put-usersmepassword) | Any | — | Lifts the forced-password-change lockdown. |
| GET | [`/users/me/sessions`](#get-usersmesessions) | Any | — | |
| DELETE | [`/users/me/sessions/{sessionId}`](#delete-usersmesessionssessionid) | Any | — | |
| PATCH | [`/users/me/username`](#patch-usersmeusername) | Any | — | One-time only. 3 / 15 min. |
| POST | [`/admin/users`](#post-adminusers) | `GENERAL_MANAGER` (exact) | ✅ | Provision staff. |
| GET | [`/admin/users`](#get-adminusers) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | Paginated. |
| GET | [`/admin/users/{userId}`](#get-adminusersuserid) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | Target must be outranked. |
| GET | [`/admin/users/{userId}/deletion-status`](#get-adminusersuseriddeletion-status) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | |
| GET | [`/admin/users/{userId}/activity`](#get-adminusersuseridactivity) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | Paginated audit trail. |
| GET | [`/admin/users/{userId}/sessions`](#get-adminusersuseridsessions) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | |
| GET | [`/admin/users/{userId}/devices`](#get-adminusersuseriddevices) | `SALES_ADMIN`, `GENERAL_MANAGER` | — | |
| DELETE | [`/admin/users/{userId}/devices`](#delete-adminusersuseriddevices) | `SALES_ADMIN`, `GENERAL_MANAGER` | ✅ | Forces re-authentication. |
| PUT | [`/admin/users/{userId}/status`](#put-adminusersuseridstatus) | `SALES_ADMIN`, `GENERAL_MANAGER` | ✅ | |
| PUT | [`/admin/users/{userId}/role`](#put-adminusersuseridrole) | `GENERAL_MANAGER` (exact) | ✅ | |
| POST | [`/admin/users/{userId}/force-logout`](#post-adminusersuseridforce-logout) | `SALES_ADMIN`, `GENERAL_MANAGER` | ✅ | |
| POST | [`/admin/users/{userId}/reset-password`](#post-adminusersuseridreset-password) | `GENERAL_MANAGER` (exact) | ✅ | Blind reset. |
| POST | [`/admin/users/bulk/status`](#post-adminusersbulkstatus) | `GENERAL_MANAGER` (exact) | ✅ | Partial success possible. |
| GET | [`/representatives/my-manager-code`](#get-representativesmy-manager-code) | `SALES_MANAGER`+ | — | |
| GET | [`/representatives/pending`](#get-representativespending) | `SALES_MANAGER`+ | — | Scoped by role. |
| POST | [`/representatives/{representativeId}/approve`](#post-representativesrepresentativeidapprove) | `SALES_MANAGER`+ | — | |
| POST | [`/representatives/{representativeId}/reject`](#post-representativesrepresentativeidreject) | `SALES_MANAGER`+ | — | **Deletes the account.** |

Six confirm-only routes here — `PUT .../status`, `PUT .../role`,
`POST .../force-logout`, `POST .../reset-password`, `POST .../approve` and
`POST .../reject` — return the
[nested-message shape](README.md#the-nested-message-shape-read-this): read the string
from `data.message`, not the top-level `message`.

### About the ✅ 2FA column

Routes marked ✅ carry `@Require2FA()`. The guard challenges **only roles in
`TWO_FACTOR_ROLES`, which today is `GENERAL_MANAGER` alone**. A `SALES_ADMIN`
calling a ✅ route is waved through without a code — the decorator is a no-op for
them. When the caller *is* a General Manager, supply the code either way:

```http
X-TOTP-Code: 482913
```
or `"totpCode": "482913"` in the JSON body.

| Status | `error.code` | Cause |
| --- | --- | --- |
| 401 | `VERIFICATION_2FA_REQUIRED` | GM caller sent no code. |
| 401 | `VERIFICATION_INVALID_2FA_CODE` | Wrong code. |
| 400 | `VERIFICATION_2FA_NOT_ENABLED` | GM has not completed 2FA setup. |

### The outranking rule

Most admin operations require the caller to sit **strictly above** the target in
the hierarchy (`outranks(actorRole, targetRole)`), on top of the route's role
gate. A `SALES_ADMIN` (rank 3) can act on `REPRESENTATIVE` and `SALES_MANAGER`
but **not** on another `SALES_ADMIN` or on a `GENERAL_MANAGER`. Violations
return `403 USER_CANNOT_MODIFY_EQUAL_OR_HIGHER_ROLE` (or
`USER_INSUFFICIENT_PERMISSION` on the read route). Acting on **yourself** is
refused separately.

### Shared field: `reason`

Every destructive admin operation requires it, with identical rules:

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `reason` | string | ✅ | 10–500 chars. Must not contain `< > ; " '` (`^[^<>;'"]*$`). Recorded in the audit trail. |

---

# Self-service — `/users`

All routes: **Bearer token, any role.**

## PUT `/users/me/password`

Changes the caller's own password and, by default, terminates every other
session.

**Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `currentPassword` | string | ✅ | Any non-empty string; verified against the stored hash. |
| `newPassword` | string | ✅ | 8–128 chars, must contain lowercase + uppercase + digit + special character. |
| `logoutOtherSessions` | boolean | ❌ | Defaults to `true`. Set `false` to keep other devices signed in. |

```json
{
  "currentPassword": "Str0ng!Pass",
  "newPassword": "N3w!Str0ngPass",
  "logoutOtherSessions": true
}
```

### Response `200`

```json
{ "message": "Password changed successfully", "data": null }
```

Side effects: other sessions' access **and** refresh tokens are blacklisted and
the sessions soft-deleted; `mustChangePassword` is cleared, lifting the
provisioned-account lockdown immediately; a security notification is queued.

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | New password fails the complexity rule. |
| 400 | `USER_INCORRECT_PASSWORD` | `currentPassword` is wrong. |
| 400 | `USER_SAME_PASSWORD` | New password equals the current one. |
| 404 | `USER_NOT_FOUND` | Account vanished mid-request. |

> This is one of only two routes reachable while `mustChangePassword` is set
> (the other is `/auth/logout`). Everything else returns `403` with
> `error.code: "HTTP_EXCEPTION"` and the message *"You must change your
> temporary password before accessing this resource"*.

---

## GET `/users/me/sessions`

Active, unexpired sessions for the caller.

**Success:** `200 OK`

```json
{
  "message": "Sessions retrieved successfully",
  "data": [
    {
      "id": "8c1f…",
      "deviceId": "a1b2c3d4e5f6g7h8",
      "deviceName": "Ahmad's iPhone",
      "ipAddress": "185.42.10.7",
      "userAgent": "newpower/1.0.0 (iOS 17.2)",
      "createdAt": "2026-07-27T08:00:00.000Z",
      "expiresAt": "2026-08-03T08:00:00.000Z",
      "lastUsedAt": "2026-07-28T07:41:12.000Z",
      "archivedAt": null,
      "isActive": true,
      "isCurrent": true
    }
  ]
}
```

`deviceName`, `ipAddress`, `userAgent` and `lastUsedAt` are nullable. `isActive`
is always `true` here (the query already filters). `isCurrent` marks the session
behind the token making the request.

---

## DELETE `/users/me/sessions/{sessionId}`

Signs one device out.

**Success:** `200 OK`

| Parameter | In | Type | Required |
| --- | --- | --- | --- |
| `sessionId` | path | UUID | ✅ — validated by `ParseUUIDPipe`; a non-UUID is `400`. |

```json
{ "message": "Session revoked successfully", "data": null }
```

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `sessionId` is not a UUID. |
| 404 | `USER_SESSION_NOT_FOUND` | Unknown session, already revoked, **or belonging to another user** — the three are indistinguishable. |

---

## PATCH `/users/me/username`

**One-time only.** A username is auto-generated at registration; this replaces
it, permanently.

**Success:** `200 OK` · **Throttle:** 3 / 15 min

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `username` | string | ✅ | 6–30 chars, `^[a-z0-9]+$` — **lowercase letters and digits only**. Trimmed. Not a reserved word, not `user123`-style. |

Reserved (rejected): `admin`, `superadmin`, `system`, `root`, `administrator`,
`user`, `support`, `help`, `info`, `contact`, `official`, `verified`, `staff`,
`moderator`, `mod`, `test`, `null`, `undefined`, `delete`, `api` — plus anything
matching `^(user|test|account)\d+$`.

```json
{ "username": "ahmad123456" }
```

### Response `200`

```json
{
  "message": "Username updated successfully. This change is permanent.",
  "data": { "username": "ahmad123456" }
}
```

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Format rule. |
| 400 | `Bad Request` | Reserved word or blocked pattern. Message: *"This username is reserved and cannot be used"* / *"This username pattern is not allowed"*. Note the code here is Nest's default `Bad Request`, not `VALIDATION_ERROR` — this check runs in the service, after the DTO. |
| 400 | `USERNAME_ALREADY_CHANGED` | Already spent. Check `usernameChangedAt` on `GET /auth/me` before offering the option. |
| 409 | `USERNAME_ALREADY_EXISTS` | Taken (case-insensitive). Production adds 100–300 ms of jitter before answering. |
| 429 | `RATE_LIMIT_EXCEEDED` | > 3 attempts / 15 min. |

---

# Admin — `/admin/users`

Class gate: `@Roles(SALES_ADMIN, GENERAL_MANAGER)` — an **exact list**, so a
`SALES_MANAGER` gets `403 Forbidden` on every route here. Several routes narrow
further to `GENERAL_MANAGER`.

## POST `/admin/users`

Provisions staff directly, bypassing closed self-registration. A random password
is generated, emailed to the new user, and **never returned**. The account is
created `ACTIVE` with `emailVerified: true` and `mustChangePassword: true`.

**Role:** `GENERAL_MANAGER` (exact) · **2FA:** required · **Success:** `201 Created`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `email` | string | ✅ | Valid email, ≤ 255 chars. Trimmed, lower-cased. |
| `firstName` | string | ✅ | 1–100 chars, Latin or Arabic letters, spaces, hyphens, apostrophes. |
| `lastName` | string | ✅ | Same rules. |
| `phone` | string | ✅ | 8–20 chars, E.164 `^\+?[1-9]\d{1,14}$`. |
| `role` | enum | ✅ | `REPRESENTATIVE` \| `SALES_MANAGER` \| `SALES_ADMIN`. **`GENERAL_MANAGER` is rejected** — the top of the hierarchy is only grantable by seeding the database. |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. |

```json
{
  "email": "layla.mansour@example.com",
  "firstName": "Layla",
  "lastName": "Mansour",
  "phone": "+963955112233",
  "role": "SALES_MANAGER",
  "reason": "New regional manager for Damascus West"
}
```

### Response `201`

```json
{
  "message": "SALES_MANAGER account created; credentials emailed to the user",
  "data": {
    "id": "7b2e…",
    "email": "layla.mansour@example.com",
    "role": "SALES_MANAGER",
    "managerCode": "SM-7K3FQ9YD",
    "reissued": false
  }
}
```

- `managerCode` is issued **only** for `SALES_MANAGER`; `null` otherwise. An
  existing code is kept on re-provision — it may already be in a recruit's hands.
- `reissued: true` means the email already existed on an account that had
  **never been signed into**: a fresh password was generated and re-sent, details
  updated, old tokens revoked. The message changes to
  *"… account already existed and was never used; a new password was generated
  and emailed"*.

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Any field rule, including `role: "GENERAL_MANAGER"`. |
| 403 | `Forbidden` | Caller is not `GENERAL_MANAGER`. |
| 409 | `USER_STAFF_IDENTIFIER_TAKEN` | `details.field` is `email` (account exists **and has been used**) or `phone` (phone belongs to a different account). |
| 500 | `USER_MANAGER_CODE_GENERATION_FAILED` | Could not allocate a unique manager code after 5 attempts. Effectively unreachable; retry. |

If the email job cannot be **enqueued** (Redis down) the request fails — that is
deliberate. Successful enqueue is not proof of delivery; actual send failures
surface in the email processor and the Resend dashboard.

---

## GET `/admin/users`

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

### Query parameters — all optional

| Parameter | Type | Validation |
| --- | --- | --- |
| `status` | enum | `PENDING_VERIFICATION` \| `PENDING_APPROVAL` \| `ACTIVE` \| `SUSPENDED` \| `BANNED` |
| `role` | enum | `REPRESENTATIVE` \| `SALES_MANAGER` \| `SALES_ADMIN` \| `GENERAL_MANAGER` |
| `email` | string | Must be a valid email. |
| `search` | string | Free text. |
| `emailVerified` | boolean | `true` / `false`. |
| `twoFactorEnabled` | boolean | `true` / `false`. |
| `createdAfter` | ISO date string | e.g. `2026-01-01` or a full ISO timestamp. |
| `createdBefore` | ISO date string | Same. |
| `page` | number | ≥ 1. Default `1`. |
| `limit` | number | 1–100. Default `20`. |
| `sortBy` | enum | `createdAt` \| `lastLoginAt` \| `email` \| `firstName`. Default `createdAt`. |
| `sortOrder` | enum | `asc` \| `desc`. Default `desc`. |

Soft-deleted users are always excluded.

### Response `200`

```json
{
  "message": "Users retrieved successfully",
  "data": [
    {
      "id": "3f1a…",
      "email": "ahmad.hassan@example.com",
      "phone": "+963912345678",
      "firstName": "أحمد",
      "lastName": "حسن",
      "role": "REPRESENTATIVE",
      "status": "ACTIVE",
      "emailVerified": true,
      "twoFactorEnabled": false,
      "lastLoginAt": "2026-07-28T07:41:12.000Z",
      "createdAt": "2026-07-01T08:30:00.000Z"
    }
  ],
  "pagination": { "page": 1, "limit": 20, "total": 137, "totalPages": 7 }
}
```

`phone` and `lastLoginAt` are nullable.

---

## GET `/admin/users/{userId}`

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

| Parameter | In | Type | Required |
| --- | --- | --- | --- |
| `userId` | path | UUID | ✅ |

### Response `200`

```json
{
  "message": "User details retrieved successfully",
  "data": {
    "id": "3f1a…",
    "email": "ahmad.hassan@example.com",
    "phone": "+963912345678",
    "firstName": "أحمد",
    "lastName": "حسن",
    "role": "REPRESENTATIVE",
    "status": "ACTIVE",
    "emailVerified": true,
    "emailVerifiedAt": "2026-07-01T08:45:00.000Z",
    "phoneVerified": false,
    "phoneVerifiedAt": null,
    "twoFactorEnabled": false,
    "lastLoginAt": "2026-07-28T07:41:12.000Z",
    "lastLoginIp": "185.42.10.7",
    "createdAt": "2026-07-01T08:30:00.000Z",
    "updatedAt": "2026-07-28T07:41:12.000Z",
    "deletionRequestedAt": null,
    "deletionScheduledFor": null,
    "sessionCount": 2,
    "deviceCount": 1
  }
}
```

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `userId` is not a UUID. |
| 403 | `USER_INSUFFICIENT_PERMISSION` | Target is of equal or higher rank. |
| 404 | `USER_NOT_FOUND` | |

---

## GET `/admin/users/{userId}/deletion-status`

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

```json
{
  "message": "User deletion status retrieved successfully",
  "data": {
    "hasPendingDeletion": true,
    "deletionRequestedAt": "2026-07-20T10:00:00.000Z",
    "deletionScheduledFor": "2026-08-19T10:00:00.000Z",
    "deletionReason": "User requested account closure",
    "gracePeriodExpired": false
  }
}
```

When nothing is pending: `hasPendingDeletion: false` and the three date/reason
fields are `null`.

---

## GET `/admin/users/{userId}/activity`

Paginated admin-action audit trail for one user.

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

| Query | Type | Validation |
| --- | --- | --- |
| `page` | number | Integer ≥ 1. Default `1`. |
| `limit` | number | Integer 1–100. Default `20`. |

```json
{
  "message": "User activity retrieved successfully",
  "data": [
    {
      "id": "a91c…",
      "action": "STATUS_CHANGE",
      "adminId": "7b2e…",
      "adminEmail": "layla.mansour@example.com",
      "previousValue": { "status": "PENDING_APPROVAL" },
      "newValue": { "status": "ACTIVE" },
      "reason": "Representative registration approved",
      "ipAddress": "185.42.10.7",
      "createdAt": "2026-07-05T09:12:00.000Z"
    }
  ],
  "pagination": { "page": 1, "limit": 20, "total": 4, "totalPages": 1 }
}
```

Newest first. `previousValue`, `newValue` and `ipAddress` are nullable.

> A **rejected** representative leaves no rows here: rejection deletes the
> account, and the audit table has `ON DELETE RESTRICT` foreign keys that must be
> cleared first. Only the server-side security log records it.

---

## GET `/admin/users/{userId}/sessions`

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

Same item shape as [`GET /users/me/sessions`](#get-usersmesessions), with three
differences:

- **Expired and archived sessions are included.** `isActive` is meaningful here
  (`archivedAt === null && expiresAt > now`), unlike on the self-service route
  where it is always `true`.
- **Deduplicated by device**: only the most recent session per device
  fingerprint is returned. Sessions with no `deviceId` are each kept
  individually.
- `isCurrent` marks the target user's **most recently used active session**, not
  the admin's own — the admin is looking at someone else's device list.

Ordered by `lastUsedAt` (nulls last) then `createdAt`, descending.

---

## GET `/admin/users/{userId}/devices`

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **Success:** `200 OK`

```json
{
  "message": "User devices retrieved successfully",
  "data": [
    {
      "id": "d41f…",
      "deviceId": "a1b2c3d4e5f6g7h8",
      "deviceName": "Ahmad's iPhone",
      "deviceModel": "iPhone 14 Pro",
      "osName": "ios",
      "osVersion": "iOS 17.2",
      "verificationStatus": "VERIFIED",
      "isTrusted": true,
      "lastActiveAt": "2026-07-28T07:41:12.000Z",
      "createdAt": "2026-07-01T08:30:00.000Z"
    }
  ]
}
```

Only live (non-revoked) bindings, newest first.

- `id` is the **binding** id (device ↔ account), not the hardware device row —
  it is not the value you pass to `DELETE /admin/users/{userId}/devices`, which
  takes the `deviceId` fingerprint.
- `osName` is the device *type* (`android` / `ios` / `web`).
- `deviceName`, `deviceModel`, `osName`, `osVersion` and `lastActiveAt` are
  nullable.

---

## DELETE `/admin/users/{userId}/devices`

Unlinks one device or all of them, and revokes **every** token for the user.

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **2FA:** required · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `deviceId` | string | ❌ | The device fingerprint. **Omit to unlink every device.** |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. |

```json
{ "deviceId": "a1b2c3d4e5f6g7h8", "reason": "Reported stolen by the user" }
```

### Response `200`

```json
{ "message": "Device unlinked successfully", "data": { "unlinkedCount": 1 } }
```

With no `deviceId` the message becomes
*"All devices unlinked successfully (3 device(s))"*.

`unlinkedCount: 0` with a `200` means nothing matched — this is **not** an error.

The hardware `Device` row survives, so other users sharing the same phone are
unaffected.

| Status | `error.code` | Cause |
| --- | --- | --- |
| 403 | `USER_CANNOT_MODIFY_OWN_STATUS` | Targeting yourself. |
| 403 | `USER_CANNOT_MODIFY_EQUAL_OR_HIGHER_ROLE` | Target is not outranked. |
| 404 | `USER_NOT_FOUND` | |

---

## PUT `/admin/users/{userId}/status`

Suspend, ban, or reactivate.

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **2FA:** required · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `status` | enum | ✅ | `PENDING_VERIFICATION` \| `PENDING_APPROVAL` \| `ACTIVE` \| `SUSPENDED` \| `BANNED`. |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. |
| `notifyUser` | boolean | ❌ | Default `true`. Only suppresses the **suspend/ban** notification. |

```json
{ "status": "SUSPENDED", "reason": "Repeated policy violations in Q3", "notifyUser": true }
```

### Response `200` — **nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "User status updated to SUSPENDED" }
}
```

Side effects: the auth cache is invalidated so the change bites immediately; for
`SUSPENDED`/`BANNED` all tokens are blacklisted; reactivation to `ACTIVE` always
notifies, regardless of `notifyUser`.

| Status | `error.code` | Cause |
| --- | --- | --- |
| 403 | `USER_CANNOT_MODIFY_OWN_STATUS` | Targeting yourself. |
| 403 | `USER_CANNOT_MODIFY_EQUAL_OR_HIGHER_ROLE` | Target is not outranked. |
| 404 | `USER_NOT_FOUND` | |

---

## PUT `/admin/users/{userId}/role`

**Role:** `GENERAL_MANAGER` (exact) · **2FA:** required · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `role` | enum | ✅ | `REPRESENTATIVE` \| `SALES_MANAGER` \| `SALES_ADMIN`. `GENERAL_MANAGER` is rejected at validation. |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. |

```json
{ "role": "SALES_MANAGER", "reason": "Promoted to lead the Homs team" }
```

### Response `200` — **nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "User role updated to SALES_MANAGER" }
}
```

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `role: "GENERAL_MANAGER"` or unknown role. |
| 403 | `Forbidden` | Caller is not `GENERAL_MANAGER` (guard). |
| 403 | `USER_INSUFFICIENT_PERMISSION` | Service-layer re-check of the same rule. |
| 403 | `USER_CANNOT_MODIFY_OWN_ROLE` | Targeting yourself — no self-promotion. |
| 403 | `USER_CANNOT_PROMOTE_TO_GENERAL_MANAGER` | Defence-in-depth behind the DTO. |
| 404 | `USER_NOT_FOUND` | |

---

## POST `/admin/users/{userId}/force-logout`

Revokes every session for the target.

**Role:** `SALES_ADMIN`, `GENERAL_MANAGER` · **2FA:** required · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `reason` | string | ❌ | Free text, **not** validated. Defaults to `"Admin force logout"` when absent or empty. |

```json
{ "reason": "Credential sharing suspected" }
```

### Response `200` — **nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "User has been logged out from all sessions" }
}
```

---

## POST `/admin/users/{userId}/reset-password`

Blind reset: a temporary password is generated and delivered **to the user
only**. The caller receives confirmation and nothing else.

**Role:** `GENERAL_MANAGER` (exact) · **2FA:** required · **Success:** `200 OK`

**Request body:** none.

### Response `200` — **nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "Password reset successfully. Temporary password sent to user via notification." }
}
```

The temporary password is never in the response, the logs, or the audit trail.

---

## POST `/admin/users/bulk/status`

Up to 50 accounts in one call. **Partial success is normal** — a `200` does not
mean every user was updated.

**Role:** `GENERAL_MANAGER` (exact) · **2FA:** required · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `userIds` | string[] | ✅ | 1–50 entries, each a UUID v4. Must not contain the caller's own id. |
| `status` | enum | ✅ | `PENDING_VERIFICATION` \| `PENDING_APPROVAL` \| `ACTIVE` \| `SUSPENDED` \| `BANNED`. |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. |

```json
{
  "userIds": ["3f1a2b4c-5d6e-7f80-9012-3456789abcde", "8d7c6b5a-4e3f-2a10-9876-5432109fedcb"],
  "status": "SUSPENDED",
  "reason": "Territory audit — accounts frozen pending review"
}
```

### Response `200`

```json
{
  "message": "Bulk status update completed",
  "data": {
    "successful": 1,
    "failed": 1,
    "errors": [
      { "userId": "8d7c6b5a-4e3f-2a10-9876-5432109fedcb", "error": "User not found" }
    ]
  }
}
```

Per-user `error` strings you will see: `"User not found"`, `"Cannot modify
another general manager"`, or the underlying exception message. **Always inspect
`failed` and `errors`.**

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Empty array, > 50 ids, non-UUID entry, bad reason. |
| 403 | `USER_CANNOT_MODIFY_OWN_STATUS` | Your own id is in `userIds` — the whole call is rejected before anything is written. |

Batches over 10 users raise the security-log severity.

---

# Approval queue — `/representatives`

Gate: `@MinRole(SALES_MANAGER)` — rank 2 and above. Scoping *within* the queue is
enforced in the service:

- `SALES_MANAGER` sees and acts on **only their own recruits** (those who
  registered with their manager code).
- `SALES_ADMIN` and `GENERAL_MANAGER` see and act on **the entire queue** — an
  escalation path so a departed manager cannot strand a recruit forever. An
  escalated approval also adopts an unassigned recruit onto the approver.

## GET `/representatives/my-manager-code`

The code the caller reads out to recruits.

**Role:** `SALES_MANAGER`+ · **Success:** `200 OK`

```json
{
  "message": "Manager code retrieved successfully",
  "data": { "managerCode": "SM-7K3FQ9YD" }
}
```

`managerCode` is `null` for roles that do not carry one (a `SALES_ADMIN` or
`GENERAL_MANAGER` who was never provisioned as a manager). `404 USER_NOT_FOUND`
if the account is gone.

---

## GET `/representatives/pending`

**Role:** `SALES_MANAGER`+ · **Success:** `200 OK`

```json
{
  "message": "Pending representatives retrieved successfully",
  "data": [
    {
      "id": "3f1a2b4c-5d6e-7f80-9012-3456789abcde",
      "firstName": "أحمد",
      "lastName": "حسن",
      "email": "ahmad.hassan@example.com",
      "phone": "+963912345678",
      "managerId": "7b2e…",
      "createdAt": "2026-07-01T08:30:00.000Z",
      "emailVerifiedAt": "2026-07-01T08:45:00.000Z"
    }
  ]
}
```

Oldest first. Not paginated. Only `REPRESENTATIVE` accounts in
`PENDING_APPROVAL` that are not soft-deleted. `managerId` and `emailVerifiedAt`
are nullable.

---

## POST `/representatives/{representativeId}/approve`

Sets the account `ACTIVE` — the only path out of `PENDING_APPROVAL`.

**Role:** `SALES_MANAGER`+ · **Success:** `200 OK` · **Request body:** none.

| Parameter | In | Type | Required |
| --- | --- | --- | --- |
| `representativeId` | path | UUID | ✅ |

**Response `200` — nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "Representative approved successfully" }
}
```

Side effects: `approvedAt` / `approvedBy` stamped; an unassigned recruit is
adopted by the approver; the auth cache is invalidated so the rep can log in
immediately; an in-app notification is queued; an audit row is written.

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Not a UUID. |
| 403 | `USER_NOT_ASSIGNED_MANAGER` | A Sales Manager acting on another manager's recruit. |
| 404 | `USER_NOT_FOUND` | Unknown or soft-deleted. |
| 409 | `USER_NOT_PENDING_APPROVAL` | Not awaiting approval — message names the current status. |

---

## POST `/representatives/{representativeId}/reject`

⚠️ **Deletes the account.** Not a soft delete.

**Role:** `SALES_MANAGER`+ · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `reason` | string | ✅ | 10–500 chars, no `< > ; " '`. Trimmed. Included in the rejection email. |

```json
{ "reason": "Duplicate application, already registered under another manager" }
```

### Response `200` — **nested message** (see [README](README.md#the-nested-message-shape-read-this))

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "Representative rejected and account removed" }
}
```

Consequences worth knowing:

- The rejection email is sent **before** deletion — after it, the address is gone.
- `user_admin_logs` rows are deleted first (`ON DELETE RESTRICT`), so **no audit
  row survives**. Only the server-side security log records the rejection.
- The email and phone are freed: the same person can register again immediately
  with the same manager code.

Same error set as `approve`.

---

# Workflows

## 1. Approving a recruit

```
Rep                      Sales Manager                    API
 |                            |                            |
 |  (registers + verifies email — see auth.md workflow 1)   |
 |                            |                            |
 |                            |-- GET /representatives/pending -->
 |                            |<-- [ { id, firstName, email, … } ]
 |                            |                            |
 |                            |-- POST /representatives/{id}/approve -->
 |                            |<-- 200                     |
 |                            |    status → ACTIVE, cache invalidated
 |                            |                            |
 |-- POST /auth/login ------------------------------------>|
 |<-- 200 LOGIN_SUCCESS -----------------------------------|
```

Getting the code to the recruit in the first place:
`GET /representatives/my-manager-code` → read it out → the recruit types it into
`managerCode` at registration.

To reject instead: `POST /representatives/{id}/reject` with a reason ≥ 10
characters. The account is deleted and the person may re-apply.

## 2. Provisioning a staff account

```
General Manager                              New user
 |                                              |
 |-- POST /admin/users  (X-TOTP-Code) --------->|
 |   { email, firstName, lastName, phone,       |
 |     role, reason }                           |
 |<-- 201 { id, role, managerCode, reissued }   |
 |                              ✉ temp password sent to the user
 |                                              |
 |                    POST /auth/login  ------->|  → 200 LOGIN_SUCCESS
 |                    GET  /territories ------->|  → 403 "You must change your
 |                                              |        temporary password…"
 |                    PUT  /users/me/password ->|  → 200, lockdown lifted
```

- Creating a `SALES_MANAGER` also mints their manager code, returned in `data`.
- Called again for an account that was **never signed into**: a new password is
  generated and re-sent, and `reissued: true` comes back. Once the account has
  been used, a repeat is `409 USER_STAFF_IDENTIFIER_TAKEN`.
- The new user still needs their `deviceId` on `/auth/login` and `X-Device-Id`
  afterwards, exactly like a self-registered rep.

## 3. Suspending an account and cutting it off

```
PUT  /admin/users/{id}/status   { status: "SUSPENDED", reason: "…" }   (X-TOTP-Code if GM)
     → all tokens blacklisted, auth cache invalidated, user notified
POST /admin/users/{id}/force-logout   { reason: "…" }        ← optional, sessions already gone
DELETE /admin/users/{id}/devices      { reason: "…" }        ← forces re-binding on return
```

Reactivating is the same status route with `status: "ACTIVE"`; the user is always
notified. Remember the outranking rule: a `SALES_ADMIN` cannot touch another
`SALES_ADMIN` or the `GENERAL_MANAGER`.

## 4. Investigating an account

```
GET /admin/users?search=ahmad&status=ACTIVE     → find the id
GET /admin/users/{id}                            → profile, counts, last login IP
GET /admin/users/{id}/sessions                   → every session, live and dead
GET /admin/users/{id}/devices                    → current bindings
GET /admin/users/{id}/activity?page=1&limit=50   → who changed what, and why
GET /admin/users/{id}/deletion-status            → pending closure?
```

Every write in this module records `reason`, actor, IP and correlation ID — the
activity endpoint is where that comes back out.

## 5. Self-service session hygiene

```
GET    /users/me/sessions               → isCurrent marks this device
DELETE /users/me/sessions/{sessionId}   → sign that one device out
PUT    /users/me/password               → change password, drop every other session
```

`PUT /users/me/password` with `logoutOtherSessions: false` keeps other devices
signed in — the default is to terminate them.
