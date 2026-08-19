# Mobile API Integration Specification — Notifications
### The `REPRESENTATIVE` surface

**Scope:** the in-app notification inbox, unread badge, read/archive actions, preferences, and FCM push-token lifecycle.
**Source of truth:** `src/notification/**`, `src/device/device.controller.ts`, `src/queue/**`, `prisma/schema.prisma`.
**Companion:** [catalog-mobile-integration.md](catalog-mobile-integration.md) §2–§3 (base URL, auth headers, refresh, rate limit) applies unchanged and is **not repeated**.

### Label key

| Label | Meaning |
| --- | --- |
| **[C]** | Confirmed — readable directly in the backend source. |
| **[I]** | Inferred — implied by the code, not stated. |
| **REQUIRES BACKEND CONFIRMATION** | Not determinable from the source. |

---

## 1. Backend overview

**[C]** Notifications have **two delivery channels driven by one write path**:

```
   business event (approval, password change, suspension, …)
              ↓
   QueueService.sendNotification()          ← encrypted + signed BullMQ job
              ↓
   NotificationProcessor                     ← asynchronous worker
              ↓
   NotificationService.sendNotification()
        ├── preference check (isTypeEnabled)
        ├── in-app row  → `notifications` table    (if prefs.inApp)
        ├── FCM push    → all ACTIVE device tokens (if prefs.push)
        └── invalidate Redis unread-count cache
```

⚠️ **[C] Delivery is asynchronous.** The event that triggers a notification returns to its caller *before* the notification exists. Every producer wraps the enqueue in `try/catch` and only logs on failure — **a notification is best-effort and can be silently lost**.

**[I] Mobile consequence:** never treat "I performed action X, therefore a notification exists" as a certainty, and never poll immediately after an action expecting a row.

**[C]** The in-app row and the push are **independent**: `inApp = typeEnabled`, `push = typeEnabled && pushEnabled`. A push failure is caught and never fails the in-app write. **[I]** So a user can have the row without the push, but never the push without the row.

---

## 2. Endpoint map

### 2.1 Reachable by a `REPRESENTATIVE`

⚠️ **[C]** `NotificationController` carries **no `@MinRole` and no `@Roles`** decorator. `JwtAuthGuard` and `RolesGuard` are registered globally (`APP_GUARD` in `AuthModule`), and with no role metadata `RolesGuard` lets **every authenticated role** through. All five routes are open to a rep.

| # | Method | Path | Purpose |
| --- | --- | --- | --- |
| N1 | `GET` | `/notifications` | Paginated inbox |
| N2 | `GET` | `/notifications/unread-count` | Badge count (Redis-cached) |
| N3 | `GET` | `/notifications/preferences` | **Read-only** — see §2.3 |
| N4 | `PATCH` | `/notifications/{id}/read` | Mark one as read |
| N5 | `PATCH` | `/notifications/read-all` | Mark all as read |
| N6 | `DELETE` | `/notifications/{id}` | Archive (soft-delete) |
| D1 | `PUT` | `/device/fcm-token` | Register / update the push token |
| D2 | `DELETE` | `/device/fcm-token` | Remove the push token |

⚠️ **[C] The FCM routes are on `/device` — singular.** `@Controller('device')`. Not `/devices`.

### 2.2 Not reachable — admin only

**[C]** `NotificationAdminController` is `@Controller('admin/notifications')` gated `@Roles(SALES_ADMIN, GENERAL_MANAGER)` — broadcast, approve/reject broadcast, pending list, history, and `test-fcm` (`GENERAL_MANAGER` only). A rep receives broadcasts but **cannot see or manage any of this**.

### 2.3 ⚠️ Preferences are READ-ONLY — there is no update route

**[C]** This is the most important gap on this surface.

- `UpdatePreferencesDto` exists (`src/notification/dto/update-preferences.dto.ts`).
- `NotificationPreferenceService.updatePreferences()` exists and is fully implemented.
- **No controller anywhere calls it.** Searching every `*.controller.ts` for `preferences` returns only the `@Get('preferences')` handler.

**There is no `PATCH`/`PUT /notifications/preferences`.** A user can **read** their preferences and **never change them**.

**[I] Mobile consequence:** you cannot ship a working notification-settings screen. Either
(a) render the five flags **read-only** with a note that they are managed by the back office, or
(b) omit the settings screen entirely until the route exists.
**Do not build toggles that call a non-existent endpoint.** See §12-Q1.

### 2.4 ⚠️ Absent from Swagger

**[C]** `NotificationController` has no `@ApiTags`, no `@ApiBearerAuth`, no `@ApiOperation` anywhere. It appears in `/api/docs` only as an untagged default group. **[I] This document is the contract** — the Swagger page is not.

---

## 3. Authentication & headers

| Header | Required | Value |
| --- | --- | --- |
| `Authorization` | Yes | `Bearer <accessToken>` |
| `X-Device-Id` | Yes | Must equal the token's `deviceId` claim |
| `Content-Type` | On `PUT /device/fcm-token` | `application/json` |

**[C]** `PUT /device/fcm-token` reads `deviceId` from `@CurrentUser('deviceId')` — i.e. **from the JWT claim**, not the header. But the header must still match the claim, or `JwtStrategy` rejects the request with `401 DEVICE_ID_MISMATCH` first.

