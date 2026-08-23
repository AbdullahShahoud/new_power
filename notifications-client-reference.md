# Notifications — `/notifications`, `/device/fcm-token`, `/admin/notifications`

Read [README.md](README.md) first: the response envelope, the mandatory
`X-Device-Id` header, the role hierarchy and the error format are defined there.

This is the **frontend contract** for the notification surface: the in-app inbox,
the push-token handshake, the preferences screen (including the **language
switch**), and the admin broadcast workflow.

---

## 0. The one thing that will surprise you

**Changing the language re-renders the user's ENTIRE notification history, not
just what arrives afterwards.**

A notification is not stored as a finished sentence. The row stores *which*
message it is (`templateKey`) and *what filled its blanks* (`templateParams`),
and the server renders it on the way out against the reader's current
`language` preference. So:

```
PATCH /notifications/preferences   { "language": "ar" }
GET   /notifications               → every row, including last year's, in Arabic
```

Consequences for the client:

- **Do not cache notification text across a language change.** Re-fetch the list
  after a successful `PATCH /notifications/preferences` that includes `language`.
  The `id`s are stable; only `title` and `message` change.
- **Do not translate `title`/`message` yourself.** They arrive ready to display.
- **You never see `templateKey` or `templateParams`.** They are rendering inputs
  and are deliberately stripped from every response.
- **One exception: admin broadcasts.** An admin types free text in one language,
  and there is nothing to translate it from — those rows read the same in `EN`
  and `AR` forever. You cannot tell which is which from the response, and you
  should not try to.

Push notifications are rendered at **delivery** time, in whatever language the
recipient's preference says at that moment.

---

## Endpoint index

