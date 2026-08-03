# Auth module — `/auth`

Read [README.md](README.md) first: the response envelope, the mandatory
`X-Device-Id` header, the role hierarchy and the anti-enumeration rules are
defined there and are not repeated per endpoint.

## Endpoint index

| Method | Path | Auth | Role | Rate limit (per IP) |
| --- | --- | --- | --- | --- |
| POST | [`/auth/register`](#post-authregister) | Public | — | 8 / hour |
| POST | [`/auth/login`](#post-authlogin) | Public | — | 20 / 15 min |
| POST | [`/auth/verify-otp`](#post-authverify-otp) | Public | — | 5 / 5 min |
| POST | [`/auth/request-verification`](#post-authrequest-verification--postauthresend-verification) | Public | — | 3 / 2 min |
| POST | [`/auth/resend-verification`](#post-authrequest-verification--postauthresend-verification) | Public | — | 3 / 2 min |
| POST | [`/auth/refresh`](#post-authrefresh) | Refresh token (body) | — | 10 / 2 min |
| POST | [`/auth/logout`](#post-authlogout) | Bearer | Any | global (30/min) |
| GET | [`/auth/me`](#get-authme) | Bearer | Any | global (30/min) |
| POST | [`/auth/forgot-password`](#post-authforgot-password) | Public | — | 4 / 10 min |
| POST | [`/auth/reset-password`](#post-authreset-password) | Public | — | 4 / 10 min |

No `/auth` route requires a specific role. Access is gated by token validity and,
for `logout` / `me`, an active account.

---

## Shared shapes

### `DeviceInfo` — required on register and login

Device metadata travels **inline** on the auth call; there is no separate device
registration step. All six fields are required, defined in
[device-info.dto.ts](../../src/auth/dto/device-info.dto.ts).

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `deviceId` | string | ✅ | 10–100 chars, `^[A-Za-z0-9_-]+$`, trimmed. Client-generated fingerprint — **store it**, it is required as `X-Device-Id` on every later request. |
| `deviceName` | string | ✅ | 1–100 chars, `^[a-zA-Z0-9\s\-']+$`, trimmed. |
| `deviceType` | string | ✅ | One of `android`, `ios`, `web`. Lower-cased on input. |
| `deviceModel` | string | ✅ | 1–100 chars, `^[a-zA-Z0-9\s\-+]+$`, trimmed. |
| `osVersion` | string | ✅ | 1–50 chars, `^[a-zA-Z0-9\s.-]+$`, trimmed. |
| `appVersion` | string | ✅ | Semver: `^\d+\.\d+\.\d+(-[a-zA-Z0-9]+)?$`, e.g. `1.0.0` or `1.0.0-beta`. |

```json
{
  "deviceId": "a1b2c3d4e5f6g7h8",
  "deviceName": "Ahmad's iPhone",
  "deviceType": "ios",
  "deviceModel": "iPhone 14 Pro",
  "osVersion": "iOS 17.2",
  "appVersion": "1.0.0"
}
```

### `Tokens`

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9…",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9…",
  "expiresIn": 900,
  "refreshExpiresIn": 604800
}
```

`expiresIn` / `refreshExpiresIn` are **seconds**. Every token is bound to the
`deviceId` it was issued for.

### The unified auth outcome

`/auth/login` and `/auth/verify-otp` both answer with the same envelope, so a
client can parse one shape and branch on `verificationType`:

```jsonc
{
  "verificationType": "LOGIN_SUCCESS" | "SETUP_2FA" | "EMAIL" | "DEVICE" | "2FA" | "PENDING_APPROVAL",
  "verificationId": "…" | null,   // present only for EMAIL / DEVICE / 2FA
  "tokens": { /* Tokens */ } | null,
  "role": "REPRESENTATIVE"        // present only on LOGIN_SUCCESS
}
```

| `verificationType` | `verificationId` | `tokens` | What the client does next |
| --- | --- | --- | --- |
| `LOGIN_SUCCESS` | `null` | full | Store tokens, enter the app. |
| `SETUP_2FA` | `null` | **limited scope** | Send the user to 2FA setup. These tokens only reach `/auth/2fa/*` and `/auth/logout`. |
| `EMAIL` | string | `null` | Prompt for the emailed code → `POST /auth/verify-otp`. |
| `DEVICE` | string | `null` | Prompt for the emailed code → `POST /auth/verify-otp`. |
| `2FA` | string | `null` | Prompt for the authenticator code → `POST /auth/verify-otp`. |
| `PENDING_APPROVAL` | `null` | `null` | **Terminal.** Nothing to submit — the manager must approve. |

---

## POST `/auth/register`

Creates a `PENDING_VERIFICATION` representative and emails a 6-digit code.
Registration is **closed**: a valid manager code is mandatory, because without
one there is nobody to approve the account.

**Auth:** public · **Success:** `201 Created` · **Throttle:** 8 / hour / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `email` | string | ✅ | Valid email, ≤ 255 chars. Trimmed, lower-cased. |
| `password` | string | ✅ | 8–128 chars. Must contain a lowercase, an uppercase, a digit and a special character from `!@#$%^&*()_+-=[]{};':"\|,.<>/?`. |
| `firstName` | string | ✅ | 1–100 chars, letters (Latin **or** Arabic `؀-ۿ`), spaces, hyphens, apostrophes. Trimmed. |
| `lastName` | string | ✅ | Same rules as `firstName`. |
| `phone` | string | ✅ | 8–20 chars, E.164: `^\+?[1-9]\d{1,14}$`. Trimmed. |
| `managerCode` | string | ✅ | `SM-XXXXXXXX`, ≤ 20 chars. Normalised before lookup: case-insensitive, spaces stripped, `SM`/`SM-` prefix optional. The alphabet excludes look-alike characters (`0 O 1 I L 2 Z 5 S 8 B`). |
| *device fields* | — | ✅ | All six [`DeviceInfo`](#deviceinfo--required-on-register-and-login) fields, flat on the body. |

```json
{
  "email": "ahmad.hassan@example.com",
  "password": "Str0ng!Pass",
  "firstName": "أحمد",
  "lastName": "حسن",
  "phone": "+963912345678",
  "managerCode": "SM-7K3FQ9YD",
  "deviceId": "a1b2c3d4e5f6g7h8",
  "deviceName": "Ahmad's iPhone",
  "deviceType": "ios",
  "deviceModel": "iPhone 14 Pro",
  "osVersion": "iOS 17.2",
  "appVersion": "1.0.0"
}
```

### Response `201`

```json
{
  "message": "Registration successful",
  "data": {
    "verificationId": "9f2c…64-hex-chars…a3",
    "user": {
      "id": "3f1a2b4c-5d6e-7f80-9012-3456789abcde",
      "email": "ahmad.hassan@example.com",
      "firstName": "أحمد",
      "lastName": "حسن"
    }
  }
}
```

No tokens are issued. Keep `verificationId` — it is the handle for
`/auth/verify-otp` and `/auth/resend-verification`.

A username is auto-generated server-side and can be changed **once** later via
`PATCH /users/me/username`.

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Any field rule above. |
| 400 | `AUTH_INVALID_MANAGER_CODE` | Code does not resolve to an active Sales Manager. *"That manager code is not valid. Check it with your sales manager."* |
| 409 | `AUTH_PHONE_ALREADY_EXISTS` | Phone taken. **Always** returned, in every environment. |
| 409 | `AUTH_EMAIL_ALREADY_EXISTS` | Email taken — **development/staging only**. In production this returns a fake `201` instead (see [README §8](README.md#8-anti-enumeration-behaviour)). |
| 429 | `RATE_LIMIT_EXCEEDED` | > 8 registrations / hour from this IP. |

Order of checks matters: duplicate email/phone is evaluated **before** the manager
code, so an invalid code never leaks whether the email already exists.

---

## POST `/auth/login`

**Auth:** public · **Success:** `200 OK` · **Throttle:** 20 / 15 min / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `email` | string | ✅ | Valid email, ≤ 255 chars. Trimmed, lower-cased. |
| `password` | string | ✅ | 8–128 chars. *(No complexity check here — that is a registration rule.)* |
| *device fields* | — | ✅ | All six [`DeviceInfo`](#deviceinfo--required-on-register-and-login) fields. |

```json
{
  "email": "ahmad.hassan@example.com",
  "password": "Str0ng!Pass",
  "deviceId": "a1b2c3d4e5f6g7h8",
  "deviceName": "Ahmad's iPhone",
  "deviceType": "ios",
  "deviceModel": "iPhone 14 Pro",
  "osVersion": "iOS 17.2",
  "appVersion": "1.0.0"
}
```

### Responses — all `200 OK`

The decision is made by `LoginPolicy`, in this order: pending approval → email
unverified → new device → 2FA setup → 2FA challenge → issue tokens.

**Direct success**
```json
{
  "message": "Login successful",
  "data": {
    "verificationType": "LOGIN_SUCCESS",
    "verificationId": null,
    "tokens": { "accessToken": "eyJ…", "refreshToken": "eyJ…", "expiresIn": 900, "refreshExpiresIn": 604800 },
    "role": "REPRESENTATIVE"
  }
}
```

**New device detected** — a code is emailed
```json
{
  "message": "New device detected. A verification code has been sent to your email.",
  "data": { "verificationType": "DEVICE", "verificationId": "0f9c8b7a-…", "tokens": null }
}
```

**Email not verified yet** — the code is re-sent
```json
{
  "message": "Email verification required. Please verify your email to continue.",
  "data": { "verificationType": "EMAIL", "verificationId": "9f2c…", "tokens": null }
}
```

**2FA challenge** (General Manager with 2FA enabled)
```json
{
  "message": "2FA authentication required. Please enter your authenticator code.",
  "data": { "verificationType": "2FA", "verificationId": "2fa-session-id", "tokens": null }
}
```

**2FA setup required** (General Manager without 2FA) — note tokens **are**
issued, but with `setup_2fa` scope
```json
{
  "message": "Two-factor authentication setup is required. You have limited access until 2FA is enabled.",
  "data": { "verificationType": "SETUP_2FA", "verificationId": null, "tokens": { "accessToken": "eyJ…", "…": "…" } }
}
```

**Awaiting manager approval** — terminal, nothing to retry
```json
{
  "message": "Your account is waiting for your sales manager to approve it.",
  "data": { "verificationType": "PENDING_APPROVAL", "verificationId": null, "tokens": null }
}
```

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Malformed body or device fields. |
| 401 | `AUTH_INVALID_CREDENTIALS` | Wrong email or password. Also what a **banned or suspended** account gets in production. |
| 403 | `AUTH_ACCOUNT_BANNED` | Development/staging only. |
| 403 | `AUTH_ACCOUNT_SUSPENDED` | Development/staging only. |
| 403 | `AUTH_ACCOUNT_LOCKED` | Too many failed attempts. Message names the remaining minutes. |
| 400 | `DEVICE_MAX_DEVICES_REACHED` | Device cap hit (raised by the device module through the auth flow). |
| 429 | `RATE_LIMIT_EXCEEDED` | > 20 attempts / 15 min from this IP. |

Unknown emails are compared against a dummy bcrypt hash so the response time
does not reveal whether the account exists.

---

## POST `/auth/verify-otp`

One endpoint for **three** flows. The server auto-detects which, from the
`verificationId`: a live 2FA session, an unverified email, or a pending device.

**Auth:** public · **Success:** `200 OK` · **Throttle:** 5 / 5 min / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `verificationId` | string | ✅ | 10–255 chars, `^[A-Za-z0-9_-]+$`. Trimmed. From register or login. |
| `code` | string | ✅ | Exactly 6 digits, `^\d{6}$`. Trimmed. |

```json
{ "verificationId": "9f2c8a1b4d6e0f37…", "code": "482913" }
```

### Responses — all `200 OK`

**Email or device verified, logged in**
```json
{
  "message": "Email verified successfully. You are now logged in.",
  "data": {
    "verificationType": "LOGIN_SUCCESS",
    "verificationId": null,
    "tokens": { "accessToken": "eyJ…", "refreshToken": "eyJ…", "expiresIn": 900, "refreshExpiresIn": 604800 },
    "role": "REPRESENTATIVE"
  }
}
```
The message begins with `Email verified…` or `Device verified…` depending on the
flow.

**2FA code accepted**
```json
{
  "message": "2FA verification successful. You are now logged in.",
  "data": { "verificationType": "LOGIN_SUCCESS", "verificationId": null, "tokens": { "…": "…" }, "role": "GENERAL_MANAGER" }
}
```

**Email verified, but approval still pending** — deliberately **no tokens**
```json
{
  "message": "Email verified. Your account is waiting for your sales manager to approve it.",
  "data": { "verificationType": "PENDING_APPROVAL", "verificationId": null, "tokens": null }
}
```
The device binding *is* completed here, so the rep will not be asked for a device
OTP on their first login after approval.

**Admin must now set up 2FA**
```json
{
  "message": "Email verified. Two-factor authentication setup is required before accessing the application.",
  "data": { "verificationType": "SETUP_2FA", "verificationId": null, "tokens": { "…": "…" } }
}
```

**Admin must now pass 2FA**
```json
{
  "message": "Email verified. Please enter your authenticator code to complete login.",
  "data": { "verificationType": "2FA", "verificationId": "2fa-session-id", "tokens": null }
}
```
Call `/auth/verify-otp` a second time with the new `verificationId` and the
authenticator code.

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Code not 6 digits, malformed `verificationId`. |
| 400 | `VERIFICATION_INVALID_CODE` | Wrong code, expired code, expired 2FA session, **or an unknown `verificationId`** — the three are indistinguishable by design. |
| 404 | `RESOURCE_NOT_FOUND` | Mid-flow state missing (`User …`, `Pending device …`). |
| 429 | `RATE_LIMIT_EXCEEDED` | > 5 attempts / 5 min from this IP. |

---

## POST `/auth/request-verification` / POST `/auth/resend-verification`

Identical behaviour; two paths exist for backward compatibility. Re-issues the
code and re-sends the email.

**Auth:** public · **Success:** `200 OK` · **Throttle:** 3 / 2 min / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `verificationId` | string | ✅ | Non-empty string. |

### Response `200` — always the same

```json
{
  "message": "If the verification ID is valid, a verification code will be sent",
  "data": null
}
```

An unknown `verificationId` is silently ignored. There is **no** success/failure
signal — treat a `200` as "we tried".

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Missing `verificationId`. |
| 429 | `RATE_LIMIT_EXCEEDED` | > 3 requests / 2 min from this IP. |

---

## POST `/auth/refresh`

Rotates the token pair. The old access **and** refresh tokens are blacklisted and
the old session archived.

**Auth:** refresh token in the body (`JwtRefreshGuard`) — do **not** send an
`Authorization` header · **Success:** `200 OK` · **Throttle:** 10 / 2 min

> `X-Device-Id` is still required and must match the refresh token's device.

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `refreshToken` | string | ✅ | Non-empty. Must be a live, non-rotated refresh token. |

```json
{ "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9…" }
```

### Response `200`

```json
{
  "message": "Tokens refreshed successfully",
  "data": {
    "accessToken": "eyJ…",
    "refreshToken": "eyJ…",
    "expiresIn": 900,
    "refreshExpiresIn": 604800
  }
}
```

No `role` field here — unlike login.

**Scope is preserved:** refreshing a `setup_2fa` token while 2FA is still not
enabled returns another `setup_2fa` pair, not full access.

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 401 | `AUTH_REFRESH_TOKEN_NOT_PROVIDED` | Body field absent. |
| 401 | `AUTH_INVALID_REFRESH_TOKEN` | **Reuse detected.** Message: *"Refresh token reuse detected. All sessions have been terminated for security. Please login again."* |
| 401 | `AUTH_INVALID_TOKEN_TYPE` | An access token was sent. |
| 401 | `DEVICE_ID_MISMATCH` | Header ≠ token device. |
| 401 | `AUTH_INVALID_CREDENTIALS` | Token subject no longer exists. |
| 429 | `RATE_LIMIT_EXCEEDED` | > 10 refreshes / 2 min. |

⚠️ **Reuse is treated as an attack.** Presenting an already-rotated refresh token
blacklists *every* token for that user across *all* devices. Never retry a
refresh with an old token, and never run two refreshes concurrently.

---

## POST `/auth/logout`

Blacklists the current access token, and the refresh token when supplied.

**Auth:** Bearer · **Role:** any · **Success:** `200 OK`

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `refreshToken` | string | ❌ | 10–2048 chars when present. Omit it and only the access token is revoked. |

```json
{ "refreshToken": "eyJ…" }
```
An empty body `{}` is valid.

### Response `200`

```json
{ "message": "Logout successful", "data": null }
```

Reachable while holding a `setup_2fa` token or under the forced-password-change
lockdown.

---

## GET `/auth/me`

**Auth:** Bearer · **Role:** any · **Success:** `200 OK`

### Response `200`

```json
{
  "message": "User retrieved successfully",
  "data": {
    "id": "3f1a2b4c-5d6e-7f80-9012-3456789abcde",
    "email": "ahmad.hassan@example.com",
    "firstName": "أحمد",
    "lastName": "حسن",
    "username": "ahmadhassan42",
    "usernameChangedAt": null,
    "role": "REPRESENTATIVE",
    "status": "ACTIVE",
    "emailVerified": true,
    "phoneVerified": false,
    "createdAt": "2026-07-01T08:30:00.000Z"
  }
}
```

`username` and `usernameChangedAt` are nullable. `usernameChangedAt !== null`
means the one-time username change has been spent.

If the user vanished between token issue and this call, `data` is `null` with a
`200`.

---

## POST `/auth/forgot-password`

**Auth:** public · **Success:** `200 OK` · **Throttle:** 4 / 10 min / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `email` | string | ✅ | Valid email, ≤ 255 chars. Trimmed, lower-cased. |

### Response `200` — always the same

```json
{
  "message": "If the email exists, a reset code will be sent",
  "data": null
}
```

Unknown addresses produce this exact response. The code is emailed, never
returned.

---

## POST `/auth/reset-password`

**Auth:** public · **Success:** `200 OK` · **Throttle:** 4 / 10 min / IP

### Request

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `email` | string | ✅ | Valid email, ≤ 255 chars. Trimmed, lower-cased. |
| `code` | string | ✅ | 6–20 chars, `^[A-Z0-9]+$` — **uppercase letters and digits only**. Trimmed. |
| `newPassword` | string | ✅ | Same complexity rule as registration: 8–128 chars with lowercase + uppercase + digit + special character. |

```json
{
  "email": "ahmad.hassan@example.com",
  "code": "A7X2K9",
  "newPassword": "N3w!Str0ngPass"
}
```

### Response `200`

```json
{ "message": "Password reset successful", "data": null }
```

### Errors

| Status | `error.code` | Cause |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Weak password, malformed code. |
| 400 | `AUTH_INVALID_RESET_CODE` | Wrong, expired or already-used code. Also returned for an unknown email. |
| 429 | `RATE_LIMIT_EXCEEDED` | > 4 attempts / 10 min from this IP. |

---

# Workflows

## 1. Registration → first login (the closed-registration path)

```
Rep                        API                       Sales Manager
 |                          |                              |
 |-- POST /auth/register -->|  (needs managerCode)         |
 |<-- 201 verificationId ---|  ✉ 6-digit code emailed      |
 |                          |                              |
 |-- POST /auth/verify-otp->|                              |
 |<-- 200 PENDING_APPROVAL -|  status → PENDING_APPROVAL   |
 |    (no tokens)           |    device binding completed  |
 |                          |                              |
 |                          |<-- GET /representatives/pending
 |                          |<-- POST /representatives/{id}/approve
 |                          |    status → ACTIVE           |
 |                          |                              |
 |-- POST /auth/login ----->|                              |
 |<-- 200 LOGIN_SUCCESS ----|  full tokens                 |
```

1. The rep obtains a manager code from their Sales Manager offline.
2. `POST /auth/register` → `201` with `verificationId`. Code emailed.
3. `POST /auth/verify-otp` → `PENDING_APPROVAL`. **No tokens.** The client should
   show a waiting screen, not a retry prompt.
4. Logging in before approval also returns `PENDING_APPROVAL`.
5. The Sales Manager approves via
   [`POST /representatives/{id}/approve`](users.md#post-representativesrepresentativeidapprove).
6. `POST /auth/login` → `LOGIN_SUCCESS`. The device was already verified in
   step 3, so there is no second device OTP.

If the manager **rejects**, the account is deleted and the email/phone are freed
— the person can register again with the same code.

## 2. Login on a new device

```
POST /auth/login              → 200 { verificationType: "DEVICE", verificationId }
   ✉ code emailed, naming the device
POST /auth/verify-otp         → 200 { verificationType: "LOGIN_SUCCESS", tokens }
```

Same `verificationId` handle, same 6-digit code shape as email verification. Use
`/auth/resend-verification` if the mail does not arrive (3 per 2 minutes).

## 3. General Manager login with 2FA

**First time (2FA not yet enabled):**
```
POST /auth/login       → 200 { verificationType: "SETUP_2FA", tokens }   ← limited scope
   … the setup token reaches only /auth/2fa/setup, /auth/2fa/verify,
     /auth/2fa/status and /auth/logout. Everything else → 403.
POST /auth/2fa/setup   → QR / secret
POST /auth/2fa/verify  → 2FA enabled
```

The lockdown 403 carries `error.code: "HTTP_EXCEPTION"` — identify it by its
message, *"Two-factor authentication setup is required before accessing this
resource"* (see [README §6](README.md#6-two-scope-lockdowns)).

**Afterwards:**
```
POST /auth/login       → 200 { verificationType: "2FA", verificationId }
POST /auth/verify-otp  → 200 { verificationType: "LOGIN_SUCCESS", tokens }   ← full scope
```

When a General Manager logs in from a **new device**, the device OTP comes first;
`/auth/verify-otp` then answers `2FA` or `SETUP_2FA` rather than
`LOGIN_SUCCESS`, and a second `/auth/verify-otp` finishes the login.

## 4. Token lifecycle

```
                       access token expires (expiresIn)
                                    ↓
  POST /auth/refresh { refreshToken }  +  X-Device-Id
                                    ↓
      new pair issued · old access+refresh blacklisted · old session archived
```

Rules to build against:

- Serialise refreshes. Two concurrent calls mean one presents a rotated token and
  trips reuse detection.
- On `AUTH_INVALID_REFRESH_TOKEN`, **all** sessions on **all** devices are gone.
  Clear local state and send the user to login.
- Retrying a failed refresh with the same token is never correct.
- A `setup_2fa` refresh stays `setup_2fa` until 2FA is enabled.

## 5. Forgot password

```
POST /auth/forgot-password { email }   → 200 (always)   ✉ reset code
POST /auth/reset-password  { email, code, newPassword } → 200
```

The reset code alphabet is uppercase letters and digits — do **not** apply the
6-digit numeric mask used for OTPs. Existing sessions are notified; the user then
logs in normally.

## 6. Provisioned staff first login

An account created via
[`POST /admin/users`](users.md#post-adminusers) receives its password by email
and is locked down until it is replaced:

```
POST /auth/login          → 200 LOGIN_SUCCESS (full tokens)
GET  /territories         → 403 "You must change your temporary password
                                 before accessing this resource"
PUT  /users/me/password   → 200   ← the only route that works, besides /auth/logout
GET  /territories         → 200
```

The lockdown is keyed on the account, not the token scope, so it applies even
though the tokens themselves are full-scope. `error.code` is the generic
`HTTP_EXCEPTION` — match on the message. It lifts immediately on success, the
auth cache being invalidated as part of the change.