**[C]** Rate limit: **30 requests / 60 s per user**, shared with the catalogue and directory surfaces.

⚠️ **[I]** A badge poller is the easiest way to exhaust that budget. See §9.2.

---

## 4. Response envelope

### 4.1 Standard shape

**[C]** N2–N6 return `{ message, data }` from the handler, so `TransformResponseInterceptor` takes the flat branch:

```json
{
  "success": true,
  "message": "Unread count retrieved successfully",
  "data": { "count": 4 },
  "meta": { "timestamp": "2026-08-19T09:12:03.114Z", "path": "/api/v1/notifications/unread-count", "correlationId": "b0c7f2f1-…" }
}
```

### 4.2 `GET /notifications` — pagination is a sibling

**[C]** The handler returns a `PaginatedResponseDto`, which **extends `ResponseDto`**. The interceptor's first branch is `data instanceof ResponseDto` → it refreshes `meta` and **returns the object as-is**. So the envelope arrives fully formed with `pagination` **beside** `data`:

```json
{
  "success": true,
  "message": "Notifications retrieved successfully",
  "data": [ /* NotificationListItem[] */ ],
  "meta": { "timestamp": "…", "path": "/api/v1/notifications", "correlationId": "…" },
  "pagination": { "page": 1, "limit": 20, "total": 37, "totalPages": 2 }
}
```

⚠️ **[C] Three different paginated shapes now exist in this API** — do not share one parser:

| Surface | Shape |
| --- | --- |
| `GET /products` (catalogue) | everything nested under `data`, **no** `pagination` key |
| `GET /accounts`, `GET /contacts` (directory) | `data` array + sibling `pagination` |
| **`GET /notifications`** | `data` array + sibling `pagination` — **same as directory** |

**[C]** The key order inside `pagination` is `{page, limit, total, totalPages}`; the directory builds `{total, page, limit, totalPages}`. Order is not semantic in JSON and the **field names are identical**, so one `Pagination` model serves both.

### 4.3 ⚠️ Three different payload shapes for one resource

**[C]** The same notification comes back in three shapes depending on the route:

| Route | `data` is | Fields |
| --- | --- | --- |
| `GET /notifications` | array | **7 selected fields**: `id, type, status, title, message, metadata, readAt, createdAt` |
| `PATCH /{id}/read` | object | **the full Prisma row** — the 7 above **plus** `userId`, `archivedAt`, `updatedAt` |
| `DELETE /{id}` | **absent** | no `data` key at all |

**[I]** Model the list item as the canonical `Notification`, and treat the extra fields on the `read` response as optional. Do **not** rely on `userId` / `updatedAt` existing — they are absent from every list read.

---

## 5. Error contract

**[C]** Notification errors are `BaseException` subclasses handled by the **global** `HttpExceptionFilter` (there is no module-specific filter here), producing the standard envelope:

```json
{
  "success": false,
  "message": "Notification not found: clx8k2p9q0000abcd1234efgh",
  "error": { "code": "NOTIFICATION_NOT_FOUND", "statusCode": 404 },
  "meta": { "timestamp": "…", "path": "/api/v1/notifications/clx8…/read", "correlationId": "…" }
}
```

### 5.1 Complete code table

| HTTP | `error.code` | Raised when | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Bad `type`/`status` enum, `page < 1`, `limit > 100`, unknown query param, malformed `fcmToken` | Fix the request; do not retry |
| 401 | *(auth codes)* | See catalogue spec §6.1 | Single-flight refresh |
| 403 | `NOTIFICATION_ACCESS_DENIED` | Notification belongs to another user | **[I] Unreachable in practice** — see §5.2 |
| 404 | `NOTIFICATION_NOT_FOUND` | Unknown id **or** another user's notification | Remove from local list; refresh |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30 / 60 s | Backoff (§9.2) |
| 500 | `INTERNAL_SERVER_ERROR` | Unhandled fault | Backoff + retry |

### 5.2 `NOTIFICATION_ACCESS_DENIED` is dead code

**[C]** Both `markAsRead` and `archiveNotification` resolve the row through `queryService.getNotificationById(notificationId, userId)`, whose `where` clause **already includes `userId`**. So another user's notification returns `null` → `NotificationNotFoundException`. The subsequent `if (notification.userId !== userId)` branch can never be true.

**[I]** Handle `403 NOTIFICATION_ACCESS_DENIED` defensively but expect **404** in practice. This matches the directory module's deliberate "not yours looks like not there" policy.

### 5.3 No 503, and Redis failures are invisible

**[C]** Redis failure is swallowed at every call site (`try/catch` with an empty handler) — the unread count silently falls back to a database `COUNT`. **A rep never sees an error caused by the cache being down.**

---

## 6. Endpoints

### 6.1 `GET /notifications` — the inbox (N1)

#### Purpose

**[C]** The paginated in-app inbox, **excluding archived notifications**.

```text
GET /api/v1/notifications?page=1&limit=20&status=UNREAD
```

#### Query parameters — `GetNotificationsDto`