| Method | Path | Role |
| --- | --- | --- |
| GET | [`/notifications`](#get-notifications) | any authenticated (paginated) |
| GET | [`/notifications/unread-count`](#get-notificationsunread-count) | any authenticated |
| GET | [`/notifications/preferences`](#get-notificationspreferences) | any authenticated |
| PATCH | [`/notifications/preferences`](#patch-notificationspreferences) | any authenticated |
| PATCH | [`/notifications/{id}/read`](#patch-notificationsidread) | owner |
| PATCH | [`/notifications/read-all`](#patch-notificationsread-all) | any authenticated |
| DELETE | [`/notifications/{id}`](#delete-notificationsid) | owner |
| PUT | [`/device/fcm-token`](#put-devicefcm-token) | any authenticated |
| DELETE | [`/device/fcm-token`](#delete-devicefcm-token) | any authenticated |
| POST | [`/admin/notifications/broadcast`](#post-adminnotificationsbroadcast) | `SALES_ADMIN`, `GENERAL_MANAGER` |
| POST | [`/admin/notifications/broadcast/{requestId}/approve`](#post-adminnotificationsbroadcastrequestidapprove) | `SALES_ADMIN`, `GENERAL_MANAGER` |
| POST | [`/admin/notifications/broadcast/{requestId}/reject`](#post-adminnotificationsbroadcastrequestidreject) | `SALES_ADMIN`, `GENERAL_MANAGER` |
| GET | [`/admin/notifications/broadcast/pending`](#get-adminnotificationsbroadcastpending) | `SALES_ADMIN`, `GENERAL_MANAGER` |
| GET | [`/admin/notifications/broadcast/history`](#get-adminnotificationsbroadcasthistory) | `SALES_ADMIN`, `GENERAL_MANAGER` (paginated) |
| GET | [`/admin/notifications/broadcast/{requestId}`](#get-adminnotificationsbroadcastrequestid) | `SALES_ADMIN`, `GENERAL_MANAGER` |
| POST | [`/admin/notifications/test-fcm`](#post-adminnotificationstest-fcm) | **`GENERAL_MANAGER` (exact)** |

> The two literal `broadcast/*` paths — `pending` and `history` — are declared
> before `broadcast/{requestId}`, which is what keeps them reachable: Express
> matches in registration order, so a parameter route declared first swallows
> every literal after it.

---

## 1. Shared shapes

### 1.1 The notification object

Returned by `GET /notifications` (as an array) and by
`PATCH /notifications/{id}/read` (as a single object).

```json
{
  "id": "clx8f2k1p0001abcd1234efgh",
  "type": "SYSTEM",
  "status": "UNREAD",
  "title": "A win is waiting for your confirmation",
  "message": "Omar Haddad reported a win on Villa Rawda. It counts for nothing until you confirm it.",
  "metadata": {
    "projectId": "a3f1…",
    "outcomeId": "77c2…",
    "outcomeType": "WON",
    "submittedBy": "9d4e…"
  },
  "readAt": null,
  "createdAt": "2026-08-22T06:01:24.954Z"
}
```

| Field | Type | Notes |
| --- | --- | --- |
| `id` | `string` (cuid) | Stable across language changes. |
| `type` | `SECURITY` \| `SYSTEM` \| `MARKETING` | The mute stream. See [§1.2](#12-notification-types). |
| `status` | `UNREAD` \| `READ` \| `ARCHIVED` | Archived rows are excluded from the list. |
| `title` | `string` | **Already localised.** Display as-is. |
| `message` | `string` | **Already localised.** Display as-is. |
| `metadata` | `object \| null` | Deep-link payload. Shape varies by notification — see [§3](#3-notification-catalogue). Always defensive-read it. |
| `readAt` | ISO 8601 \| `null` | |
| `createdAt` | ISO 8601 | Default sort key, newest first. |

`metadata` is the **only** field you should branch on for deep-linking. It is
free-form JSON per notification kind and new keys may be added.

### 1.2 Notification types

Exactly three, and each maps to one toggle on the preferences screen:

| `type` | Preference key | What produces it |
| --- | --- | --- |
| `SECURITY` | `securityEnabled` | Password changed, 2FA enabled, account suspended / banned / reactivated, admin password reset. |
| `SYSTEM` | `systemEnabled` | Everything operational: approvals, transfers, outcome settlement, territory assignment. |
| `MARKETING` | `marketingEnabled` | Admin broadcasts only. **Off by default.** |

There is no `TRANSACTION` type. If your client still has one, remove it — the
server rejects it with `400 VALIDATION_ERROR` on `GET /notifications?type=…`.

### 1.3 How muting actually behaves

`isTypeEnabled` is checked **at send time**, and a muted stream is not stored at
all — no in-app row, no push. Turning `systemEnabled` back on does **not**
back-fill what was missed. Say so in the UI if you offer the toggle.

`pushEnabled` is a separate, narrower switch: it suppresses the push only. The
in-app row is still created, so the inbox stays complete.

---

## 2. Endpoints

### GET `/notifications`

The inbox. Paginated, archived rows excluded.

**Query**

| Param | Type | Default | Rules |
| --- | --- | --- | --- |
| `type` | enum | — | `SECURITY` \| `SYSTEM` \| `MARKETING` |
| `status` | enum | — | `UNREAD` \| `READ` \| `ARCHIVED` |
| `page` | int | `1` | `≥ 1` |
| `limit` | int | `20` | `1…100` |
| `sortBy` | enum | `createdAt` | `createdAt` \| `type` |
| `sortOrder` | enum | `desc` | `asc` \| `desc` |

> `status=ARCHIVED` is accepted by validation but returns nothing: the query
> also filters `archivedAt: null`, and the two conditions cannot both hold.
> There is no way to list archived notifications.

**200**

```json
{
  "message": "Notifications retrieved successfully",
  "data": [ /* notification objects, §1.1 */ ],
  "pagination": { "total": 42, "page": 1, "limit": 20, "totalPages": 3 }
}
```

---

### GET `/notifications/unread-count`

For the badge. Redis-cached for 5 minutes, invalidated on every read/archive/send,
so it is safe to poll but rarely needs to be.

**200**

```json
{ "message": "Unread count retrieved successfully", "data": { "count": 7 } }
```

---

### GET `/notifications/preferences`

Creates the preference row with defaults on first call (upsert), so this never
404s.

**200**

```json
{
  "message": "Notification preferences retrieved successfully",
  "data": {
    "securityEnabled": true,
    "systemEnabled": true,
    "marketingEnabled": false,
    "pushEnabled": true,
    "language": "EN"
  }
}
```

---

### PATCH `/notifications/preferences`

**The configuration endpoint.** Every field is optional — send only what changed.
A language switch is a one-key body.

**Body**

| Field | Type | Rules |
| --- | --- | --- |
| `securityEnabled` | boolean | optional |
| `systemEnabled` | boolean | optional |
| `marketingEnabled` | boolean | optional |
| `pushEnabled` | boolean | optional |
| `language` | `"EN"` \| `"AR"` | optional, **case-insensitive** — `"ar"` and `"AR"` both work |

```json
{ "language": "ar" }
```

**200** — returns the full preference object, same shape as the GET:

```json
{
  "message": "Notification preferences updated successfully",
  "data": {
    "securityEnabled": true,
    "systemEnabled": true,
    "marketingEnabled": false,
    "pushEnabled": true,
    "language": "AR"
  }
}
```

**After a language change, re-fetch `GET /notifications`** — see
[§0](#0-the-one-thing-that-will-surprise-you). The count from
`/unread-count` is unaffected.

**400** — an unrecognised language:

```json
{
  "success": false,
  "message": "language must be one of: EN, AR",
  "error": { "code": "VALIDATION_ERROR", "statusCode": 400 }
}
```

> This endpoint governs **notification** language only. It does not change API
> error messages, email language, or catalogue content — the catalogue ships
> both languages on every response and is selected client-side
> ([catalog-client-reference.md §1.8](catalog-client-reference.md#18-every-text-field-is-bilingual)).

---

### PATCH `/notifications/{id}/read`

Marks one notification read and returns it, **localised** in the caller's current
language.

**200**

```json
{ "message": "Notification marked as read", "data": { /* notification object, §1.1 */ } }
```

**404** `NOTIFICATION_NOT_FOUND` — unknown id, or not the caller's.

---

### PATCH `/notifications/read-all`

**200**

```json
{ "message": "All notifications marked as read", "data": { "count": 7 } }
```

`count` is how many rows changed — `0` is a normal answer, not an error.

---

### DELETE `/notifications/{id}`

Archive (soft delete). The row stops appearing in `GET /notifications` and stops
counting toward the badge; it is not recoverable through the API.

**200** — **`nested message`**, per
[README §3](README.md#the-nested-message-shape-read-this):

```json
{ "success": true, "message": "Success", "data": { "message": "Notification archived successfully" } }
```

**404** `NOTIFICATION_NOT_FOUND`.

---

### PUT `/device/fcm-token`

Registers or replaces the push token **for the calling device** — the device is
taken from the JWT, not from the body, so a client can only ever set its own.

**Body**

| Field | Type | Rules |
| --- | --- | --- |
| `fcmToken` | string | required, ≤ 1024 chars, `[A-Za-z0-9_:-]` only |

**200**

```json
{ "message": "FCM token registered successfully", "data": { "registered": true } }
```

Call this after every Firebase token refresh. A token Firebase reports as stale
is pruned server-side on the next send, so you do not need to clean up.

---

### DELETE `/device/fcm-token`

Clears the token for the calling device. Call on sign-out, or push keeps
arriving on a signed-out phone.

**200**

```json
{ "message": "FCM token removed successfully", "data": { "removed": true } }
```

---

## 3. Notification catalogue

Every notification the system raises, what triggers it, who receives it, and what
`metadata` carries for deep-linking. Titles shown in English; the Arabic
rendering arrives automatically when `language` is `AR`.

### Security (`type: "SECURITY"`)

| Trigger | Recipient | `metadata` |
| --- | --- | --- |
| Password changed (self-service or reset) | the user | `{ action }` or `{ type, timestamp, loggedOutOtherSessions }` |
| Two-factor authentication enabled | the user | `{ type, timestamp }` |
| Account suspended / banned by an admin | the user | `{ previousStatus, newStatus }` |
| Account reactivated | the user | `{ previousStatus, newStatus }` |
| Admin reset the user's password | the user | `{ resetBy, adminId }` |

### Onboarding & sales force (`type: "SYSTEM"`)

| Trigger | Recipient | `metadata` |
| --- | --- | --- |
| A recruit verified their email and awaits approval | **their Sales Manager** | `{ representativeId }` |
| Manager approved the account | the representative | `{ approvedBy }` |
| Representative transferred to another manager | **all three** — the rep, the receiving manager, the releasing manager — with three different messages | `{ reason, fromManagerName, toManagerName }` |

### Project & funnel (`type: "SYSTEM"`)

The four-eyes settlement loop. These are the only project events that notify:
until a second person confirms, no number in any report has moved.

| Trigger | Recipient | `metadata` |
| --- | --- | --- |
| Outcome submitted (`WON` / `LOST`) | **the submitter's current manager** | `{ projectId, outcomeId, outcomeType, submittedBy }` |
| Outcome confirmed | the submitter | `{ projectId, outcomeId, outcomeType, confirmedBy }` |
| Outcome rejected | the submitter — **not sent when a rep rejects their own submission** | `{ projectId, outcomeId, outcomeType, rejectedBy }` |

Deep-link target: `projectId`, then `outcomeId` within it.

Recipients are resolved **at delivery time from the current reporting line**. A
rep transferred between claiming a win and its confirmation has the notification
follow them to the new manager. A rep with no manager produces no notification
at all — the outcome then sits `PENDING` until someone notices.

### Territory (`type: "SYSTEM"`)

| Trigger | Recipient | `metadata` |
| --- | --- | --- |
| Territory assigned | the representative | `{ territoryId, assignmentId, assignedBy }` |
| Territory unassigned | the representative | `{ territoryId, assignmentId, unassignedBy }` |

Both messages carry the territory **name and code** (`Al-Mazzeh (DAM-MAZ-86)`) —
names collide in the field, codes do not.

A reassignment is an unassign followed by an assign, so the losing rep and the
gaining rep each get their own message. Territory create / update / archive
notify nobody.

Deep-link target: `territoryId`. Expect the rep's territory list to have changed
— refresh `GET /territories/me`.

### Broadcast (`type` chosen by the admin)

Free text from an admin. **Not localised** — see [§0](#0-the-one-thing-that-will-surprise-you).
`metadata` is whatever the admin supplied, or absent.

---

## 4. Admin: broadcasts

Gated at `@Roles(SALES_ADMIN, GENERAL_MANAGER)` — exact match, so a
`SALES_MANAGER` gets `403` even though they outrank a representative.

### The four-eyes rule

A broadcast estimated to reach **more than 100 users** cannot be sent by one
admin. The request is parked as `PENDING` and a second admin must approve it.
At or below 100 it executes immediately.

```
POST /admin/notifications/broadcast
   ├── ≤ 100 users → 200, sent
   └── > 100 users → 202, PENDING, needs a second admin
                         ├── POST …/{requestId}/approve → sent
                         ├── POST …/{requestId}/reject   → dead
                         └── 24 h with neither          → EXPIRED
```

Also enforced: **3 broadcasts per hour per admin** (service level) and 10
requests per minute (endpoint throttle).

### POST `/admin/notifications/broadcast`

**Body**

| Field | Type | Rules |
| --- | --- | --- |
| `title` | string | required, 1–100 chars, **no `< > ; " '`** |
| `message` | string | required, 1–500 chars, **no `< > ; " '`** |
| `type` | enum | required — `SECURITY` \| `SYSTEM` \| `MARKETING` |
| `metadata` | object | optional |
| `targetRoles` | `UserRole[]` | optional; omit for all roles |
| `targetStatuses` | `UserStatus[]` | optional; **defaults to `ACTIVE` only** |

The character restriction is an anti-injection guard and it rejects ordinary
apostrophes — `"Don't miss it"` is a `400`. Word your copy around it.

**200** — executed immediately (≤ 100 users):

```json
{
  "message": "Broadcast notification sent successfully",
  "data": {
    "requestId": "3f2a…",
    "totalUsers": 84,
    "notificationsCreated": 84,
    "pushSuccessCount": 71,
    "pushFailureCount": 13
  }
}
```

`notificationsCreated` is usually **lower than** `totalUsers` — recipients who
muted that stream get no row. `pushFailureCount` counts stale and unreachable
tokens and is not an error.

**202** — approval required (> 100 users). Note this arrives as an *error-shaped*
body despite being a success path:

```json
{
  "success": false,
  "message": "Broadcast requires approval from another admin",
  "error": {
    "code": "BROADCAST_APPROVAL_REQUIRED",
    "statusCode": 202,
    "details": {
      "requestId": "8c14…",
      "estimatedUsers": 312,
      "message": "This broadcast will reach 312 users and requires approval from another admin before it can be sent."
    }
  }
}
```

**Handle `202` as success-pending, not failure.** Read `details.requestId` and
show "waiting for a second admin".

**429** `BROADCAST_RATE_LIMIT_EXCEEDED` — includes minutes remaining.

### POST `/admin/notifications/broadcast/{requestId}/approve`

The approver must be **a different admin on a different device** from the
initiator. Approving executes the broadcast in the same call.

**200** — same `data` shape as an immediate send.

Errors: `404 BROADCAST_REQUEST_NOT_FOUND`, `400 BROADCAST_ALREADY_PROCESSED`,
`400 BROADCAST_EXPIRED`, plus the self-approval / same-device rejections.

### POST `/admin/notifications/broadcast/{requestId}/reject`

**Body:** `{ "reason": "…" }`

**200** — returns the rejected request.

### GET `/admin/notifications/broadcast/pending`

**200** — array of pending requests, unpaginated.

### GET `/admin/notifications/broadcast/{requestId}`

**200** — one request with its approval trail.

### GET `/admin/notifications/broadcast/history`

Paginated (`page`, `limit`), newest first. Uses the standard `pagination`
envelope from [README §3](README.md#3-response-envelope).

### POST `/admin/notifications/test-fcm`

`GENERAL_MANAGER` only. Sends a raw push, bypassing preferences and storing no
in-app row — a delivery-path smoke test, not a way to message a user.

**Body:** `{ "title", "body" }` plus **exactly one** of `userId` or `token`.
Sending both, or neither, is a `400`.

**200**

```json
{
  "message": "FCM test notification sent",
  "data": { "successCount": 1, "failureCount": 0, "results": [], "staleTokens": [] }
}
```

---

## 5. Client checklist

1. **After login** — `PUT /device/fcm-token` with the Firebase token; re-send on
   every token refresh.
2. **After sign-out** — `DELETE /device/fcm-token`.
3. **Badge** — `GET /notifications/unread-count`; refresh after any read/archive.
4. **Inbox** — `GET /notifications`; display `title`/`message` verbatim, never
   translate client-side.
5. **Deep-link** — branch on `metadata` (`projectId` / `outcomeId` /
   `territoryId` / `representativeId`), never on `title`.
6. **Language switch** — `PATCH /notifications/preferences` with `{ "language" }`,
   then **discard cached notification text and re-fetch the list**.
7. **Push payload** — `data.type`, `data.templateKey` and `data.notificationId`
   ride on the FCM message; use `notificationId` to mark read on tap.
8. **Muting** — explain that a muted stream is dropped, not queued; re-enabling
   back-fills nothing.
