# newpower API — Auth, User & Territory

Reference documentation for the three modules, generated from the source of truth
(`src/auth`, `src/user`, `src/territory`).

| Document | Covers |
| --- | --- |
| [auth.md](auth.md) | `/auth/*` — registration, login, OTP, tokens, password reset |
| [users.md](users.md) | `/users/*`, `/admin/users/*`, `/representatives/*` |
| [territories.md](territories.md) | `/territories/*` — definitions, hierarchy, assignments, geo lookup |

Everything below is shared by all three and is **not** repeated in each document.

---

## 1. Base URL and versioning

```
{host}/api/v1
```

Set by `app.setGlobalPrefix('api/v1')` in [main.ts:164](../../src/main.ts#L164).
Every path in these documents is relative to that prefix — `/auth/login` means
`POST {host}/api/v1/auth/login`.

Swagger UI is served at `{host}/api/docs` in every environment **except**
production.

---

## 2. Request headers

| Header | When | Notes |
| --- | --- | --- |
| `Content-Type: application/json` | Any request with a body | Required. |
| `Authorization: Bearer <accessToken>` | Every protected route | Access token from login / verify-otp / refresh. |
| `X-Device-Id: <deviceId>` | **Every protected route** | Must equal the `deviceId` baked into the token. See below. |
| `X-TOTP-Code: <6 digits>` | Routes marked `2FA` | Only enforced for `GENERAL_MANAGER`. May instead be sent as `totpCode` in the body. |
| `X-Idempotency-Key` | Optional | Accepted by CORS; not consumed by these three modules. |

### `X-Device-Id` is mandatory

Both the access strategy ([jwt.strategy.ts:58-65](../../src/auth/strategies/jwt.strategy.ts#L58-L65))
and the refresh strategy ([jwt-refresh.strategy.ts:52-59](../../src/auth/strategies/jwt-refresh.strategy.ts#L52-L59))
compare this header against the `deviceId` claim in the JWT. A missing **or**
mismatched header is a token-replay signal and fails identically:

```http
401 Unauthorized
```
```json
{
  "success": false,
  "message": "Device ID mismatch. The device making this request does not match the device in the authentication token.",
  "error": { "code": "DEVICE_ID_MISMATCH", "statusCode": 401 },
  "meta": { "timestamp": "2026-07-28T09:12:03.114Z", "path": "/api/v1/auth/me", "correlationId": "…" }
}
```

Use the same `deviceId` string you sent to `/auth/register` or `/auth/login`.

---

## 3. Response envelope

Every successful response is wrapped by
[`TransformResponseInterceptor`](../../src/common/interceptors/transform-response.interceptor.ts).

```json
{
  "success": true,
  "message": "Human-readable summary",
  "data": {},
  "meta": {
    "timestamp": "2026-07-28T09:12:03.114Z",
    "path": "/api/v1/auth/me",
    "correlationId": "b0c7f2f1-…"
  }
}
```

- `data` is `null` for endpoints that only confirm an action.
- **List endpoints** add a sibling `pagination` object:

```json
{
  "success": true,
  "message": "Territories retrieved successfully",
  "data": [ /* items */ ],
  "pagination": { "total": 137, "page": 1, "limit": 20, "totalPages": 7 },
  "meta": { "timestamp": "…", "path": "…", "correlationId": "…" }
}
```

> Note the asymmetry: `pagination` sits **beside** `data`, not inside `meta`.

For brevity, the per-endpoint examples in the other documents show only the
`message` / `data` / `pagination` portion. `success` and `meta` are always
present.

### The nested-message shape (read this)

A handful of confirm-only endpoints return **just a message** internally. The
interceptor only recognises the flat shape when *both* `message` and `data` keys
are present, so these fall through to the raw-wrap branch and the real message
ends up **one level down**, with `"Success"` at the top:

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "Territory archived successfully" },
  "meta": { "timestamp": "…", "path": "…", "correlationId": "…" }
}
```

Affected endpoints — each is flagged **`nested message`** in the other documents:

| Endpoint |
| --- |
| `DELETE /territories/{id}` |
| `POST /territories/{id}/assignments` |
| `DELETE /territories/{id}/assignments/{userId}` |
| `PUT /admin/users/{userId}/status` |
| `PUT /admin/users/{userId}/role` |
| `POST /admin/users/{userId}/force-logout` |
| `POST /admin/users/{userId}/reset-password` |
| `POST /representatives/{representativeId}/approve` |
| `POST /representatives/{representativeId}/reject` |

Read the user-facing string from `data.message` on these, and from the top-level
`message` everywhere else. Do not build a client that trusts the top-level
`message` universally.

---

## 4. Error envelope

Produced identically by the global filters and by the per-module domain filters
(`AuthDomainExceptionFilter`, `TerritoryDomainExceptionFilter`), so an error is
indistinguishable on the wire regardless of which layer raised it.

```json
{
  "success": false,
  "message": "Invalid credentials",
  "error": { "code": "AUTH_INVALID_CREDENTIALS", "statusCode": 401 },
  "meta": {
    "timestamp": "2026-07-28T09:12:03.114Z",
    "path": "/api/v1/auth/login",
    "correlationId": "b0c7f2f1-…"
  }
}
```

| Field | Meaning |
| --- | --- |
| `message` | Display string. For validation failures this is the **first** failing rule only. |
| `error.code` | Stable machine identifier — branch on this, never on `message`. |
| `error.statusCode` | Mirrors the HTTP status. |
| `error.details` | **Development only.** Stripped whenever `NODE_ENV !== 'development'`, including staging and test. |
| `debug` | **Development only.** Exception type + truncated stack. |

`error.details` and `debug` are deleted defensively in
[all-exceptions.filter.ts](../../src/common/filters/all-exceptions.filter.ts) —
never build a client against them.

### Validation errors

The global pipe runs with `whitelist: true`, `forbidNonWhitelisted: true`,
`transform: true` and `enableImplicitConversion: true`
([main.ts:84-93](../../src/main.ts#L84-L93)). Consequences:

- An unknown property in the body is a **400**, not a silent strip.
- Query-string values are coerced to the DTO's declared type.
- `message` carries only the first failure; the complete list is in
  `error.details.validationErrors` **in development only**.

```json
{
  "success": false,
  "message": "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character",
  "error": {
    "code": "VALIDATION_ERROR",
    "statusCode": 400,
    "details": {
      "validationErrors": [
        "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character",
        "Phone number must be in E.164 format (e.g., +963123456789)"
      ]
    }
  },
  "meta": { "timestamp": "…", "path": "/api/v1/auth/register", "correlationId": "…" }
}
```

### Errors shared by every protected route

| Status | `error.code` | Cause |
| --- | --- | --- |
| 401 | `AUTH_TOKEN_NOT_FOUND` | No `Authorization` header. |
| 401 | `DEVICE_ID_MISMATCH` | `X-Device-Id` missing or ≠ the token's device. |
| 401 | `AUTH_TOKEN_REVOKED` | Token blacklisted (logout, password change, forced logout, rotation). |
| 401 | `AUTH_INVALID_TOKEN_TYPE` | Refresh token sent where an access token is expected. |
| 401 | `AUTH_USER_NOT_FOUND` | Token subject no longer exists. |
| 401 | `AUTH_USER_NOT_ACTIVE` | Account is not `ACTIVE` or `PENDING_VERIFICATION`. |
| 401 | `HTTP_EXCEPTION` | Expired or malformed JWT (`message: "Unauthorized"`). |
| 403 | `Forbidden` | `RolesGuard` rejected the role (`message: "Forbidden resource"`). |
| 403 | `HTTP_EXCEPTION` | A scope lockdown — distinguish by `message`, see §6. |
| 429 | `RATE_LIMIT_EXCEEDED` | Throttle tripped — see §7. |
| 409 | `CONFLICT` | Unique-constraint violation, deliberately generic to prevent enumeration. |
| 500 | `INTERNAL_SERVER_ERROR` | Unhandled fault. |

---

## 5. Roles

Four roles form a **ranked** hierarchy
([user-role.ts](../../src/auth/domain/model/user-role.ts)):

| Rank | Role | Who they are |
| --- | --- | --- |
| 1 | `REPRESENTATIVE` | Field rep, primary mobile-app user. |
| 2 | `SALES_MANAGER` | Supervises a team of representatives. |
| 3 | `SALES_ADMIN` | Back office; runs the admin console. |
| 4 | `GENERAL_MANAGER` | Top of the hierarchy; role management, 2FA-gated. |

Two decorators enforce access, and `RolesGuard` applies **both** when both are
present:

- `@MinRole(X)` — rank X **and everything above it**. Documented here as
  `SALES_MANAGER+`.
- `@Roles(A, B)` — exact match against the list. Documented as
  `SALES_MANAGER (exact)`.

`@Roles` is deliberate wherever it appears: the two territory-assignment routes
use exact `SALES_MANAGER` because putting a rep on a territory is a manager's own
team-management act — back office curates master data but does not run the team,
and the General Manager is read-only over operations.

`GENERAL_MANAGER` is never grantable through the API. It is seeded directly in
the database.

### Account statuses

`PENDING_VERIFICATION` → `PENDING_APPROVAL` → `ACTIVE`, plus `SUSPENDED` and
`BANNED`. Only `ACTIVE` and `PENDING_VERIFICATION` accounts can authenticate;
everything else fails at the JWT strategy with `AUTH_USER_NOT_ACTIVE`.

---

## 6. Two scope lockdowns

Both are enforced by [`SetupScopeGuard`](../../src/auth/guards/setup-scope.guard.ts)
on **every** authenticated route.

**`setup_2fa` scope** — a 2FA-gated role that logged in without 2FA enabled
receives limited-scope tokens. They reach only:

```
/auth/2fa/setup   /auth/2fa/verify   /auth/2fa/status   /auth/logout
```

**Forced password change** — an account provisioned via
`POST /admin/users` carries `mustChangePassword`. It reaches only:

```
/users/me/password   /auth/logout
```

The lockdown lifts the moment `PUT /users/me/password` succeeds; the auth cache
is invalidated so it takes effect immediately.

⚠️ **Both surface as `403` with `error.code: "HTTP_EXCEPTION"`.** The guard
attaches richer fields (`errorCode`, `setupUrl`, `changePasswordUrl`, `scope`)
but the global filter rebuilds the envelope from `message` and `error` only, so
those fields never reach the client. **Branch on the message:**

| `message` | Meaning |
| --- | --- |
| `Two-factor authentication setup is required before accessing this resource` | Send the user to `/auth/2fa/setup`. |
| `You must change your temporary password before accessing this resource` | Send the user to `PUT /users/me/password`. |

---

## 7. Rate limiting

Global default: **30 requests / 60 s**, keyed on `userId` when authenticated and
on the validated client IP otherwise
([`UserThrottlerGuard`](../../src/auth/guards/user-throttler.guard.ts)). Public
auth routes override this with much tighter per-IP limits — listed per endpoint
in [auth.md](auth.md).

Tripping a limit returns `429` with `error.code: "RATE_LIMIT_EXCEEDED"`.

---

## 8. Anti-enumeration behaviour

Several endpoints answer *identically* for existing and non-existing accounts, and
the difference is environment-dependent. This is deliberate (`MH-22`) and is
called out per endpoint:

| Endpoint | Production | Development / staging |
| --- | --- | --- |
| `POST /auth/register` (duplicate email) | `201` with a **fake** `verificationId` and `user.id` | `409 AUTH_EMAIL_ALREADY_EXISTS` |
| `POST /auth/register` (duplicate phone) | `409 AUTH_PHONE_ALREADY_EXISTS` | same |
| `POST /auth/login` (banned/suspended) | `401 AUTH_INVALID_CREDENTIALS` | `403 AUTH_ACCOUNT_BANNED` / `AUTH_ACCOUNT_SUSPENDED` |
| `POST /auth/forgot-password` | `200` regardless | same |
| `POST /auth/resend-verification` | `200` regardless | same |

Never treat a `201` from `/auth/register` in production as proof the account was
created.

---

## 9. Correlation IDs

Every response carries `meta.correlationId`, injected by
`CorrelationIdInterceptor` and threaded into every server-side log line and audit
row. Quote it when reporting a problem.