| Name | Type | Required | Default | Allowed / validation |
| --- | --- | --- | --- | --- |
| `type` | Enum | No | — | `TRANSACTION` \| `SECURITY` \| `SYSTEM` \| `MARKETING` \| `MESSAGE_RECEIVED` \| `PAYMENT_REQUEST_RECEIVED` \| `PAYMENT_REQUEST_UPDATED` — but see §7.1 |
| `status` | Enum | No | — | `UNREAD` \| `READ` \| `ARCHIVED` — ⚠️ see below |
| `page` | Int | No | `1` | `@Min(1)` |
| `limit` | Int | No | `20` | `@Min(1)`, `@Max(100)` |
| `sortBy` | Enum | No | `createdAt` | `createdAt` \| `type` |
| `sortOrder` | Enum | No | `desc` | `asc` \| `desc` |

⚠️ **[C] `status=ARCHIVED` always returns an empty page.** The query hard-codes `archivedAt: null` in its `where`, then ANDs your `status` filter on top. An archived row has `archivedAt` set, so the two conditions are mutually exclusive.

**[I] There is no way to read archived notifications through the API.** Archiving is effectively a delete from the client's point of view. Do not offer an "Archived" tab. See §12-Q3.

**[C]** `sortBy=type` sorts by the **enum's declaration order**, not alphabetically or by importance. **[I]** It is unlikely to be useful in a UI; prefer `createdAt`.

**[C]** The global pipe runs `forbidNonWhitelisted: true` — an unknown query parameter is a **400**, not a silent strip.

#### Success response `200`

```json
{
  "success": true,
  "message": "Notifications retrieved successfully",
  "data": [
    {
      "id": "clx8k2p9q0000abcd1234efgh",
      "type": "SECURITY",
      "status": "UNREAD",
      "title": "Password Changed",
      "message": "Your password was changed. If you didn't do this, contact support immediately.",
      "metadata": { "type": "PASSWORD_CHANGED", "timestamp": "2026-08-19T08:40:12.004Z", "loggedOutOtherSessions": true },
      "readAt": null,
      "createdAt": "2026-08-19T08:40:12.100Z"
    },
    {
      "id": "clx8k1a2b0001abcd5678ijkl",
      "type": "SYSTEM",
      "status": "READ",
      "title": "Your Account Has Been Approved",
      "message": "Welcome aboard! Khaled Mansour approved your account — you can sign in now.",
      "metadata": { "approvedBy": "9f2c8a7e-1d4b-4065-3fbe-2a9c8d7e6f5a" },
      "readAt": "2026-08-19T09:01:44.220Z",
      "createdAt": "2026-08-18T14:22:31.004Z"
    }
  ],
  "meta": { "timestamp": "…", "path": "/api/v1/notifications", "correlationId": "…" },
  "pagination": { "page": 1, "limit": 20, "total": 37, "totalPages": 2 }
}
```

#### Response fields — `NotificationListItem`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `id` | String (**cuid**) | No | ⚠️ **Not a uuid.** No `ParseUUIDPipe` on the routes — do not validate it as one. |
| `type` | `NotificationType` | No | See §7.1 for what is actually emitted. |
| `status` | `NotificationStatus` | No | `UNREAD` \| `READ`. **Never `ARCHIVED` on this endpoint.** |
| `title` | String | No | **English only.** See §7.3. |
| `message` | String | No | **English only.** |
| `metadata` | Object \| null | **Yes** | Free-form JSON; the shape **varies by event** — see §7.2. |
| `readAt` | ISO-8601 \| null | **Yes** | `null` while unread. |
| `createdAt` | ISO-8601 | No | Sort key. |

⚠️ **[C] Absent from the list projection:** `userId`, `archivedAt`, `updatedAt`. Also **absent from the model entirely**: there is **no** `priority`, `channel`, `imageUrl`, `actionUrl`, `category`, `icon`, or `groupKey`. Everything an inbox UI needs beyond title/message/type must be derived client-side from `type` and `metadata`.

#### Errors

`400 VALIDATION_ERROR` · `401` · `429`. **An empty inbox is `200` with `data: []`, `total: 0`, `totalPages: 0`** — never a 404.

---

### 6.2 `GET /notifications/unread-count` — the badge (N2)

```text
GET /api/v1/notifications/unread-count
```

**[C]** No query parameters.

```json
{
  "success": true,
  "message": "Unread count retrieved successfully",
  "data": { "count": 4 },
  "meta": { … }
}
```

| Field | Type | Meaning |
| --- | --- | --- |
| `count` | Int | Rows where `status = UNREAD` **and** `archivedAt IS NULL`. |

#### ⚠️ The cache contract — read this before designing the badge

**[C]** The count is served from Redis under `notification:unread:{userId}` with a **300-second (5 minute) TTL**, and the key is **deleted** on every mutation: `sendNotification`, `sendBulkNotification`, `markAsRead`, `markAllAsRead`, `archiveNotification`.

| Situation | Freshness |
| --- | --- |
| After **your own** read / archive / read-all | **Immediate** — cache invalidated in the same request |
| A **new notification arrives** for you | **Immediate** — the producer invalidates too |
| Redis is down | Falls back to a live `COUNT`; **always correct, just slower** |

**[I]** So the count is effectively **write-through**, not stale-by-design. The 5-minute TTL is only a safety net for a missed invalidation. **You do not need aggressive polling** — see §9.2.

**[C]** Redis failure is non-fatal at read, write and invalidate. There is no error path a client can observe.

---

### 6.3 `GET /notifications/preferences` (N3) — read-only

```text
GET /api/v1/notifications/preferences
```

**[C]** The handler **upserts** — a user with no preference row gets one created with defaults on first read. It never 404s.

```json
{
  "success": true,
  "message": "Notification preferences retrieved successfully",
  "data": {
    "transactionEnabled": true,
    "securityEnabled": true,
    "systemEnabled": true,
    "marketingEnabled": false,
    "pushEnabled": true
  },
  "meta": { … }
}
```

| Field | Type | Default | Governs |
| --- | --- | --- | --- |
| `transactionEnabled` | Boolean | `true` | `type = TRANSACTION` |
| `securityEnabled` | Boolean | `true` | `type = SECURITY` |
| `systemEnabled` | Boolean | `true` | `type = SYSTEM` |
| `marketingEnabled` | Boolean | **`false`** | `type = MARKETING` |
| `pushEnabled` | Boolean | `true` | **Push channel only** — the in-app row is written regardless. |

**[C] How the two layers combine** (`isTypeEnabled`):

```
inApp = typeEnabled(type)
push  = typeEnabled(type) && pushEnabled
```

⚠️ **[C] A disabled type produces NO in-app row at all** — not a hidden one. Turning `securityEnabled` off would mean a password-change notification is never recorded anywhere. **[I]** This is a stronger effect than most users expect from a "notifications" toggle; if the update route is ever added, the UI must say so plainly.

⚠️ **[C] Only 4 of the 7 types are covered.** `isTypeEnabledInPrefs` has a `default: return true` branch, so `MESSAGE_RECEIVED`, `PAYMENT_REQUEST_RECEIVED` and `PAYMENT_REQUEST_UPDATED` are **always enabled and cannot be disabled**. Moot in practice — see §7.1.

⚠️ **[C] There is no route to change any of this.** See §2.3.

---

### 6.4 `PATCH /notifications/{id}/read` (N4)

```text
PATCH /api/v1/notifications/{id}/read        → 200 OK
```

**[C]** No body. `id` is a **cuid**, taken as a raw `@Param('id')` string with no pipe.

**[C]** Sets `status = 'READ'` and `readAt = now()`, then invalidates the badge cache.

⚠️ **[C] Not idempotent in effect:** re-reading an already-read notification **overwrites `readAt` with a new timestamp**. There is no "if unread" guard. **[I]** Harmless, but do not treat `readAt` as "the first time the user saw it".

⚠️ **[C]** An **archived** notification can still be marked read — `getNotificationById` does not filter `archivedAt`. Invisible to a client that cannot list archived rows.

#### Response — the full row

```json
{
  "success": true,
  "message": "Notification marked as read",
  "data": {
    "id": "clx8k2p9q0000abcd1234efgh",
    "userId": "9f2c8a7e-1d4b-4065-3fbe-2a9c8d7e6f5a",
    "type": "SECURITY",
    "status": "READ",
    "title": "Password Changed",
    "message": "Your password was changed. If you didn't do this, contact support immediately.",
    "metadata": { "type": "PASSWORD_CHANGED", "timestamp": "2026-08-19T08:40:12.004Z", "loggedOutOtherSessions": true },
    "readAt": "2026-08-19T09:15:02.881Z",
    "archivedAt": null,
    "createdAt": "2026-08-19T08:40:12.100Z",
    "updatedAt": "2026-08-19T09:15:02.881Z"
  },
  "meta": { … }
}
```

⚠️ **[C]** This is the **only** endpoint that returns `userId`, `archivedAt` and `updatedAt`. See §4.3.

#### Errors

| HTTP | Code | Mobile action |
| --- | --- | --- |
| 404 | `NOTIFICATION_NOT_FOUND` | Drop the row from the local list and refresh |
| 401 / 429 | — | §9 |

---

### 6.5 `PATCH /notifications/read-all` (N5)

```text
PATCH /api/v1/notifications/read-all        → 200 OK
```

**[C]** No body, no parameters.

```json
{
  "success": true,
  "message": "All notifications marked as read",
  "data": { "count": 4 },
  "meta": { … }
}
```

| Field | Type | Meaning |
| --- | --- | --- |
| `count` | Int | Rows actually updated. **`0` when nothing was unread** — a success, not an error. |

⚠️ **[C] Scope mismatch with the inbox.** `markAllAsRead` filters on `{ userId, status: 'UNREAD' }` only — it does **not** exclude `archivedAt: not null`. So it also marks **archived** notifications read, and the returned `count` can exceed the number of unread rows the client can see.

**[I]** Do not assert `count === localUnreadCount`. Treat the response as "done", set the badge to `0` optimistically, and reconcile with N2.

---

### 6.6 `DELETE /notifications/{id}` — archive (N6)

```text
DELETE /api/v1/notifications/{id}        → 200 OK
```

**[C]** Soft-delete: sets `archivedAt = now()`. **`status` is left untouched** — an unread notification stays `UNREAD` in the database while becoming invisible to every read.

⚠️ **[C]** But the badge **does** drop, because the unread `COUNT` filters `archivedAt: null`. So archiving an unread notification decrements the badge without marking it read.

**[C] Response carries no `data`:**

```json
{
  "success": true,
  "message": "Notification archived successfully",
  "meta": { … }
}
```

**[I]** `data` is `undefined` and is therefore **omitted from the JSON**. Your parser must tolerate a missing `data` key on this one route.

⚠️ **[C] Archiving is irreversible from the client.** There is no un-archive route and no way to list archived rows (§6.1). Treat it as a permanent delete in the UI and confirm destructively.

---

### 6.7 `PUT /device/fcm-token` — register the push token (D1)

```text
PUT /api/v1/device/fcm-token        → 200 OK
```

#### Body — `RegisterFcmTokenDto`

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `fcmToken` | String | **Yes** | `@MaxLength(1024)`; trimmed; **`@Matches(/^[A-Za-z0-9_:\-]+$/)`** |

⚠️ **[C] The character class is strict:** letters, digits, `_`, `:` and `-` only. **A `/`, `.`, `+` or `=` anywhere in the token is a 400.** Real FCM registration tokens normally satisfy this, but it is a hard constraint, not a hint.

```json
{ "fcmToken": "cZ1kP0xQSm6yT3nR8vL2wA:APA91bH_9dK4mQ7pX2sV5tYzN0cJfR6gE8uW1iO3aB" }
```

#### Behaviour

**[C]** The token is bound to the **`DeviceAccount` row for the calling device** — `userId` from the JWT, `deviceId` from the JWT claim. **One token per (user, device) binding.** Calling it again replaces the token for that device.

**[C]** Push fan-out (`FcmService.sendToUser`) selects **all `DeviceAccount` rows where `status = 'ACTIVE'` and `fcmToken IS NOT NULL`** for that user — so a user signed in on three devices receives the push on all three.

```json
{ "success": true, "message": "FCM token registered successfully", "data": { "registered": true }, "meta": { … } }
```

#### Stale-token cleanup

**[C]** When Firebase returns `messaging/registration-token-not-registered` or `messaging/invalid-registration-token`, the backend **nulls the stored token** for that binding. **[I]** So a reinstalled app silently stops receiving push until it re-registers — **call this endpoint on every app start**, not only on first login.

#### Errors

| HTTP | Code | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Token > 1024 chars or contains a disallowed character |
| 401 | `DEVICE_ID_MISMATCH` | Header ≠ token claim |
| 4xx | *(device domain codes)* | Handled by `DeviceDomainExceptionFilter` — **REQUIRES BACKEND CONFIRMATION** for the exact codes on this route |

---

### 6.8 `DELETE /device/fcm-token` (D2)

```text
DELETE /api/v1/device/fcm-token        → 200 OK
```

**[C]** No body. Clears the token for the calling device only.

```json
{ "success": true, "message": "FCM token removed successfully", "data": { "removed": true }, "meta": { … } }
```

**[I] Call this on logout**, before clearing tokens locally — otherwise the device keeps receiving pushes for an account no longer signed in. It requires a valid access token, so **the order matters: delete the FCM token first, then `POST /auth/logout`.**

---

## 7. What a representative actually receives

### 7.1 ⚠️ Only two of the seven types are ever emitted

**[C]** `NotificationType` declares seven values. A full sweep of every `sendNotification` / `queueService.sendNotification` call site in `src/` produces this:

| Type | Emitted anywhere in this backend? |
| --- | --- |
| `SECURITY` | ✅ **6 distinct events** |
| `SYSTEM` | ✅ **2 events** |
| `TRANSACTION` | ❌ **never** |
| `MARKETING` | ❌ never (except an explicit admin broadcast) |
| `MESSAGE_RECEIVED` | ❌ never |
| `PAYMENT_REQUEST_RECEIVED` | ❌ never |
| `PAYMENT_REQUEST_UPDATED` | ❌ never |

**[C]** The unused values — and the `TRANSACTION_*`, `P2P_*`, `DEPOSIT_STATUS`, `WITHDRAWAL_STATUS`, `WALLET_FROZEN`, `AGENT_CASH_*`, `AGENT_FLOAT_*` entries in `NOTIFICATION_TEMPLATES` — are **e-wallet leftovers**. No code path in the field-sales backend references any of them.

**[I] Design for `SECURITY` and `SYSTEM`.** Parse the other five defensively (an admin *can* broadcast with any type), but do not build type-specific UI, filter chips or icons for them.

### 7.2 The live notification catalogue

**[C]** Every notification a **representative** can receive, with its exact `metadata` shape:

| # | Trigger | `type` | `title` | `metadata` |
| --- | --- | --- | --- | --- |
| 1 | Manager approves the rep's registration | `SYSTEM` | `Your Account Has Been Approved` | `{ approvedBy: string }` |
| 2 | Rep changes own password (`PUT /users/me/password`) | `SECURITY` | `Password Changed` | `{ type: "PASSWORD_CHANGED", timestamp: ISO, loggedOutOtherSessions: bool }` |
| 3 | Password reset completed (`/auth/reset-password`) | `SECURITY` | `Password Changed` | `{ action: "PASSWORD_RESET" }` |
| 4 | Rep enables 2FA | `SECURITY` | `Two-Factor Authentication Enabled` | `{ type: "TWO_FACTOR_ENABLED", timestamp: ISO }` |
| 5 | Admin suspends / bans the account | `SECURITY` | `Account Suspended` / `Account Permanently Restricted` | `{ previousStatus, newStatus }` |
| 6 | Admin reactivates the account | `SECURITY` | `Account Reactivated` | `{ previousStatus, newStatus }` |
| 7 | Admin resets the rep's password | `SECURITY` | `Password Reset` | `{ resetBy: "admin", adminId: string }` |
| 8 | Admin broadcast | *admin-chosen* | *admin-chosen*, ≤ 100 chars | *admin-chosen object, or absent* |

**[C]** A **`SALES_MANAGER`** additionally receives #9: `New Representative Awaiting Approval`, `type: SYSTEM`, `metadata: { representativeId: string }` — fired when a rep verifies their email against that manager's code. A rep never receives it.

⚠️ **[C] `metadata` has no stable schema.** Four different `SECURITY` notifications carry four different key sets, and two of them put an event name under a key literally called `type` — which **collides conceptually with the row's own `type` column** (`SECURITY`). Read `metadata.type` only as a sub-event discriminator, never as the notification type.

**[C]** `metadata` is `Json?` — it can be **`null`** (any broadcast sent without metadata produces `null`).

**[I] Recommended client handling:** treat `metadata` as `Map<String, dynamic>?`, read known keys with null-safe lookups, and **never** crash on an unexpected shape. Derive the display sub-type from `metadata['type'] ?? metadata['action']`, falling back to the row's `type`.

### 7.3 ⚠️ Notifications are English-only

**[C]** Every title and message comes from `NOTIFICATION_TEMPLATES`, which is **hard-coded English**. Unlike the catalogue module there is **no `Localized` structure, no `ar` field, and no locale parameter** anywhere in this module.

**[I] Consequences for an Arabic-first app:**
- You cannot render Arabic text from the API.
- The only viable localisation strategy is **client-side mapping from `metadata.type` / `metadata.action`** (more stable) or from `title` (fragile) to an Arabic string shipped in the app.
- That mapping **breaks silently** whenever the backend edits a template string, and it cannot cover admin broadcasts, whose text is typed by a human at runtime.
- **Broadcasts must be displayed verbatim** in whatever language the admin wrote them.

See §12-Q2 — this is the highest-impact gap after the missing preferences route.

---

## 8. Push notifications (FCM)

### 8.1 The message the device receives

**[C]** `FcmService.sendToDevices` builds:

```jsonc
{
  "notification": { "title": "<title>", "body": "<message>", "imageUrl": "<optional>" },
  "data": {
    "type": "SECURITY",                      // the NotificationType, always present
    "notificationId": "clx8k2p9q0000abcd…"   // present only when an in-app row was created
    // ...plus any `fcmData` the producer supplied
  },
  "android": { "priority": "high" },
  "apns":    { "payload": { "aps": { "sound": "default" } } }
}
```

**[C] Facts that matter:**
- It is a **`notification` + `data` hybrid message**. On Android the system tray renders it automatically while the app is backgrounded — your `onMessage` handler only fires in the foreground.
- **All `data` values are strings.** FCM enforces this; `notificationId` and `type` arrive as strings.
- `notificationId` is **conditional** — added only when `prefs.inApp` produced a row. **[I]** With the current preference logic `push` implies `inApp`, so in practice it is always present. Guard for its absence anyway.
- `imageUrl` is supported by the interface but **no live producer sets it**.
- **No `click_action`, no deep link, no `channel_id`.** **[I]** You must declare your own Android notification channel client-side and route taps yourself from `data.type` + `data.notificationId`.

### 8.2 Recommended tap handling **[I]**

```
push tapped
   ↓
data.notificationId present?
   ├─ yes → open the inbox, scroll to that id, PATCH /{id}/read
   └─ no  → open the inbox at the top, refresh
   ↓
always: refresh GET /notifications/unread-count
```

**[I]** Do **not** deep-link on `data.type` alone — `SECURITY` covers six different events with no shared destination.

### 8.3 Delivery is not guaranteed

**[C]** Three independent silent-failure points:

1. **Firebase not initialised** — `getMessaging()` returns null and `sendToUser` returns a zero-result **without error**. Push simply does not happen; the in-app row still exists.
2. **No tokens** — a user with no registered device gets `{successCount: 0}` and no error.
3. **Push throws** — caught in `sendNotification` and only logged: *"Push failure should not fail the whole operation."*

**[I] Therefore the in-app inbox is the source of truth and push is an accelerator.** Never build a flow that depends on a push arriving. Always refresh the inbox and the badge on app resume.

---

## 9. Error → mobile behaviour

### 9.1 `404 NOTIFICATION_NOT_FOUND`

**[C]** Means unknown id **or** another user's notification (§5.2).
**[I]** Remove the row from the local list without an error dialog, then refresh the page. This is a normal race — the row may have been archived on another device.

### 9.2 `429 RATE_LIMIT_EXCEEDED` — the badge is the risk

⚠️ **[C]** 30 requests / 60 s **shared across catalogue, directory and notifications**. A 30-second badge poller alone consumes 2 req/min forever, and a rep browsing the catalogue is already spending 2 per interaction.

**[I] Recommended badge strategy — do not poll on a timer:**

| Trigger | Call |
| --- | --- |
| App start | `GET /unread-count` once |
| App resume from background | `GET /unread-count` (debounced ≥ 30 s) |
| FCM message received (foreground **or** background handler) | `GET /unread-count` |
| After any local mutation (read / read-all / archive) | Update the badge **locally**, then reconcile with one `GET /unread-count` |
| Inbox screen opened | `GET /notifications` + `GET /unread-count` |

**[C]** This is safe precisely because the count is **write-through cached** (§6.2) — a push means the cache was already invalidated, so a fetch right after a push returns a fresh number.

### 9.3 `400 VALIDATION_ERROR`

**[C]** `message` carries only the **first** failing rule; the full list is in `error.details.validationErrors` **in development only**.
**[I]** The only user-supplied inputs here are the filter enums and the FCM token, so a 400 on this surface is almost always a **client bug** — log the `correlationId` and show a generic error.

### 9.4 `401` on a mutation

**[I]** All four mutations (N4, N5, N6, D1) are **safe to replay** after a single-flight refresh — marking read twice, archiving twice, and re-registering the same token are all effectively idempotent. Unlike the directory's creates, the catalogue's blanket replay policy **is** appropriate here.

---

## 10. Data models

```text
Model: Notification                    ← GET /notifications, PATCH /{id}/read
- id: String            (cuid, NOT uuid)
- type: NotificationType
- status: NotificationStatus           (UNREAD | READ — never ARCHIVED on reads)
- title: String                        (English only)
- message: String                      (English only)
- metadata: Map<String,dynamic>?   N   (free-form; shape varies by event)
- readAt: DateTime?                N
- createdAt: DateTime
── present ONLY on PATCH /{id}/read ──
- userId: String?                  N
- archivedAt: DateTime?            N
- updatedAt: DateTime?             N

Model: NotificationPreferences         ← GET /notifications/preferences
- transactionEnabled: bool
- securityEnabled: bool
- systemEnabled: bool
- marketingEnabled: bool
- pushEnabled: bool
  (READ-ONLY — no update route exists)

Model: UnreadCount                     ← GET /notifications/unread-count
- count: int

Model: Pagination                      ← sibling of `data` on GET /notifications
- page: int
- limit: int
- total: int
- totalPages: int

Model: FcmPushData                     ← FCM `data` payload (all values String)
- type: String
- notificationId: String?          N
```

---

## 11. Enums

### `NotificationType`
```text
SECURITY                    ← live: 6 events
SYSTEM                      ← live: 2 events
TRANSACTION                 ← declared, never emitted
MARKETING                   ← declared, only via admin broadcast
MESSAGE_RECEIVED            ← declared, never emitted
PAYMENT_REQUEST_RECEIVED    ← declared, never emitted
PAYMENT_REQUEST_UPDATED     ← declared, never emitted
```

| Value | Mobile action |
| --- | --- |
| `SECURITY` | Account-safety events. **[I]** Give these the strongest visual weight — several are actionable warnings (`Password Changed`, `Account Suspended`). |
| `SYSTEM` | Lifecycle / onboarding. Neutral treatment. |
| everything else | **[I]** Render with a generic fallback style. Never crash; never build dedicated UI. |

### `NotificationStatus`
```text
UNREAD · READ · ARCHIVED
```

| Value | Reachable by the client? |
| --- | --- |
| `UNREAD` | ✅ default state |
| `READ` | ✅ after `PATCH /{id}/read` or `read-all` |
| `ARCHIVED` | ⚠️ **Declared but unreachable.** Archiving sets `archivedAt`, **not** `status`. No read path returns a row with this value, and `?status=ARCHIVED` returns an empty page. |

**[I]** Model all three for forward-compatibility, but branch on two.

---

## 12. Backend questions / missing information

### Q1 — There is no way to update notification preferences
**REQUIRES BACKEND CONFIRMATION.** ⚠️ **Blocking for a settings screen.**
`UpdatePreferencesDto` and `NotificationPreferenceService.updatePreferences()` are both fully implemented, but **no controller route calls them**. `GET /notifications/preferences` is the only preferences endpoint in the codebase.
**Ask:** can `PATCH /notifications/preferences` be wired up? The service method already exists and takes the DTO directly — it looks like a one-line controller addition.
**Impact:** high. Until then the settings screen is read-only or must be omitted.

### Q2 — Notifications are English-only, in an Arabic-first app
**REQUIRES BACKEND CONFIRMATION.** ⚠️
`NOTIFICATION_TEMPLATES` is hard-coded English. There is no `Localized` pair, no `ar` field, no locale parameter, and no template key on the row — so the client cannot even map reliably without matching on the English title string.
**Ask:** (a) can a stable `templateKey` be added to `metadata` so the client can map to Arabic safely? (b) is server-side Arabic planned? Note that admin broadcasts are free text and can never be localised client-side.
**Impact:** high — this is the difference between a bilingual app and an app with an English-only inbox.

### Q3 — Archived notifications are unreadable and unrecoverable
**REQUIRES BACKEND CONFIRMATION.**
`GET /notifications` hard-codes `archivedAt: null`, so `?status=ARCHIVED` can never return anything, and there is no un-archive route.
**Ask:** is archive intended as a permanent delete? If so, should the `ARCHIVED` enum value and the `status` filter option be removed, to stop clients building an unreachable tab?
**Impact:** medium — it determines whether "archive" is presented as a destructive action.

### Q4 — `markAllAsRead` also marks archived notifications
**REQUIRES BACKEND CONFIRMATION.**
Its `where` is `{ userId, status: 'UNREAD' }` with no `archivedAt: null`, unlike every other query in the module. The returned `count` can therefore exceed what the user could see.
**Ask:** intended, or an oversight? It makes the returned `count` unusable for UI feedback.
**Impact:** low — but the client must not display "N notifications marked read".

### Q5 — Five of seven `NotificationType` values are dead
**Observation, not a blocker.**
`TRANSACTION`, `MESSAGE_RECEIVED`, `PAYMENT_REQUEST_RECEIVED`, `PAYMENT_REQUEST_UPDATED` and most of `NOTIFICATION_TEMPLATES` are e-wallet leftovers with no producer in this backend. They still widen the enum the client must parse, and `marketingEnabled` defaults to `false` for a type nothing emits.
**Ask:** can the unused enum values and templates be removed, or are they reserved for a planned feature?
**Impact:** low, but it would shrink the client's defensive surface.

### Q6 — The notification API is invisible in Swagger
**Observation.** `NotificationController` has no `@ApiTags`, `@ApiBearerAuth` or `@ApiOperation`. It renders as an untagged default group with no documented shapes — unlike the catalogue and directory modules.
**Ask:** can the decorators be added for parity?
**Impact:** low — this document covers the gap.

### Q7 — Device-domain error codes on `PUT /device/fcm-token`
**REQUIRES BACKEND CONFIRMATION.** The route is wrapped in `DeviceDomainExceptionFilter`, but which device domain errors it can raise (unknown device binding, suspended device, …) is not determinable from the controller.
**Ask:** list the `error.code` values reachable on the two FCM routes.
**Impact:** low — a generic handler is adequate meanwhile.

### Q8 — No delivery receipt or timing guarantee
**Observation.** Delivery is queued through BullMQ and every producer swallows enqueue failures. There is no way for a client to know a notification was expected but lost.
**Ask:** none actionable — documented so the mobile team does not build flows that depend on arrival.

---

## 13. Flutter implementation checklist

**Transport**
- [ ] `Authorization` + `X-Device-Id` on all seven routes
- [ ] FCM routes are `/device/fcm-token` — **singular** ⚠️
- [ ] `data` array + **sibling `pagination`** on `GET /notifications` (directory shape, not catalogue shape) ⚠️
- [ ] Tolerate a **missing `data` key** on `DELETE /notifications/{id}` ⚠️
- [ ] Treat notification `id` as an opaque **cuid**, never a uuid ⚠️
- [ ] Mutations are replay-safe after a 401 refresh

**Models**
- [ ] `Notification` from the 7-field list projection; `userId` / `archivedAt` / `updatedAt` optional ⚠️
- [ ] `metadata` as `Map<String, dynamic>?`, **null-safe on every key** ⚠️
- [ ] Defensive enum parsing with an `unknown` fallback for all 7 types
- [ ] Do not model `priority`, `imageUrl`, `actionUrl`, `channel` — **they do not exist**

**Inbox**
- [ ] `GET /notifications?page=&limit=` (limit ≤ 100), infinite scroll, reset on filter change
- [ ] Filter chips for **`SECURITY` and `SYSTEM` only** ⚠️
- [ ] **No "Archived" tab** — `?status=ARCHIVED` always returns empty ⚠️
- [ ] Empty inbox is `200` with `data: []` — an empty state, not an error

**Badge**
- [ ] Event-driven refresh only — **no timer polling** (§9.2) ⚠️
- [ ] Optimistic local decrement, then reconcile with `GET /unread-count`
- [ ] Archiving an **unread** notification also decrements the badge ⚠️
- [ ] Do not display `read-all`'s `count` to the user ⚠️

**Push**
- [ ] Register the token on **every app start**, not only first login ⚠️
- [ ] Declare your own Android notification channel — the server sets none ⚠️
- [ ] Route taps from `data.notificationId`; fall back to the inbox top when absent
- [ ] Refresh badge + inbox on every received message
- [ ] `DELETE /device/fcm-token` **before** `POST /auth/logout` ⚠️
- [ ] Never depend on a push arriving — the inbox is the source of truth ⚠️

**Preferences**
- [ ] **Read-only screen, or no screen** — there is no update route ⚠️
- [ ] If shown: explain that a disabled type produces **no record at all**, not a hidden one
- [ ] Never show toggles for the 3 uncovered types

**Localisation**
- [ ] Ship a client-side Arabic map keyed on `metadata.type` / `metadata.action`, falling back to `title` ⚠️
- [ ] Render broadcasts **verbatim** — they cannot be mapped
- [ ] Format `createdAt` / `readAt` with an Arabic relative-time formatter
