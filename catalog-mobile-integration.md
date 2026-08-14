# Mobile API Integration Specification — Catalogue

**Scope:** the rep-facing catalogue surface (`/catalog/*`, `/categories/*`, `/products/*`).
**Audience:** Flutter developer implementing catalogue browse, search, filter and offline sync.
**Source of truth:** `src/catalog/**`, `src/common/**`, `src/main.ts`, `prisma/schema.prisma` — read directly, not from Swagger.

Every statement here is labelled:

| Label | Meaning |
| --- | --- |
| **[C]** Confirmed | Directly readable in the backend source. |
| **[I]** Inferred | Strongly implied by the code but not stated anywhere. |
| **REQUIRES BACKEND CONFIRMATION** | Not determinable from the source. Do not guess. |

Admin routes (`/admin/catalog/*`, `SALES_ADMIN`+) are **out of scope** — the mobile app never calls them.

---

## 1. Backend Overview

**[C]** NestJS + CQRS (`@nestjs/cqrs`) + Prisma over PostgreSQL. The catalogue module follows ports-and-adapters: controllers → queries → handlers → `CatalogRepositoryPort` / `CatalogPublishingPort` → Prisma adapters.

**[C]** Two distinct read paths exist and they are **not** the same data source:

1. **Online browse** — served from the **live tables** (`Product`, `Category`, `ProductAttributeValue`), gated on membership in the current *published* catalogue version.
2. **Offline payload** — served from **frozen snapshots** (`CatalogVersionItem.payload`), written at publish time.

**[C]** Because online reads hit live tables and offline reads hit frozen snapshots, an edit to an already-published product appears **online immediately but offline only after the next publish**. The backend calls this "drift" and exposes it to admins only. The mobile app cannot see or resolve it — see §10 (BR-11).

**[C]** Scale, as documented in source comments against the live seed: 1005 products, 43 categories, 100 attributes, 155 options, ~10,260 facet values. The repository explicitly notes it materialises full id sets and is designed for this scale (`prisma-catalog.repository.ts:48-58`).

**[C]** The catalogue is **shared master data with no per-user scoping**. A `REPRESENTATIVE` and a `GENERAL_MANAGER` see exactly the same tree, the same products and the same counts (`category.controller.ts:29-33`). There is no territory filtering, no ownership, no row-level security on this surface.

---

## 2. Base URL and Global API Rules

### 2.1 Base URL

**[C]** `app.setGlobalPrefix('api/v1')` — every path below is relative to:

```
{host}/api/v1
```

**[C]** Swagger UI at `{host}/api/docs` in every environment **except** production.

### 2.2 Validation pipe — three consequences you must design for

**[C]** `main.ts:89-98`:

```ts
new ValidationPipe({
  whitelist: true,
  forbidNonWhitelisted: true,
  transform: true,
  transformOptions: { enableImplicitConversion: true },
})
```

| Rule | Consequence for the mobile client |
| --- | --- |
| `forbidNonWhitelisted: true` | An **unknown query parameter is a 400**, not a silent strip — *on endpoints that bind a DTO*. |
| `transform` + `enableImplicitConversion` | Query strings are coerced to the DTO's declared type. `?page=2` arrives as the number `2`. |
| Validation message | `message` carries only the **first** failing rule. The full list is in `error.details.validationErrors` **in development only**. |

**[C]** **Important asymmetry.** `GET /catalog/attributes` and `GET /catalog/version` bind **no DTO at all** (`catalog.controller.ts:39,54`). Unknown query parameters sent to those two are **ignored**, not rejected. Every other catalogue endpoint binds a DTO and will 400 on an unknown parameter.

**[I]** Practically: never append tracking/cache-busting query params (`?_t=…`) to catalogue endpoints. They will 400 on 7 of the 9.

### 2.3 Rate limiting

**[C]** Global default, `app.module.ts:35-41`: **30 requests / 60 000 ms**, keyed on `userId` when authenticated (`UserThrottlerGuard`), on validated client IP otherwise.

**[C]** No catalogue route declares its own `@Throttle` override. The global 30/60s applies to all nine endpoints, **shared across them** (one bucket per user).

**[C]** Tripping it returns `429` with `error.code: "RATE_LIMIT_EXCEEDED"`.

⚠️ **[I] This is tight for a catalogue.** A single "open category" interaction costs 2 requests (filters + products). A typeahead that fires per keystroke will exhaust 30/minute in ~15 characters. Debounce and cache are not optional — see §19.4.

**REQUIRES BACKEND CONFIRMATION:** whether a `Retry-After` header is emitted on 429. The `@nestjs/throttler` default does send `Retry-After`, but no code in this repository sets or customises it, and no test asserts it.

### 2.4 CORS / accepted headers

**[C]** `main.ts` `allowedHeaders`: `Content-Type`, `Authorization`, `X-TOTP-Code`, `X-Idempotency-Key`, `X-Device-Id`. Methods: `GET, POST, PUT, PATCH, DELETE, OPTIONS`.

**[I]** Irrelevant to a native Flutter client (CORS is browser-enforced); listed only so a Flutter Web build is not surprised.

### 2.5 Correlation IDs

**[C]** Every response — success and error — carries `meta.correlationId`, threaded into server logs. **Log it client-side on every error.** It is the only way to trace a field report back to a server-side log line.

---

## 3. Authentication & Headers

### 3.1 Every catalogue endpoint is protected

**[C]** All three controllers carry `@MinRole(UserRole.REPRESENTATIVE)` at class level. None of the nine routes is `@Public()`.

**[C]** `@MinRole` means "this rank **and everything above it**" — the role hierarchy is ranked (`user-role.ts`):

| Rank | Role | Can call catalogue endpoints? |
| --- | --- | --- |
| 1 | `REPRESENTATIVE` | ✅ |
| 2 | `SALES_MANAGER` | ✅ |
| 3 | `SALES_ADMIN` | ✅ |
| 4 | `GENERAL_MANAGER` | ✅ |

**[C]** So in practice: **any authenticated, active user can read the entire catalogue.** There is no role branch to implement on this surface.

### 3.2 Required headers — all nine endpoints

| Header | Required | Type | Value |
| --- | --- | --- | --- |
| `Authorization` | **Yes** | String | `Bearer <accessToken>` |
| `X-Device-Id` | **Yes** | String | Must **equal** the `deviceId` claim baked into the access token. |
| `Content-Type` | No | String | All nine endpoints are `GET` with no body. |
| `X-TOTP-Code` | No | — | Not used by any catalogue route. |

**[C]** `X-Device-Id` is enforced by `jwt.strategy.ts:58-65` on every protected route. Missing **or** mismatched fails identically:

```http
401 Unauthorized
```
```json
{
  "success": false,
  "message": "Device ID mismatch. The device making this request does not match the device in the authentication token.",
  "error": { "code": "DEVICE_ID_MISMATCH", "statusCode": 401 },
  "meta": { "timestamp": "2026-08-13T09:12:03.114Z", "path": "/api/v1/products", "correlationId": "b0c7f2f1-…" }
}
```

Send the **same** `deviceId` string used at `/auth/register` or `/auth/login`. Persist it; never regenerate it per launch.

### 3.3 Token lifecycle (prerequisite, documented in `auth.md`)

**[C]**

| Token | Lifetime | Where it comes from |
| --- | --- | --- |
| `accessToken` | `expiresIn: 900` s (15 min) | `/auth/login`, `/auth/verify-otp`, `/auth/refresh` |
| `refreshToken` | `refreshExpiresIn: 604800` s (7 days) | same |

**[C]** Refresh contract, and three rules that are load-bearing for a catalogue client that fires many parallel requests:

```
POST /api/v1/auth/refresh
X-Device-Id: <deviceId>          ← still required
(no Authorization header)
{ "refreshToken": "eyJ…" }
```

1. **Refresh rotates.** The old access **and** refresh tokens are blacklisted; the old session is archived.
2. **Serialise refreshes.** Two concurrent refreshes mean one presents an already-rotated token → `AUTH_INVALID_REFRESH_TOKEN` → **every session on every device is terminated**.
3. **Never retry a failed refresh with the same token.** It can never succeed.

⚠️ **[I] This is the single highest-risk integration point for a catalogue screen.** A category screen fires `/categories/filters` and `/products` in parallel. If the access token expires between them, both 401 simultaneously and a naive interceptor issues two refreshes → reuse detection → the rep is logged out of every device. **The refresh interceptor must hold a single-flight mutex and queue the second 401.**

### 3.4 Two scope lockdowns that also block the catalogue

**[C]** `SetupScopeGuard` runs on **every** authenticated route, including all nine catalogue endpoints.

| Lockdown | Reachable routes | What a catalogue call returns |
| --- | --- | --- |
| `setup_2fa` scope (2FA-gated role logged in without 2FA) | `/auth/2fa/setup`, `/auth/2fa/verify`, `/auth/2fa/status`, `/auth/logout` | `403` |
| Forced password change (`mustChangePassword`) | `/users/me/password`, `/auth/logout` | `403` |

⚠️ **[C] Both surface as `403` with `error.code: "HTTP_EXCEPTION"`** — the guard's richer fields (`errorCode`, `setupUrl`, `scope`) are stripped by the global filter and never reach the client. **You must branch on `message`:**

| `message` | Mobile action |
| --- | --- |
| `Two-factor authentication setup is required before accessing this resource` | Navigate to 2FA setup. Do **not** log out. |
| `You must change your temporary password before accessing this resource` | Navigate to change-password. Do **not** log out. |

**[I]** A `REPRESENTATIVE` (rank 1) is not 2FA-gated, so in the common mobile case only the forced-password-change lockdown is reachable. Handle both anyway — a `SALES_MANAGER` may use the same app.

---

## 4. Common Request Structure

### 4.1 All nine endpoints are `GET` with no body

**[C]** There is no write surface on the mobile catalogue. Nothing to serialise, no idempotency keys, no optimistic concurrency.

### 4.2 Boolean query parameters

**[C]** `catalog-query.dto.ts:34-48` — a custom `toBoolean` transform reads the **raw** string:

| Sent | Parsed |
| --- | --- |
| `true`, `TRUE`, `1` | `true` |
| `false`, `FALSE`, `0` | `false` |
| anything else (`yes`, `on`, `"") | passed through unchanged → **fails `@IsBoolean()` → 400 `VALIDATION_ERROR`** |

**[C]** Case-insensitive and trimmed. **Send exactly `true` or `false`.**

**[C]** The transform reads `obj[key]` rather than `value` deliberately: with `enableImplicitConversion`, class-transformer would coerce `"false"` via `Boolean("false") === true` and **silently invert the flag**. This was specifically a bug on `available`.

### 4.3 The `attr` map — bracket query syntax

**[C]** Attribute filters are a **single whitelisted DTO property holding a map**, not top-level params:

```
?attr[POWER]=10..20&attr[BODY_COLOUR]=BLACK,WHITE
```

**[C]** Why: `forbidNonWhitelisted: true` means top-level `?POWER=10..20` would 400 on every one of the 100 admin-editable attribute codes, none of which the DTO can statically declare.

**[I] Dart/Dio encoding.** Dio's default `ListFormat` does not produce `attr[KEY]=value` from a `Map`. You must flatten manually:

```dart
final query = <String, dynamic>{ 'page': 1, 'limit': 20 };
attr.forEach((code, value) => query['attr[$code]'] = value);
```

**[C]** Attribute codes are **upper-cased** by the parser (`facet-filter.parser.ts:230`), so `attr[power]` and `attr[POWER]` resolve identically. ENUM option codes are also upper-cased (`:266-268`). TEXT values are **not** case-normalised at parse time but are matched case-insensitively by the repository.

**[C]** An **empty** value is "no opinion", not an error: `attr[POWER]=` is skipped silently (`:237-239`).

**[C]** Escaping: within a comma-separated list, a literal comma is `\,` and a literal backslash is `\\` (`splitFilterList`). This matters — `RATED_LOAD` holds values like `Max. 2000W (220-240V/AC), 1000W (110-130V/AC)`. **Do not build these strings yourself** — send back the `code` the filter rail gave you, which is already escaped by `escapeFilterToken`.

---

## 5. Common Response Structure

### 5.1 The standard envelope

**[C]** `TransformResponseInterceptor` wraps every successful response:

```json
{
  "success": true,
  "message": "Categories retrieved successfully",
  "data": { },
  "meta": {
    "timestamp": "2026-08-13T09:12:03.114Z",
    "path": "/api/v1/categories",
    "correlationId": "b0c7f2f1-4d3a-4a1e-9d5c-0f1e2b3c4d5e"
  }
}
```

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `success` | boolean | No | Always `true` on 2xx. |
| `message` | string | No | Human-readable summary. **Not** a stable identifier — never branch on it (except the two 403 lockdowns in §3.4). |
| `data` | object \| array \| null | Yes | The payload. |
| `meta.timestamp` | string (ISO-8601 UTC) | No | Server time. |
| `meta.path` | string | No | Request path including prefix. |
| `meta.correlationId` | string \| null | Yes | Trace id. Log it. |

### 5.2 ⚠️ `GET /products` uses a DIFFERENT envelope — read this before writing any model

**[C]** This is the most important structural fact in this document, and it is **not** documented anywhere else in the repo.

The interceptor takes the "flat" branch only when the handler returns an object with **both** `message` **and** `data` keys (`transform-response.interceptor.ts:37-51`). `ProductController.list` returns:

```ts
return { message: 'Products retrieved successfully', ...paginate(items, total, page, limit) };
// → { message, items, total, page, limit, totalPages }   ← has `message`, has NO `data`
```

So it **falls through to the raw-wrap branch** (`:53-57`) and the real payload is nested **one level down**, with `"Success"` at the top and **no sibling `pagination` object**:

```json
{
  "success": true,
  "message": "Success",
  "data": {
    "message": "Products retrieved successfully",
    "items": [ /* ProductListItem[] */ ],
    "total": 137,
    "page": 1,
    "limit": 20,
    "totalPages": 7
  },
  "meta": { "timestamp": "…", "path": "/api/v1/products", "correlationId": "…" }
}
```

**[C]** This contradicts the pattern in `docs/api/README.md §3`, which documents list endpoints as `data: [...]` **beside** a top-level `pagination` object. That shape is what `/territories` and `/projects` return (they build `pagination:` explicitly). **The catalogue product list does not.**

**Mobile contract:**

| Endpoint | Read the list from | Read paging from | Read the message from |
| --- | --- | --- | --- |
| `GET /products` | `data.items` | `data.total` / `data.page` / `data.limit` / `data.totalPages` | `data.message` |
| **All 8 other catalogue endpoints** | `data` | n/a | `message` |

**[I]** Write two response wrappers in Dart (`ApiResponse<T>` and `PaginatedProductResponse`) rather than one generic that assumes `data` is the payload. See §21-Q1 — this is a strong candidate for a backend fix, and a client that reads `data.items` will keep working either way **only if** you also tolerate a future top-level `pagination`. Guard defensively.

### 5.3 Dates

**[C]** `publishedAt` is a `Date` in the read model, serialised by Express/`JSON.stringify` as **ISO-8601 UTC** (`"2026-08-01T10:22:31.004Z"`). Nullable.

**[I]** No other catalogue response carries a timestamp. Products expose no `createdAt`/`updatedAt` on the rep-facing surface — you cannot implement "recently added" client-side; use `sort=newest`.

---

## 6. Common Error Structure

**[C]** Produced identically by `CatalogDomainExceptionFilter` (`:169-179`) and by the global filters, so an error is indistinguishable on the wire regardless of origin:

```json
{
  "success": false,
  "message": "\"track-lightt\" is not a filterable attribute.",
  "error": { "code": "CATALOG_UNKNOWN_FILTER_ATTRIBUTE", "statusCode": 400 },
  "meta": {
    "timestamp": "2026-08-13T09:12:03.114Z",
    "path": "/api/v1/products",
    "correlationId": "b0c7f2f1-…"
  }
}
```

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `success` | boolean | No | Always `false`. |
| `message` | string | No | Display string. For validation failures, **only the first** failing rule. |
| `error.code` | string | No | **Stable machine identifier. Branch on this.** |
| `error.statusCode` | number | No | Mirrors the HTTP status. |
| `error.details` | object | — | **Development only.** Stripped when `NODE_ENV !== 'development'` — including staging. Never build against it. |
| `debug` | object | — | **Development only.** Exception type + truncated stack. |
| `meta.*` | — | — | As §5.1. |

**[C]** A catalogue **domain** error is never a 500 — `CatalogDomainExceptionFilter` maps every named error class through an exhaustive table (`CATALOG_ERROR_STATUS`), and an unmapped one falls back to **400**, not 500. A 500 from a catalogue route therefore means a genuine unhandled server fault.

### 6.1 Complete catalogue error-code table

**[C]** Every code reachable from the nine mobile endpoints:

| HTTP | `error.code` | Raised when |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR` | DTO validation failed (bad `page`, `limit` > 100, unknown query param, non-boolean flag, bad enum). |
| 400 | `CATALOG_UNKNOWN_FILTER_ATTRIBUTE` | `attr[X]` where X does not exist **or** is not filterable. Deliberately one error — see §12.6. |
| 400 | `CATALOG_INVALID_FILTER_VALUE` | Malformed numeric filter (`abc`, `..`, `20..10`, `240~220`). |
| 401 | `AUTH_TOKEN_NOT_FOUND` | No `Authorization` header. |
| 401 | `DEVICE_ID_MISMATCH` | `X-Device-Id` missing or ≠ token's device. |
| 401 | `AUTH_TOKEN_REVOKED` | Token blacklisted (logout, password change, forced logout, refresh rotation). |
| 401 | `AUTH_INVALID_TOKEN_TYPE` | Refresh token sent as a Bearer access token. |
| 401 | `AUTH_USER_NOT_FOUND` | Token subject deleted. |
| 401 | `AUTH_USER_NOT_ACTIVE` | Account not `ACTIVE`/`PENDING_VERIFICATION` (suspended, banned, pending approval). |
| 401 | `HTTP_EXCEPTION` | Expired or malformed JWT. `message: "Unauthorized"`. |
| 403 | `HTTP_EXCEPTION` | A scope lockdown (§3.4). Branch on `message`. |
| 404 | `CATALOG_PRODUCT_NOT_FOUND` | Unknown product id/slug, **or** the product exists but is not in the current published version. |
| 404 | `CATALOG_CATEGORY_NOT_FOUND` | Unknown category id/slug (from `/categories/{idOrSlug}`, or from `?category=` on `/products` and `/categories/filters`). |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30 requests / 60 s for this user. |
| 500 | `INTERNAL_SERVER_ERROR` | Unhandled fault. |
| **503** | `CATALOG_NO_PUBLISHED_VERSION` | **No catalogue has ever been published.** See below. |

**[C] Not reachable from mobile** (admin-write only, listed so you don't handle them): `CATALOG_ATTRIBUTE_NOT_FOUND`, `CATALOG_VERSION_NOT_FOUND`, `CATALOG_MEDIA_NOT_FOUND`, `CATALOG_CATEGORY_NOT_EMPTY`, `CATALOG_CATEGORY_CYCLE`, `CATALOG_SLUG_EXISTS`, `CATALOG_SKU_EXISTS`, `CATALOG_ATTRIBUTE_CODE_EXISTS`, `CATALOG_OPTION_CODE_EXISTS`, `CATALOG_ATTRIBUTE_TYPE_IMMUTABLE`, `CATALOG_ATTRIBUTE_IN_USE`, `CATALOG_OPTION_IN_USE`, `CATALOG_UNKNOWN_OPTION`, `CATALOG_REQUIRED_ATTRIBUTE_MISSING`, `CATALOG_VALUE_TYPE_MISMATCH`, `CATALOG_UNIT_NOT_CONVERTIBLE`, `CATALOG_DUPLICATE_FACET_POSITION`, `CATALOG_INVALID_RANGE`, `CATALOG_PUBLISH_IN_PROGRESS`, `CATALOG_PUBLISH_PREFLIGHT_FAILED`.

### 6.2 `503 CATALOG_NO_PUBLISHED_VERSION` — the one deliberate 5xx

**[C]** Raised by `GET /catalog/version`, `GET /products`, `GET /products/{idOrSlug}` and `GET /categories/filters` when no `CatalogVersion` has status `PUBLISHED`.

```json
{
  "success": false,
  "message": "No catalog version has been published yet, so the catalogue cannot be browsed.",
  "error": { "code": "CATALOG_NO_PUBLISHED_VERSION", "statusCode": 503 },
  "meta": { "timestamp": "…", "path": "/api/v1/products", "correlationId": "…" }
}
```

**[C]** It is a **server-state** problem, not a client error — the client did nothing wrong. Transient by nature: the next admin publish fixes it.

**[C]** Three endpoints deliberately **do not** raise it:

| Endpoint | Behaviour with nothing published |
| --- | --- |
| `GET /catalog/attributes` | **200** with the full vocabulary. The handler never checks the version. |
| `GET /categories`, `GET /categories/{idOrSlug}` | **200** with the full tree. Categories are not version-gated. |
| `GET /catalog/sync` | **200** with `{ toVersion: 0, changed: [], removed: [], nextCursor: null, complete: true }` — **not** a 503. |
| `GET /products/suggest` | **200** with `[]` — `suggest()` returns early on no version. |

**[I] Mobile action:** show a "catalogue not available yet" state; do **not** log out, do **not** clear cache, offer retry. If an offline copy exists, keep serving it — a 503 says nothing about the validity of what the client already holds.

---

## 7. Endpoint Catalog

Nine endpoints. All `GET`. All require `Authorization` + `X-Device-Id`. All accessible to `REPRESENTATIVE`+ (i.e. every role).

> Example payloads below are constructed from the **shapes and codes named in the backend source**. Field names, types and nullability are Confirmed; the specific literal values (product names, counts) are illustrative — verify exact strings against a live response before writing golden tests.

---

### 7.1 `GET /catalog/attributes` — the attribute vocabulary

#### Purpose

**[C]** Downloads the full attribute dictionary **once**. Products carry an option **id/code**, never the label — this endpoint is what turns a stored `BLACK` into `"Black"` / `"أسود"`. It is what makes bilingual responses cheap and what lets the client render filter rails and spec-sheet labels **with no network**.

#### HTTP

```text
GET /api/v1/catalog/attributes
```

#### Authentication

`Authorization: Bearer <accessToken>` + `X-Device-Id`. Role: `REPRESENTATIVE`+ (all).

#### Headers

| Header | Required | Type | Description |
| --- | --- | --- | --- |
| `Authorization` | Yes | String | Bearer access token |
| `X-Device-Id` | Yes | String | Must match the token's device claim |

#### Path parameters

None.

#### Query parameters

**[C]** **None accepted.** The controller binds no DTO, so any query string sent is **ignored** (not rejected). The internal `ListAttributesQuery` supports a `search` argument but the controller never passes one — the full vocabulary is always returned.

#### Request body

None.

#### Success response `200`

```json
{
  "success": true,
  "message": "Attributes retrieved successfully",
  "data": [
    {
      "id": "8f14e45f-ceea-467a-9c1e-2b7f0a1c9d33",
      "code": "BODY_COLOUR",
      "label": { "en": "Body Colour", "ar": "لون الجسم" },
      "dataType": "ENUM",
      "canonicalUnit": null,
      "decimalPlaces": null,
      "isFilterable": true,
      "sortOrder": 10,
      "options": [
        { "id": "3c59dc04-8e88-4b1a-9f2e-1d5a7c9b0e21", "code": "BLACK", "label": { "en": "Black", "ar": "أسود" }, "sortOrder": 0 },
        { "id": "b6d767d2-f8ed-4c1b-a0d7-6f2c4e8a1b90", "code": "WHITE", "label": { "en": "White", "ar": "أبيض" }, "sortOrder": 1 }
      ]
    },
    {
      "id": "45c48cce-2e2d-4fbd-aa1c-e6dbf1e97a51",
      "code": "POWER",
      "label": { "en": "Power", "ar": "القدرة" },
      "dataType": "NUMBER",
      "canonicalUnit": "W",
      "decimalPlaces": 1,
      "isFilterable": true,
      "sortOrder": 20,
      "options": []
    }
  ],
  "meta": { "timestamp": "2026-08-13T09:12:03.114Z", "path": "/api/v1/catalog/attributes", "correlationId": "…" }
}
```

#### Response fields — `AttributeView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `id` | String (uuid) | No | Attribute id. Not used in filters — **filters key on `code`**. |
| `code` | String | No | Stable identifier. **This is what you send as `attr[CODE]`.** Upper-case by convention. |
| `label` | `Localized` | No | Display name. `label.en` may be null; `label.ar` never is. |
| `dataType` | `AttributeType` | No | `NUMBER` \| `ENUM` \| `TEXT`. How the value is **stored**. See §12.3 — this is *not* what decides the control. |
| `canonicalUnit` | String | **Yes** | e.g. `"W"`, `"mm"`, `"K"`. Null for unitless/ENUM/TEXT. |
| `decimalPlaces` | Number | **Yes** | NUMBER only. `0` = whole numbers. `null` = unconstrained (backend falls back to 4 dp). |
| `isFilterable` | Boolean | No | Global kill-switch. `false` → sending `attr[CODE]` returns **400**. |
| `sortOrder` | Number | No | Vocabulary ordering. |
| `options` | `AttributeOption[]` | No (may be `[]`) | Populated for ENUM. Empty array for NUMBER/TEXT. |
| `options[].code` | String | No | **The exact token to send** for an ENUM filter. |
| `options[].label` | `Localized` | No | Display. |

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 401 | `DEVICE_ID_MISMATCH` etc. | See §6.1 | §19.1 |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |
| 500 | `INTERNAL_SERVER_ERROR` | Server fault | Retry with backoff |

**[C]** **No 503.** This endpoint works with nothing published.

#### Mobile behaviour

**[C]** Fetch once, persist indefinitely, refresh only when `manifestChecksum` changes (§17). The endpoint's own description calls it "download this once and hold it".

**REQUIRES BACKEND CONFIRMATION:** the vocabulary carries **no version or checksum of its own**. `manifestChecksum` hashes *product* payloads, so an admin renaming an attribute label or adding an option produces **no observable signal** on any mobile-facing endpoint. There is no correct client-side invalidation trigger. See §21-Q3.

#### Dependencies

Feeds `label`/`options` for offline rendering of filters and spec sheets. Depends on nothing.

---

### 7.2 `GET /catalog/version` — the published manifest

#### Purpose

**[C]** The cheap staleness probe. Resolves no products, so it can be called every app launch. Comparing `manifestChecksum` tells the client whether its offline copy is current **without diffing 1005 rows**.

#### HTTP

```text
GET /api/v1/catalog/version
```

#### Authentication

Bearer + `X-Device-Id`. `REPRESENTATIVE`+.

#### Query parameters

**[C]** None accepted; no DTO bound, so extras are ignored.

#### Success response `200`

```json
{
  "success": true,
  "message": "Catalog version retrieved successfully",
  "data": {
    "versionNumber": 4,
    "publishedAt": "2026-08-01T10:22:31.004Z",
    "itemCount": 1005,
    "manifestChecksum": "9f2c8a7e1d4b0653fbe2a9c8d7e6f5a4b3c2d1e0f9a8b7c6d5e4f3a2b1c0d9e8"
  },
  "meta": { "timestamp": "…", "path": "/api/v1/catalog/version", "correlationId": "…" }
}
```

#### Response fields — `CatalogVersionView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `versionNumber` | Number (int) | No | Monotonic. **Pass this as `?since=` on the next sync.** |
| `publishedAt` | String (ISO-8601) | **Yes** | Null is possible per the type, though a `PUBLISHED` row would normally carry one. Treat as nullable. |
| `itemCount` | Number | No | Products in this version. Use for sync progress ("312 / 1005"). |
| `manifestChecksum` | String (sha256 hex, 64 chars) | No | **Opaque.** Hash over the version's item checksums. |

⚠️ **[C] `manifestChecksum` is opaque and must only be compared against a value previously stored from this same endpoint.** Two different algorithms exist in the codebase: `prisma-catalog.repository.ts:177-179` hashes `checksum` values joined by `\n` (ordered by productId), while `catalog-payload.builder.ts:96-108` hashes `productId:checksum` pairs. They produce **different strings for identical data**. Only the first is ever served to a client — but never derive, recompute or cross-compare this value client-side.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |
| **503** | `CATALOG_NO_PUBLISHED_VERSION` | Nothing published | Keep any existing cache; show "catalogue unavailable"; do not clear state |

#### Mobile behaviour

**[C]** Call on every app launch (and on resume-from-background, **[I]** debounced). Compare `manifestChecksum` with the stored one:

- **Equal** → offline copy is current. No sync.
- **Different** → run delta sync with `?since=<storedVersionNumber>` (§7.3).
- **No stored value** → full sync (omit `since`).

#### Dependencies

Gates §7.3. `versionNumber` is the `since` input for sync.

---

### 7.3 `GET /catalog/sync` — full download / delta sync

#### Purpose

**[C]** The offline payload (CP3). Omit `since` for a full download; pass the held version to receive **only what changed**. Deltas are computed from per-item checksums, so a client on version 3 downloads the handful of products that actually moved rather than several megabytes.

#### HTTP

```text
GET /api/v1/catalog/sync?since=3&limit=100
GET /api/v1/catalog/sync?since=3&cursor=7f3a…&limit=100
```

#### Authentication

Bearer + `X-Device-Id`. **[C]** `REPRESENTATIVE`+ — despite living beside admin publishing internals, this route is on `CatalogController` and is rep-accessible.

#### Query parameters — `SyncQueryDto`

| Name | Type | Required | Default | Validation | Meaning |
| --- | --- | --- | --- | --- | --- |
| `since` | Integer | No | — | `@IsInt()`, `@Min(1)` | The version the client already holds. **Omit for a full download.** |
| `cursor` | String | No | — | `@IsString()`, `@MaxLength(100)` | Opaque cursor from the previous page's `nextCursor`. |
| `limit` | Integer | No | **100** | `@IsInt()`, `@Min(1)`, `@Max(250)` | Items **scanned** per page — see the warning below. |

**[C]** An **unknown** `since` (a version number that does not exist) is **not** an error — it degrades to a full download (`prisma-catalog-publishing.repository.ts:477-490`).

⚠️ **[C] `limit` bounds the number of items *scanned*, not the number *returned*.** The page is read from `CatalogVersionItem` first, then filtered by checksum. On a delta sync where nothing changed in that slice, `changed` is `[]` while `complete` is still `false`. **An empty `changed` array does not mean the sync is finished. Only `complete: true` does.**

#### Success response `200`

```json
{
  "success": true,
  "message": "Catalog sync retrieved successfully",
  "data": {
    "fromVersion": 3,
    "toVersion": 4,
    "changed": [
      {
        "productId": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
        "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        "payload": {
          "id": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
          "slug": "track-light-30w-black",
          "sku": "NP-TL-30B",
          "itemNumber": "TL3001",
          "name": { "en": "Track Light 30W Black", "ar": "سبوت تراك 30 واط أسود" },
          "description": { "en": "COB track spotlight.", "ar": "سبوت تراك COB." },
          "highlights": [ { "en": "High CRI", "ar": "معامل تجسيد ألوان عالٍ" } ],
          "category": {
            "id": "5d41402a-bc4b-4a76-b971-9d911017c592",
            "slug": "track-light",
            "name": { "en": "Track Light", "ar": "إضاءة تراك" },
            "path": "/lighting/interior-lighting/track-light"
          },
          "reportingCategory": "LIGHTING",
          "status": "ACTIVE",
          "isAvailable": true,
          "media": [
            { "type": "IMAGE", "url": "https://cdn.example.com/p/tl30b.jpg", "thumbnailUrl": "https://cdn.example.com/p/tl30b_thumb.jpg", "alt": { "en": "Track Light 30W", "ar": "سبوت تراك 30 واط" }, "sortOrder": 0 },
            { "type": "DATASHEET", "url": "https://cdn.example.com/d/tl30b.pdf", "thumbnailUrl": null, "alt": null, "sortOrder": 1 }
          ],
          "specSheet": [
            { "code": "POWER",     "label": { "en": "Power", "ar": "القدرة" },        "value": { "en": "30 W", "ar": "30 W" } },
            { "code": "VOLTAGE",   "label": { "en": "Voltage", "ar": "الجهد" },       "value": { "en": "220–240 V", "ar": "220–240 V" } },
            { "code": "FREQUENCY", "label": { "en": "Frequency", "ar": "التردد" },    "value": { "en": "50 / 60 Hz", "ar": "50 / 60 Hz" } },
            { "code": "CRI",       "label": { "en": "CRI", "ar": "معامل التجسيد" },   "value": { "en": "≥ 90", "ar": "≥ 90" } },
            { "code": null,        "label": { "en": "Warranty", "ar": "الضمان" },     "value": { "en": "2 years", "ar": "سنتان" } }
          ],
          "highlightFacets": [
            { "code": "POWER", "label": { "en": "Power", "ar": "القدرة" }, "unit": "W", "display": { "en": "30 W", "ar": "30 W" } }
          ]
        }
      }
    ],
    "removed": [],
    "nextCursor": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
    "complete": false
  },
  "meta": { "timestamp": "…", "path": "/api/v1/catalog/sync", "correlationId": "…" }
}
```

#### Response fields — `SyncPage`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `fromVersion` | Number | **Yes** | Echo of `since`. `null` on a full download. |
| `toVersion` | Number | No | The version being synced **to**. **`0` means nothing is published** (see below). |
| `changed` | `ResolvedItem[]` | No (may be `[]`) | Items to insert/replace. |
| `changed[].productId` | String (uuid) | No | Primary key for the local table. |
| `changed[].checksum` | String (sha256 hex) | No | Per-item checksum. **Store it** — it is comparable with `ProductListItem.checksum` from the online list (§10 BR-12). |
| `changed[].payload` | `CatalogItemPayload` | No | The fully-resolved product. See §8.9. |
| `removed` | String[] (uuids) | No (may be `[]`) | Product ids to delete locally. **Populated on the final page only.** |
| `nextCursor` | String \| null | **Yes** | Pass as `?cursor=`. `null` on the last page. |
| `complete` | Boolean | No | **`true` = stop.** The only valid termination condition. |

**[C]** `nextCursor` is the last `productId` of the scanned page — cursoring is `productId > cursor` ordered ascending. It is stable and unaffected by concurrent publishes because a version's items never change once written. **Treat it as opaque regardless.**

**[C] Nothing published:** returns `200` with `{ fromVersion: <since ?? null>, toVersion: 0, changed: [], removed: [], nextCursor: null, complete: true }`. **Guard against `toVersion === 0`** — writing it to local state would make the next `?since=0` fail `@Min(1)` with a 400.

**[C] `removed` semantics:** computed only when `!hasMore` **and** `heldByProduct.size > 0` — i.e. on the last page **of a delta sync against a known version**. On a full download `removed` is always `[]`. Removals are ids present in the held version but absent from the current one; there is no cursor position they belong to, which is why they arrive at the end.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `since < 1`, `limit > 250`, non-integer, unknown param, `cursor` > 100 chars | Fix the request. If `since` is corrupt locally, **drop it and full-sync**. |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | **Critical here** — see §14.6 |
| 500 | `INTERNAL_SERVER_ERROR` | Server fault | Retry **the same cursor**; pages are idempotent |

**[C]** **No 503.**

#### Mobile behaviour

Full algorithm in §14. In short: loop on `nextCursor` until `complete: true`, upsert `changed`, apply `removed` **after** the last page, then commit `toVersion` + `manifestChecksum` in one transaction.

#### Dependencies

`since` ← `versionNumber` from §7.2. `cursor` ← this endpoint's own `nextCursor`.

---

### 7.4 `GET /categories` — the taxonomy

#### Purpose

**[C]** The browse structure: 43 categories, flat by default or nested with `?tree=true`.

#### HTTP

```text
GET /api/v1/categories
GET /api/v1/categories?tree=true
GET /api/v1/categories?parentId=5d41402a-bc4b-4a76-b971-9d911017c592
```

#### Authentication

Bearer + `X-Device-Id`. `REPRESENTATIVE`+.

#### Query parameters — `ListCategoriesQueryDto`

| Name | Type | Required | Default | Allowed | Meaning |
| --- | --- | --- | --- | --- | --- |
| `tree` | Boolean | No | `false` | `true`/`false`/`1`/`0` | Nest children under parents via `children[]`. |
| `parentId` | String | No | — | any string | **Flat mode only.** Restrict to one parent's *direct* children. |

⚠️ **[C] `parentId` is an id only** — it is passed straight through to a `parentId === x` comparison with **no slug resolution** (`prisma-catalog.repository.ts:267-269`). A slug here silently returns `[]`, **not** a 404. Resolve the slug via `/categories/{idOrSlug}` first, or use `/categories/{idOrSlug}` which returns `children` directly.

**[C]** `parentId` and `tree=true` together: `parentId` is used as the tree **root** (`buildTree(views, parentId)`), not as a flat filter.

**[C]** `includeInactive` is hard-coded to `false` by the controller — inactive categories are never visible to mobile, and there is no parameter to change that.

#### Success response `200` (flat)

```json
{
  "success": true,
  "message": "Categories retrieved successfully",
  "data": [
    {
      "id": "5d41402a-bc4b-4a76-b971-9d911017c592",
      "slug": "track-light",
      "name": { "en": "Track Light", "ar": "إضاءة تراك" },
      "path": "/lighting/interior-lighting/track-light",
      "parentId": "aab3238922bc-4d1e-9a55-1f2e3d4c5b6a",
      "description": { "en": "Adjustable rail spotlights.", "ar": "سبوتات على قضيب قابلة للتوجيه." },
      "imageUrl": "https://cdn.example.com/c/track-light.jpg",
      "depth": 2,
      "sortOrder": 3,
      "productCount": 110,
      "subtreeProductCount": 110
    }
  ],
  "meta": { "timestamp": "…", "path": "/api/v1/categories", "correlationId": "…" }
}
```

**[C]** With `tree=true` each node additionally carries `children: CategoryView[]` (recursive). In flat mode `children` is **absent**, not `null` (`children?:` is optional).

#### Response fields — `CategoryView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `id` | String (uuid) | No | |
| `slug` | String | No | **Accepted anywhere `idOrSlug` or `?category=` appears.** Prefer it in deep links. |
| `name` | `Localized` | No | |
| `path` | String | No | Materialised path, `/`-separated, leading slash: `/lighting/interior-lighting/track-light`. Segments are ancestor slugs. **A client can render a breadcrumb from this without another call.** |
| `parentId` | String \| null | **Yes** | `null` for roots. |
| `description` | `Localized` \| null | **Yes** | Whole object null when no description. |
| `imageUrl` | String \| null | **Yes** | |
| `depth` | Number | No | 0 = root. |
| `sortOrder` | Number | No | Display order within a parent. |
| `productCount` | Number | No | Products filed **directly** here. |
| `subtreeProductCount` | Number | No | Products anywhere in this subtree, **including itself**. |
| `children` | `CategoryView[]` | Absent unless `tree=true` | |

**[C]** Ordering (flat): `depth ASC`, `sortOrder ASC`, `nameEn ASC`.

⚠️ **[C] Both counts count ACTIVE, non-deleted products — but NOT published-version membership** (`categoryProductCounts`, `:191-203`). `GET /products?category=X` **does** require published membership. **The counts can therefore exceed the number of products the list actually returns.** Treat them as approximate navigation hints, never as a total to display beside a result set. See §10 BR-8.

**[C]** Both counts are needed: 15 products sit directly on root categories, so a UI showing only `subtreeProductCount` leaves those unexplained, and one showing only `productCount` renders most branches as empty.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Non-boolean `tree`, unknown query param | Fix request |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |

**[C]** **No 503** and **no 404** — an unknown `parentId` returns `[]`.

#### Mobile behaviour

**[I]** Fetch `?tree=true` once per session and cache in memory; the payload is small (43 rows) and the tree is needed for navigation. Persist it as part of the offline bundle.

---

### 7.5 `GET /categories/filters` — the filter rail

#### Purpose

**[C]** Returns the filter schema **for the current result set**, with facet counts computed **under the filters already applied** — so the client can grey out options that would return nothing.

#### HTTP

```text
GET /api/v1/categories/filters?category=track-light
GET /api/v1/categories/filters?category=track-light&attr[BODY_COLOUR]=BLACK&q=cob
```

⚠️ **[C] Route order matters and is deliberate:** `filters` is declared **before** `:idOrSlug`. Do not "normalise" this to `/categories/{id}/filters` — that route does not exist and would parse as a category slug.

**[C]** The category is a **query parameter**, not a path segment.

#### Authentication

Bearer + `X-Device-Id`. `REPRESENTATIVE`+.

#### Query parameters — `CategoryFiltersQueryDto`

| Name | Type | Required | Default | Validation | Meaning |
| --- | --- | --- | --- | --- | --- |
| `category` | String | No | — | `@MaxLength(200)` | Category **id or slug**. Omit for a catalogue-wide rail. |
| `includeSubtree` | Boolean | No | **`true`** | boolean | Include descendant categories. |
| `attr` | Map<String,String> | No | — | `@IsObject()` | Filters already applied. **Counts are computed under these**, so the rail reflects the current result set. |
| `q` | String | No | — | `@MaxLength(120)` | Search term. Counts reflect it. Terms < 2 normalised chars are ignored. |

**[C]** **Send the exact same `category` / `includeSubtree` / `attr` / `q` you send to `/products`.** The rail is only meaningful when its result set matches the list's.

#### Success response `200`

```json
{
  "success": true,
  "message": "Filters retrieved successfully",
  "data": {
    "categoryId": "5d41402a-bc4b-4a76-b971-9d911017c592",
    "filters": [
      {
        "code": "BODY_COLOUR",
        "label": { "en": "Body Colour", "ar": "لون الجسم" },
        "type": "ENUM",
        "strategy": "DISCRETE",
        "unit": null,
        "options": [
          { "code": "BLACK", "label": { "en": "Black", "ar": "أسود" }, "count": 63 },
          { "code": "WHITE", "label": { "en": "White", "ar": "أبيض" }, "count": 47 }
        ],
        "count": 110
      },
      {
        "code": "POWER",
        "label": { "en": "Power", "ar": "القدرة" },
        "type": "NUMBER",
        "strategy": "RANGE",
        "unit": "W",
        "range": { "min": 7, "max": 50 },
        "count": 104
      },
      {
        "code": "IP_RATING",
        "label": { "en": "IP Rating", "ar": "درجة الحماية" },
        "type": "NUMBER",
        "strategy": "DISCRETE",
        "unit": null,
        "options": [
          { "code": "20~20", "label": { "en": "20", "ar": "20" }, "count": 86 },
          { "code": "44~44", "label": { "en": "44", "ar": "44" }, "count": 18 }
        ],
        "count": 104
      },
      {
        "code": "DIMENSIONS",
        "label": { "en": "Dimensions", "ar": "الأبعاد" },
        "type": "TEXT",
        "strategy": "DISCRETE",
        "unit": null,
        "options": [
          { "code": "70*70", "label": { "en": "70*70", "ar": "70*70" }, "count": 21 }
        ],
        "truncated": true,
        "count": 57
      }
    ]
  },
  "meta": { "timestamp": "…", "path": "/api/v1/categories/filters", "correlationId": "…" }
}
```

#### Response fields — `CategoryFiltersView` / `FilterView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `categoryId` | String \| null | **Yes** | Echo of the resolved category. `null` when `category` was omitted. |
| `filters` | `FilterView[]` | No (may be `[]`) | The rail, ordered by `CategoryAttribute.sortOrder`. |
| `filters[].code` | String | No | **Send back as `attr[CODE]`.** |
| `filters[].label` | `Localized` | No | Rail heading. |
| `filters[].type` | `AttributeType` | No | How the value is **stored**. Drives **formatting**, not the control. |
| `filters[].strategy` | `FilterStrategy` | No | **HOW TO RENDER IT.** `DISCRETE` → checkbox list from `options`. `RANGE` → slider across `range`. `NONE` never reaches the client. |
| `filters[].unit` | String \| null | **Yes** | Canonical unit, e.g. `"W"`. |
| `filters[].options` | `FilterOptionView[]` | **Absent** unless `DISCRETE` | Present for every storage type including TEXT and NUMBER. |
| `filters[].options[].code` | String | No | **Send this back verbatim.** Already escaped. Round-trips through the parser unchanged. |
| `filters[].options[].label` | `Localized` | No | Display text. For NUMBER this is the *rendered* value (`"≥ 90"`, `"220–240 V"`). |
| `filters[].options[].count` | Number | No | **Distinct products**, not value rows. |
| `filters[].truncated` | Boolean | **Absent** unless `true` | More distinct values exist than were returned (cap: **24**). Show a search box, not a complete list. |
| `filters[].range` | `{min, max}` | **Absent** unless `RANGE` | Observed span **within the current result set**. |
| `filters[].count` | Number | No | Products in the current result set that carry this attribute **at all**. **Not** the sum of option counts. |

⚠️ **[C] Switch on `strategy`, never on `type`.** The source is explicit: a client that switches on `type` "will put a slider on IP_RATING, which is the bug this field exists to end." `IP_RATING` is stored as `NUMBER` but rendered `DISCRETE`.

⚠️ **[C] `filters[].count` ≠ sum of `options[].count`.** A two-tone fitting carries two colours and is one product; summing double-counts it.

**[C] Expect a thin rail, often.** Which attributes appear is data (`CategoryAttribute.filterStrategy` gated by `Attribute.isFilterable`), never hard-coded. Density varies wildly — Track Light: 110 products behind **3** filters; Down Light: 64 behind **14**. **A layout that assumes a full rail will look broken on the biggest category in the catalogue.**

**[C] Attributes with no values in the current result set are omitted entirely**, not returned with `count: 0`. A `RANGE` filter is also dropped when `min === max` (a slider whose ends meet is a dead control).

**[C] Empty rail cases** — `filters: []` is returned when: no bindings exist, **or** the result set is empty, **or** `where` resolves to nothing.

**[C] Subtree strategy conflicts:** when an attribute is bound on several categories in the subtree with different strategies, **`RANGE` wins** (a subtree holds at least as many values as any category in it).

**[C] Option ordering:** ENUM follows vocabulary `sortOrder`; NUMBER ascends by value; **TEXT is ordered by count descending** (so the truncated tail is the long thin one), tie-broken by `code.localeCompare(_, 'ar')`.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | Unknown param, bad boolean, `category` > 200 chars | Fix request |
| 400 | `CATALOG_UNKNOWN_FILTER_ATTRIBUTE` | `attr[X]` unknown/not filterable | **Drop that filter and retry.** See §19.3 |
| 400 | `CATALOG_INVALID_FILTER_VALUE` | Malformed numeric value | Drop that filter and retry |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 404 | `CATALOG_CATEGORY_NOT_FOUND` | `?category=` unresolvable | Clear the category selection; refresh the tree |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |
| **503** | `CATALOG_NO_PUBLISHED_VERSION` | Nothing published | §6.2 |

#### Mobile behaviour

**[I]** Fire in **parallel** with `/products` on category open and after every filter change — but see the rate-limit warning (§2.3): that is 2 requests per interaction. Debounce filter changes by ≥ 300 ms and cancel in-flight requests.

#### Dependencies

`category` ← `/categories`. Its `options[].code` → `attr[CODE]` on `/products`.

---

### 7.6 `GET /categories/{idOrSlug}` — one category

#### Purpose

**[C]** The category, its **ancestors** (root first) and its **direct children**. The breadcrumb is derived from the materialised `path` — one indexed lookup, not a recursive walk.

#### HTTP

```text
GET /api/v1/categories/track-light
GET /api/v1/categories/5d41402a-bc4b-4a76-b971-9d911017c592
```

#### Path parameters

| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `idOrSlug` | String | Yes | Category **uuid or slug**. Resolved as `id = X OR slug = X` among non-deleted categories. |

#### Query parameters

**[C]** None. **[I]** No DTO is bound to a query here either, so extras are ignored.

#### Success response `200`

```json
{
  "success": true,
  "message": "Category retrieved successfully",
  "data": {
    "category": { "id": "5d41402a-…", "slug": "track-light", "name": { "en": "Track Light", "ar": "إضاءة تراك" }, "path": "/lighting/interior-lighting/track-light", "parentId": "aab32389-…", "description": null, "imageUrl": null, "depth": 2, "sortOrder": 3, "productCount": 110, "subtreeProductCount": 110 },
    "breadcrumb": [
      { "id": "c4ca4238-…", "slug": "lighting", "name": { "en": "Lighting", "ar": "الإنارة" }, "path": "/lighting", "parentId": null, "description": null, "imageUrl": null, "depth": 0, "sortOrder": 0, "productCount": 4, "subtreeProductCount": 612 },
      { "id": "aab32389-…", "slug": "interior-lighting", "name": { "en": "Interior Lighting", "ar": "إنارة داخلية" }, "path": "/lighting/interior-lighting", "parentId": "c4ca4238-…", "description": null, "imageUrl": null, "depth": 1, "sortOrder": 1, "productCount": 0, "subtreeProductCount": 479 }
    ],
    "children": []
  },
  "meta": { "timestamp": "…", "path": "/api/v1/categories/track-light", "correlationId": "…" }
}
```

#### Response fields — `GetCategoryResultView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `category` | `CategoryView` | No | The requested category. `children` absent. |
| `breadcrumb` | `CategoryView[]` | No (may be `[]`) | **Ancestors only, root first.** The category itself is filtered out (`get-category.handler.ts:39-40`) — **append `category.name` yourself** to render the full trail. `[]` for a root category. |
| `children` | `CategoryView[]` | No (may be `[]`) | **Direct** children only (not recursive), active and non-deleted. |

**[C]** `breadcrumb` entries are full `CategoryView` objects (with counts), **not** the lighter `CategoryRefView` used in product responses.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 404 | `CATALOG_CATEGORY_NOT_FOUND` | Unknown id/slug | Show not-found; pop to the tree |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |

**[C]** **No 503** — not version-gated.

#### Mobile behaviour

**[I]** Use this to resolve a deep link (`/categories/track-light`) into an id + breadcrumb + children in one call, instead of `/categories?parentId=` (which cannot take a slug).

---

### 7.7 `GET /products` — list, filter, search

#### Purpose

**[C]** The catalogue workhorse: browse, filter, search, sort, paginate.

#### HTTP

```text
GET /api/v1/products?page=1&limit=20&category=track-light&includeSubtree=true
GET /api/v1/products?q=track%20light&sort=relevance
GET /api/v1/products?category=down-light&attr[POWER]=10..20&attr[BODY_COLOUR]=BLACK,WHITE
```

#### Authentication

Bearer + `X-Device-Id`. `REPRESENTATIVE`+.

#### Query parameters — `ListProductsQueryDto`

| Name | Type | Required | Default | Validation / Allowed | Meaning |
| --- | --- | --- | --- | --- | --- |
| `page` | Integer | No | `1` | `@IsInt()`, `@Min(1)` | 1-based page. |
| `limit` | Integer | No | `20` | `@IsInt()`, `@Min(1)`, **`@Max(100)`** | Items per page. `101` → 400. |
| `q` | String | No | — | `@MaxLength(120)` | Search term (§11). < 2 normalised chars → **ignored**, not an error. |
| `category` | String | No | — | `@MaxLength(200)` | Category **id or slug**. |
| `includeSubtree` | Boolean | No | **`true`** | boolean | Include descendant categories. |
| `attr` | Map<String,String> | No | — | `@IsObject()` | Attribute filters (§12). |
| `reportingCategory` | String (enum) | No | — | `@IsEnum(ProductCategory)` | `SOCKETS_SWITCHES` \| `LIGHTING` \| `EXHAUST_FANS` \| `CABLES` \| `DISTRIBUTION_BOARDS` \| `CIRCUIT_BREAKERS` \| `CONDUIT_TRUNKING` \| `ACCESSORIES` \| `OTHER`. A **reporting dimension** (subsystem 14), orthogonal to the category tree. |
| `hasDatasheet` | Boolean | No | — | boolean | `true` → only products with a `DATASHEET` medium. **[C]** `false` is accepted but has **no effect** (`if (filters.hasDatasheet)` — falsy is skipped). |
| `available` | Boolean | No | — | boolean | **Opt-in only.** `true` → only available; `false` → only unavailable. Omitted → **no availability filter** (CP7: availability is advisory; the ERP owns real stock). |
| `sort` | String (enum) | No | see below | `relevance` \| `name` \| `newest` \| `category` | Sort order. |

**[C] `sort` default:** `relevance` when `q` is present (and ≥ 2 normalised chars), `name` otherwise. **[C]** `sort=relevance` **without** a usable `q` is silently downgraded to `name` — relevance without a term would be an arbitrary order presented as a ranking.

**[C] Sort semantics:**

| `sort` | Ordering |
| --- | --- |
| `name` | `nameEn ASC NULLS LAST`, then `nameAr ASC`. **Keys on the English name** — English is primary. The 6 products without an English name sort **last**. |
| `newest` | `createdAt DESC`. |
| `category` | `category.sortOrder ASC`, then `nameEn ASC`. |
| `relevance` | In-memory rank (§11.3), stable, original order as tiebreak. |

#### Success response `200`

⚠️ **Note the nested envelope — see §5.2.**

```json
{
  "success": true,
  "message": "Success",
  "data": {
    "message": "Products retrieved successfully",
    "items": [
      {
        "id": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
        "slug": "track-light-30w-black",
        "sku": "NP-TL-30B",
        "itemNumber": "TL3001",
        "name": { "en": "Track Light 30W Black", "ar": "سبوت تراك 30 واط أسود" },
        "category": {
          "id": "5d41402a-bc4b-4a76-b971-9d911017c592",
          "slug": "track-light",
          "name": { "en": "Track Light", "ar": "إضاءة تراك" },
          "path": "/lighting/interior-lighting/track-light"
        },
        "primaryImage": {
          "url": "https://cdn.example.com/p/tl30b.jpg",
          "thumbnailUrl": "https://cdn.example.com/p/tl30b_thumb.jpg"
        },
        "highlights": [
          { "code": "POWER", "label": { "en": "Power", "ar": "القدرة" }, "unit": "W", "display": { "en": "30 W", "ar": "30 W" } },
          { "code": "BODY_COLOUR", "label": { "en": "Body Colour", "ar": "لون الجسم" }, "unit": null, "display": { "en": "Black", "ar": "أسود" } }
        ],
        "isAvailable": true,
        "status": "ACTIVE",
        "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    ],
    "total": 110,
    "page": 1,
    "limit": 20,
    "totalPages": 6
  },
  "meta": { "timestamp": "…", "path": "/api/v1/products", "correlationId": "…" }
}
```

#### Response fields — `ProductListItemView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `id` | String (uuid) | No | |
| `slug` | String | No | Usable as `idOrSlug` on the detail route. |
| `sku` | String \| null | **Yes** | Manufacturer SKU. Searchable; exact match ranks first. |
| `itemNumber` | String \| null | **Yes** | Internal item number. Searchable. |
| `name` | `Localized` | No | |
| `category` | `CategoryRefView` \| null | **Yes** | `null` when the product is unfiled (`Product.categoryId` is nullable). **Handle it.** |
| `primaryImage` | `{url, thumbnailUrl}` \| null | **Yes** | The **first `IMAGE`** medium by `sortOrder ASC, id ASC`. `null` when the product has no image. `thumbnailUrl` is itself nullable. |
| `highlights` | `HighlightView[]` | No (may be `[]`) | The `isHighlight` facets **for this product's category binding** — so a card renders without a second call. Empty when the product is unfiled or its category binds no highlights. |
| `highlights[].code` | String | No | Attribute code. |
| `highlights[].label` | `Localized` | No | |
| `highlights[].unit` | String \| null | **Yes** | |
| `highlights[].display` | `Localized` | No | **Pre-rendered** value (`"30 W"`, `"50 / 60 Hz"`, `"≥ 90"`). Display as-is. |
| `isAvailable` | Boolean | No | **Advisory only** (CP7). Never hide a product because of it. |
| `status` | `ProductStatus` | No | Always `ACTIVE` on this endpoint (the list filters on it). |
| `checksum` | String \| null | **Yes** | Per-item checksum from the current published version. `null` if the product has no published item row. **Comparable with `SyncPage.changed[].checksum`** — this is how a client detects a stale cached copy. |

**Pagination fields** (inside `data`, §13.1): `total`, `page`, `limit`, `totalPages` — all non-null numbers. `totalPages = ceil(total / limit)`.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `limit` > 100, `page` < 1, bad `sort`/`reportingCategory` enum, non-boolean flag, unknown param | Fix request; do not retry unchanged |
| 400 | `CATALOG_UNKNOWN_FILTER_ATTRIBUTE` | `attr[X]` unknown/not filterable | **Drop that filter, retry once** (§19.3) |
| 400 | `CATALOG_INVALID_FILTER_VALUE` | `attr[POWER]=abc`, `20..10`, `240~220`, `..` | Drop that filter, retry once |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 403 | `HTTP_EXCEPTION` | Scope lockdown | Branch on message (§3.4) |
| 404 | `CATALOG_CATEGORY_NOT_FOUND` | `?category=` unresolvable | Clear category, refresh tree |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |
| **503** | `CATALOG_NO_PUBLISHED_VERSION` | Nothing published | §6.2 — fall back to offline copy if present |
| 500 | `INTERNAL_SERVER_ERROR` | Server fault | Backoff + retry |

**[C]** **An empty result is `200` with `items: [], total: 0, totalPages: 0`** — never a 404.

#### Mobile behaviour

**[I]** Page 1 on category open; append on scroll. Reset to `page=1` on **any** change to `q`, `category`, `attr`, `sort`, or the boolean flags. Fire `/categories/filters` with identical parameters alongside it.

#### Dependencies

`category` ← §7.4/§7.6. `attr[CODE]` ← §7.5 `filters[].code` + `options[].code`. Feeds §7.9 via `slug`/`id`.

---

### 7.8 `GET /products/suggest` — typeahead

#### Purpose

**[C]** Fast, capped product suggestions for a search box.

#### HTTP

```text
GET /api/v1/products/suggest?q=trac&limit=10
```

⚠️ **[C]** `suggest` is declared **before** `:idOrSlug`. Do not reorder.

#### Query parameters — `SuggestQueryDto`

| Name | Type | Required | Default | Validation | Meaning |
| --- | --- | --- | --- | --- | --- |
| `q` | String | No | `''` | `@MinLength(0)`, `@MaxLength(120)` | Search term. |
| `limit` | Integer | No | `10` | `@IsInt()`, `@Min(1)`, `@Max(25)` | Max suggestions. |

**[C]** A term shorter than **2 normalised characters** returns an **empty list, not an error** — a typeahead fires on every keystroke, and 400-ing the first character would fill both the client console and the server logs with noise.

#### Success response `200`

```json
{
  "success": true,
  "message": "Suggestions retrieved successfully",
  "data": [
    {
      "kind": "PRODUCT",
      "id": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
      "slug": "track-light-30w-black",
      "name": { "en": "Track Light 30W Black", "ar": "سبوت تراك 30 واط أسود" },
      "sku": "NP-TL-30B"
    }
  ],
  "meta": { "timestamp": "…", "path": "/api/v1/products/suggest", "correlationId": "…" }
}
```

#### Response fields — `SuggestionView`

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `kind` | `'PRODUCT'` \| `'CATEGORY'` | No | ⚠️ **[C] The implementation only ever emits `'PRODUCT'`** (`prisma-catalog.repository.ts:1045`). The `'CATEGORY'` variant exists in the type but no code path produces it. **Model it as an enum with both values and a safe default, but do not build a category-suggestion UI** — it will never render. See §21-Q4. |
| `id` | String (uuid) | No | |
| `slug` | String | No | Navigate to `/products/{slug}`. |
| `name` | `Localized` | No | |
| `sku` | String \| null | **Yes** | |

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 400 | `VALIDATION_ERROR` | `limit` > 25, `q` > 120 chars, unknown param | Clamp client-side; never surface |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | **Very likely here.** Debounce ≥ 300 ms and require ≥ 2 chars client-side. |

**[C]** **No 503, no 404** — nothing published returns `[]`.

#### Mobile behaviour

**[I]** Gate client-side on ≥ 2 characters **before** sending, debounce ≥ 300 ms, cancel in-flight requests. Suggestions are not a substitute for `/products?q=` — selecting one should navigate straight to the product detail by `slug`.

---

### 7.9 `GET /products/{idOrSlug}` — product detail

#### Purpose

**[C]** Full detail: names, description, highlight points, all media, category breadcrumb, and the **composed spec sheet**.

#### HTTP

```text
GET /api/v1/products/track-light-30w-black
GET /api/v1/products/0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54
```

#### Path parameters

| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `idOrSlug` | String | Yes | Product **uuid or slug**. Resolved as `id = X OR slug = X` among non-deleted products **in the current published version**. |

#### Query parameters

None.

#### Success response `200`

```json
{
  "success": true,
  "message": "Product retrieved successfully",
  "data": {
    "id": "0c9a1f2e-5b3d-4a7c-8e1f-2d6b9c0a3e54",
    "slug": "track-light-30w-black",
    "sku": "NP-TL-30B",
    "itemNumber": "TL3001",
    "name": { "en": "Track Light 30W Black", "ar": "سبوت تراك 30 واط أسود" },
    "description": { "en": "COB track spotlight with adjustable head.", "ar": "سبوت تراك COB برأس قابل للتوجيه." },
    "highlightPoints": [
      { "en": "High colour rendering", "ar": "تجسيد ألوان عالٍ" },
      { "en": "Adjustable beam", "ar": "شعاع قابل للتوجيه" }
    ],
    "category": { "id": "5d41402a-…", "slug": "track-light", "name": { "en": "Track Light", "ar": "إضاءة تراك" }, "path": "/lighting/interior-lighting/track-light" },
    "breadcrumb": [
      { "id": "c4ca4238-…", "slug": "lighting", "name": { "en": "Lighting", "ar": "الإنارة" }, "path": "/lighting" },
      { "id": "aab32389-…", "slug": "interior-lighting", "name": { "en": "Interior Lighting", "ar": "إنارة داخلية" }, "path": "/lighting/interior-lighting" },
      { "id": "5d41402a-…", "slug": "track-light", "name": { "en": "Track Light", "ar": "إضاءة تراك" }, "path": "/lighting/interior-lighting/track-light" }
    ],
    "primaryImage": { "url": "https://cdn.example.com/p/tl30b.jpg", "thumbnailUrl": "https://cdn.example.com/p/tl30b_thumb.jpg" },
    "media": [
      { "id": "1679091c-5a88-4faf-b1c2-9f8e7d6c5b4a", "type": "IMAGE", "url": "https://cdn.example.com/p/tl30b.jpg", "thumbnailUrl": "https://cdn.example.com/p/tl30b_thumb.jpg", "alt": { "en": "Track Light 30W", "ar": "سبوت تراك 30 واط" }, "sortOrder": 0 },
      { "id": "8f14e45f-ceea-467a-9c1e-2b7f0a1c9d33", "type": "DATASHEET", "url": "https://cdn.example.com/d/tl30b.pdf", "thumbnailUrl": null, "alt": null, "sortOrder": 1 }
    ],
    "highlights": [
      { "code": "POWER", "label": { "en": "Power", "ar": "القدرة" }, "unit": "W", "display": { "en": "30 W", "ar": "30 W" } }
    ],
    "specSheet": [
      { "code": "POWER",     "label": { "en": "Power", "ar": "القدرة" },     "value": { "en": "30 W", "ar": "30 W" } },
      { "code": "VOLTAGE",   "label": { "en": "Voltage", "ar": "الجهد" },    "value": { "en": "220–240 V", "ar": "220–240 V" } },
      { "code": "FREQUENCY", "label": { "en": "Frequency", "ar": "التردد" }, "value": { "en": "50 / 60 Hz", "ar": "50 / 60 Hz" } },
      { "code": null,        "label": { "en": "Warranty", "ar": "الضمان" },  "value": { "en": "2 years", "ar": "سنتان" } }
    ],
    "hasDatasheet": true,
    "isAvailable": true,
    "status": "ACTIVE",
    "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  "meta": { "timestamp": "…", "path": "/api/v1/products/track-light-30w-black", "correlationId": "…" }
}
```

#### Response fields — `ProductDetailView`

Extends `ProductListItemView` (all fields from §7.7 apply) and adds:

| Field | Type | Nullable | Meaning |
| --- | --- | --- | --- |
| `description` | `Localized` \| null | **Yes** | Whole object null when absent. |
| `highlightPoints` | `Localized[]` | No (may be `[]`) | Marketing bullets. **Distinct from `highlights`** — those are typed facets, these are free text. |
| `media` | `MediaView[]` | No (may be `[]`) | **All** media, ordered `sortOrder ASC, id ASC`. Contains both `IMAGE` and `DATASHEET`. |
| `media[].id` | String (uuid) | No | |
| `media[].type` | `MediaType` | No | `IMAGE` \| `DATASHEET`. **Filter client-side** — the gallery must exclude `DATASHEET`. |
| `media[].url` | String | No | **Stable public URL**, not signed (a signed URL would expire before a rep opens the app offline). |
| `media[].thumbnailUrl` | String \| null | **Yes** | |
| `media[].alt` | `Localized` \| null | **Yes** | |
| `media[].sortOrder` | Number | No | |
| `breadcrumb` | `CategoryRefView[]` | No (may be `[]`) | ⚠️ **[C] Includes the product's own category as the last element** — unlike `/categories/{idOrSlug}`, which strips it. `[]` when the product is unfiled. |
| `specSheet` | `SpecSheetRow[]` | No (may be `[]`) | The composed sheet (§8.8). |
| `hasDatasheet` | Boolean | No | True when any medium is `DATASHEET`. |

⚠️ **[C] Two different breadcrumb conventions in one API:**

| Endpoint | Includes self? | Element type |
| --- | --- | --- |
| `GET /categories/{idOrSlug}` → `breadcrumb` | **No** | `CategoryView` (with counts) |
| `GET /products/{idOrSlug}` → `breadcrumb` | **Yes** | `CategoryRefView` (no counts) |

Do not share one breadcrumb widget across both without normalising.

**[C] The spec sheet is composed, not stored.** Built from the typed facet layer + extra specs, ordered by `displayOrder`, with multi-valued facets collapsed into one row (`50 / 60 Hz`), qualifiers rendered (`≥ 0.9`), and display units rescaled (a 50 m reel reads `50 m`, not `50000 mm`). The verbatim source columns (`specSheetAr`, `specSheetEn`, `rawValue`, `rawValueEn`) are retained in the database but **no read model exposes them** — do not expect them.

#### Errors

| HTTP | Code | Condition | Mobile action |
| --- | --- | --- | --- |
| 401 | *(auth codes)* | §6.1 | §19.1 |
| 404 | `CATALOG_PRODUCT_NOT_FOUND` | Unknown id/slug **or** not in the current published version | Show not-found. **Do not retry.** Purge the local row if it came from a stale cache. |
| 429 | `RATE_LIMIT_EXCEEDED` | > 30/60s | §19.4 |
| **503** | `CATALOG_NO_PUBLISHED_VERSION` | Nothing published | §6.2 |

⚠️ **[C] A DISCONTINUED product returns `200`, not `404`** (CP5) — as long as it is still in the current published version. It is referenced by historical activities and outcomes; blanking those pages would erase things that genuinely happened. **Only the list and search surfaces hide it.** **Check `status` and render a "discontinued" banner** — this is the one endpoint where `status` can be `DISCONTINUED`.

⚠️ **[C] "Not published" and "not there" are deliberately indistinguishable** — both return `CATALOG_PRODUCT_NOT_FOUND`, never a 403. You cannot tell them apart, and you are not meant to.

#### Dependencies

`idOrSlug` ← `/products` (`slug`/`id`) or `/products/suggest` (`slug`).

---

## 8. Data Models

### 8.1 `Localized` — the bilingual primitive

```text
Model: Localized
- en: String?   // NULLABLE
- ar: String    // NEVER null
```

**[C]** English is primary and written first. `ar` is never null (`nameAr` is `NOT NULL` in the schema and all 1005 products have one). `en` **is** nullable and must stay nullable: the seed backfills English from Arabic where the source had none, but an admin can clear an English field at any time.

**[C]** An **empty string is normalised to `null`** by `localized()` — so clients have exactly one absence to check for. You will never receive `{"en": "", "ar": "…"}`.

**[C] There is no locale parameter anywhere in this module.** Every response carries both languages, always. The client picks.

**[C]** Language-neutral values (numbers, units, ranges) still travel as a `Localized` with `en === ar` (`sameInBothLanguages`), so the client renders one shape unconditionally.

**Dart contract:**

```text
String display(Localized v, Locale locale) =>
  locale.isArabic ? v.ar : (v.en ?? v.ar);   // fall back to ar; never to ''
```

⚠️ **[I]** For an Arabic UI, `ar` is always safe. For an English UI you **must** fall back to `ar` — 6 products and an unknown number of attribute/option labels can have `en == null`.

### 8.2 `Pagination` (product list only)

```text
Model: ProductPage
- items: List<ProductListItem>
- total: int
- page: int
- limit: int
- totalPages: int
```

Lives **inside `data`**, alongside a `message` string. See §5.2.

### 8.3 `ApiError`

```text
Model: ApiError
- success: bool          // always false
- message: String
- error: { code: String, statusCode: int }
- meta: { timestamp: String, path: String, correlationId: String? }
```

### 8.4 `Media`

```text
Model: Media                    // MediaView
- id: String                    // absent in the offline payload — see §8.9
- type: MediaType               // IMAGE | DATASHEET
- url: String
- thumbnailUrl: String?
- alt: Localized?
- sortOrder: int
```
Source: `GET /products/{idOrSlug}` → `media[]`; `GET /catalog/sync` → `payload.media[]` (**without `id`**).

### 8.5 `CategoryRef` / `Category`

```text
Model: CategoryRef              // CategoryRefView
- id: String
- slug: String
- name: Localized
- path: String

Model: Category extends CategoryRef      // CategoryView
- parentId: String?
- description: Localized?
- imageUrl: String?
- depth: int
- sortOrder: int
- productCount: int             // direct, ACTIVE, NOT version-gated
- subtreeProductCount: int      // subtree incl. self, same caveat
- children: List<Category>?     // only when ?tree=true
```

### 8.6 `Attribute` / `AttributeOption`

```text
Model: Attribute                // AttributeView
- id: String
- code: String                  // the filter key
- label: Localized
- dataType: AttributeType       // NUMBER | ENUM | TEXT
- canonicalUnit: String?
- decimalPlaces: int?           // 0 = whole; null = unconstrained
- isFilterable: bool
- sortOrder: int
- options: List<AttributeOption>

Model: AttributeOption          // AttributeOptionView
- id: String
- code: String                  // send this back in attr[CODE]=…
- label: Localized
- sortOrder: int
```

### 8.7 `Filter` / `FilterOption` / `Highlight`

```text
Model: Filter                   // FilterView
- code: String
- label: Localized
- type: AttributeType           // storage → formatting
- strategy: FilterStrategy      // DISCRETE | RANGE → THE CONTROL
- unit: String?
- options: List<FilterOption>?  // DISCRETE only
- truncated: bool?              // DISCRETE only; absent when false
- range: { min: num, max: num }?// RANGE only
- count: int                    // products carrying the attribute

Model: FilterOption             // FilterOptionView
- code: String                  // round-trips verbatim
- label: Localized
- count: int                    // distinct products

Model: Highlight                // HighlightView
- code: String
- label: Localized
- unit: String?
- display: Localized            // PRE-RENDERED — show as-is
```

### 8.8 `SpecSheetRow`

```text
Model: SpecSheetRow
- code: String?                 // attribute code, or NULL for an extra spec
- label: Localized
- value: Localized              // pre-rendered, multi-values already joined
```

**[C]** `code == null` marks an **extra spec** — a free-form row no attribute claims. Facet rows and extra specs **interleave** on a shared `displayOrder` axis (the rank of the row in the manufacturer's original table), so extra specs are not dumped at the end. **Render in array order.**

**[C]** `value.en` is `null` when **any** part of a multi-valued row lacks an English side (`spec-sheet.composer.ts:133-136`) — it is all-or-nothing per row, not per part.

### 8.9 `Product` — three shapes, and they differ

⚠️ This is the second-most important structural fact in this document. **The offline payload is not the same object as the online detail view.**

| Field | `ProductListItem` (`GET /products`) | `ProductDetail` (`GET /products/{id}`) | `CatalogItemPayload` (`GET /catalog/sync`) |
| --- | :---: | :---: | :---: |
| `id` | ✅ | ✅ | ✅ |
| `slug` | ✅ | ✅ | ✅ |
| `sku` | ✅ | ✅ | ✅ |
| `itemNumber` | ✅ | ✅ | ✅ |
| `name` | ✅ | ✅ | ✅ |
| `description` | ❌ | ✅ `Localized?` | ✅ `Localized?` |
| **highlight bullets** | ❌ | ✅ as **`highlightPoints`** | ✅ as **`highlights`** ⚠️ |
| **typed highlight facets** | ✅ as **`highlights`** ⚠️ | ✅ as **`highlights`** | ✅ as **`highlightFacets`** ⚠️ |
| `category` | ✅ `CategoryRef?` | ✅ `CategoryRef?` | ✅ `{id, slug, name, path}?` |
| `breadcrumb` | ❌ | ✅ (incl. self) | ❌ — derive from `category.path` |
| `primaryImage` | ✅ | ✅ | ❌ — take the first `IMAGE` from `media` |
| `media` | ❌ | ✅ **with `id`** | ✅ **without `id`** ⚠️ |
| `specSheet` | ❌ | ✅ | ✅ |
| `hasDatasheet` | ❌ | ✅ | ❌ — derive: any `media.type == DATASHEET` |
| `isAvailable` | ✅ | ✅ | ✅ |
| `status` | ✅ `ProductStatus` | ✅ `ProductStatus` | ✅ **`String`** ⚠️ |
| `reportingCategory` | ❌ | ❌ | ✅ **`String`** — online surface never returns it |
| `checksum` | ✅ `String?` | ✅ `String?` | ✅ (as the **sibling** `changed[].checksum`, not inside `payload`) |

⚠️ **The `highlights` name collision is a real trap.** In the online views `highlights` = typed facets (`HighlightView[]`). In the offline payload `highlights` = marketing bullets (`Localized[]`) and the typed facets are called `highlightFacets`. **A single Dart model cannot deserialise both.** Write two models (`ProductDto` and `OfflineProductPayloadDto`) and map them to one domain entity.

**[C]** `payload.media` entries have **no `id`** — the offline builder omits it. Generate a local key from `(productId, sortOrder, url)` if your local store needs one.

**[C]** `payload.status` and `payload.reportingCategory` are declared as plain `String` in `CatalogItemPayload`, not the Prisma enums. Parse defensively.

### 8.10 `SyncPage`

```text
Model: SyncPage
- fromVersion: int?
- toVersion: int                // 0 ⇒ nothing published
- changed: List<ResolvedItem>
- removed: List<String>         // final page only
- nextCursor: String?
- complete: bool

Model: ResolvedItem
- productId: String
- checksum: String
- payload: CatalogItemPayload
```

---

## 9. Enums

**[C]** Every enum below comes from `prisma/schema.prisma` or a DTO. **No values are invented.** Parse every one defensively with an `unknown` fallback — an admin migration could add a value before the app ships an update.

### `ProductStatus`
```text
ACTIVE
DISCONTINUED
```
| Value | Where it appears | Mobile action |
| --- | --- | --- |
| `ACTIVE` | Everywhere. The only value `GET /products` can return. | Normal render. |
| `DISCONTINUED` | `GET /products/{idOrSlug}` and offline payloads of older versions only. | **Render the page** with a "discontinued" banner; suppress any "add to quote" affordance. Never 404 it yourself. |

### `AttributeType`
```text
NUMBER   // canonicalMin/canonicalMax (+ qualifier), in canonicalUnit
ENUM     // optionId — controlled vocabulary
TEXT     // valueText/valueTextEn, stored as written
```
| Value | Mobile action |
| --- | --- |
| `NUMBER` | Format with `unit`/`decimalPlaces` **only if you render raw values**. Prefer the pre-rendered `display`/`label`. Filter syntax: `..` or `~` (§12.4). |
| `ENUM` | Filter with `options[].code`, comma-separated. |
| `TEXT` | Filter with the exact stored value from `options[].code` (already comma-escaped). |

⚠️ **Do not choose a filter control from this enum.** Use `strategy`.

### `FilterStrategy`
```text
NONE      // not offered — NEVER reaches the client
DISCRETE  // checkbox list from options[], each with a count
RANGE     // min/max slider from range{}. NUMBER only.
```
| Value | Mobile action |
| --- | --- |
| `NONE` | Unreachable — the query excludes it. If you ever see it, ignore the filter. |
| `DISCRETE` | Render checkboxes from `options[]`. If `truncated == true`, add a search field. |
| `RANGE` | Render a slider bounded by `range.min`/`range.max`. Emit `attr[CODE]=lo..hi`. |

### `MediaType`
```text
IMAGE
DATASHEET
```
| Value | Mobile action |
| --- | --- |
| `IMAGE` | Gallery. First by `sortOrder` is the card image. |
| `DATASHEET` | PDF link/download. **Exclude from the image gallery.** |

### `ProductCategory` (reporting dimension, `?reportingCategory=`)
```text
SOCKETS_SWITCHES · LIGHTING · EXHAUST_FANS · CABLES · DISTRIBUTION_BOARDS
CIRCUIT_BREAKERS · CONDUIT_TRUNKING · ACCESSORIES · OTHER
```
**[C]** A **reporting** dimension used by subsystem 14 — **orthogonal to the category tree**. It is accepted as a filter but **never returned** by any rep-facing read model (only by the offline `payload.reportingCategory`). **[I]** You therefore cannot build a UI that shows the user which reporting category a product is in from the online API; you can only filter by it.

### `ValueQualifier` (never returned directly — rendered into strings)
```text
MIN     → rendered "≥ "
MAX     → rendered "≤ "
APPROX  → rendered "≈ "
```
**[C]** The client never receives this enum. It is already baked into `display`/`label`/`value` strings. Documented so you understand why a value reads `≥ 90`.

### `ProductSortDto` (`?sort=`)
```text
relevance · name · newest · category
```
Lower-case. See §7.7.

### `CatalogVersionStatus` (never exposed to mobile)
```text
DRAFT · PUBLISHED · ARCHIVED
```

### `SuggestionView.kind`
```text
PRODUCT     // the only value ever emitted
CATEGORY    // declared in the type; no code path produces it
```

---

## 10. Business Rules

Rules that change what the mobile app must do. All **[C]** unless marked.

**BR-1 — Product visibility is three conditions, all required.**
A product appears in `GET /products` and `GET /products/suggest` only if: (a) not soft-deleted, (b) `status = ACTIVE`, (c) present in the **current published** catalogue version. Testing status *as well as* membership is deliberately stricter than publish-gating alone: discontinuation takes effect **immediately**, while creation still waits for a publish.

**BR-2 — A discontinued product is still reachable by id/slug.**
`GET /products/{idOrSlug}` applies **no status filter** (CP5). It is referenced by historical activities and outcomes. Only list and search hide it. → Check `status` on the detail screen.

**BR-3 — A new product is invisible until an admin publishes.**
There is no "draft visible to reps" state. A rep who is told a product exists but cannot find it is seeing correct behaviour, not a bug.

**BR-4 — "Not published" and "not found" are indistinguishable, on purpose.**
Both are `404 CATALOG_PRODUCT_NOT_FOUND`. Never a 403. The same rule the project module applies to projects that are not yours — splitting them would let a caller enumerate.

**BR-5 — Nothing published ⇒ 503, not an empty list.**
"Nothing published" and "no matches" are different answers and the API refuses to conflate them. → Different UI states.

**BR-6 — Availability is advisory (CP7).**
`isAvailable` is a presentational hint; the **ERP owns real stock**. The backend refuses to apply it as a default filter. → **Never hide a product because `isAvailable == false`.** Show a badge. Only filter on it if the rep explicitly opts in.

**BR-7 — The catalogue is shared master data with no scoping.**
No territory filter, no ownership, no per-rep visibility. Every authenticated role sees the identical tree, products and counts. → No permission logic on this surface.

**BR-8 — Category counts are not version-gated.**
`productCount`/`subtreeProductCount` count ACTIVE, non-deleted products **regardless of publication**. `GET /products` requires publication. → **The count can exceed the list total.** Never display a category count as the result-set total. **[I]** Prefer showing `data.total` from the list once loaded.

**BR-9 — Inactive categories are never visible to mobile.**
`includeInactive` is hard-coded `false`.

**BR-10 — The spec sheet is derived, never stored.**
Composed at read time from typed facets + extra specs. The verbatim `specSheetAr`/`specSheetEn` columns are retained as an archive and are **not exposed by any read model**. → Do not expect a raw sheet; do not attempt to re-derive it locally. **The same composer builds the online sheet and the offline payload**, so they agree.

**BR-11 — The offline copy can legitimately disagree with the online API. [C]**
Online reads hit live tables; offline payloads are frozen at publish. An edit to an already-published product is live online but not offline until the next publish. The backend calls this "drift" and exposes it **to admins only**. → **[I]** The mobile app has no way to detect or resolve this. Treat `manifestChecksum` as the *only* staleness signal available, and understand it will not change when drift occurs (drift is by definition *un*published). Show "last synced" prominently.

**BR-12 — `checksum` is the per-product staleness signal.**
`ProductListItem.checksum` (online) and `SyncPage.changed[].checksum` (offline) are the **same value** for the same product in the same version. → Compare them to decide whether a cached detail page is current.

**BR-13 — Media URLs must be stable and public.**
Documented as deliberately unsigned: "a signed URL would expire before the rep opens the app." → Safe to prefetch and cache indefinitely. **[I]** Cache-bust on `checksum` change, not on a timer.

**BR-14 — Filter availability is data, not layout.**
Which attributes appear per category is `CategoryAttribute.filterStrategy` gated by `Attribute.isFilterable`. Nothing is hard-coded. Density varies from 3 to 14 filters. → **Never hard-code a filter rail.**

**BR-15 — Attributes with no values in the result set are omitted, not zeroed.**
A `RANGE` filter is also dropped when `min == max`. → The rail can shrink as filters are applied. Re-fetch it after every filter change.

**BR-16 — English is the primary language.**
`sort=name` keys on `nameEn` with `NULLS LAST`; relevance ranks English before Arabic. **[I]** An Arabic-first UI will therefore see an ordering driven by English names. This is intended, not a bug — but flag it to product/design.

**BR-17 — Facet counts are product counts, never row counts.**
A product carrying `50 / 60 Hz` contributes **one** to `FREQUENCY`, not two. This was an actual past bug (544 reported in a subtree of 479).

**BR-18 — A product can be unfiled.**
`Product.categoryId` is nullable → `category: null` and `breadcrumb: []`. → Handle it on the card and the detail page.

---

## 11. Search

**[C]** Search is `?q=` on `GET /products` and `GET /products/suggest`. There is no dedicated search endpoint.

### 11.1 Normalisation (both endpoints)

**[C]** `normalizeText()` — ported **verbatim** from the migration's `normKey` so the query and the index agree. Rules, in order:

1. strip tashkeel (`ً`–`ْ`) and tatweel (`ـ`)
2. alef forms `أ إ آ ٱ` → `ا`
3. alef maqsura `ى` → `ي`
4. ta marbuta `ة` → `ه`
5. **anything that is not a letter or digit → a single space**
6. collapse whitespace, trim, **casefold**

**[C]** Rule 5 is what makes `IEC 60598`, `IEC-60598` and `IEC60598` all match — without knowing either script.

**[I] Client-side consequence:** you can safely send the raw user input. Do **not** pre-strip punctuation or normalise Arabic yourself — you would risk diverging from the server's rules.

### 11.2 Minimum length, and what it means

**[C]** `MIN_QUERY_LENGTH = 2`, applied to the **normalised** string.

| Endpoint | Term < 2 normalised chars |
| --- | --- |
| `GET /products` | `q` is **dropped**; the request succeeds as an unfiltered list, and `sort` falls back to `name`. |
| `GET /products/suggest` | Returns `[]`. **Not** an error. |

⚠️ **[I]** A single Arabic letter, or `"a"`, or `"—"` (which normalises to empty) all silently become "no search". Your UI must not present an unfiltered list as a search result. **Gate on ≥ 2 characters client-side after trimming.**

### 11.3 Searchable fields — the corpus

**[C]** `buildSearchText()` folds exactly these into one normalised `searchText` column:

- `nameEn`, `nameAr`
- `sku`
- `itemNumber`
- `categoryNameEn`, `categoryNameAr`
- option names of **`isHighlight` ENUM facets only** (e.g. "black", "أسود")

**[C] Deliberately excluded:** spec sheets, descriptions, and every free-text attribute value. Reason given: the sheet is ~10 rows of units and standards per product, so a search for `65` would match IP rating, lifespan, flux and beam angle at once and relevance would collapse.

⚠️ **[I] Consequence for the UI:** searching for a spec value ("IP65", "3000K") will **not** find products unless that value is an `isHighlight` ENUM option or appears in the name. **Direct users to filters for spec-based discovery, not to search.** This is the single biggest search expectation gap.

### 11.4 Matching semantics

**[C]** Tokens are split on space and **ANDed**; each is a `contains` (substring) match on the normalised `searchText`, accelerated by a trigram GIN index. No `mode: 'insensitive'` — the column is already lower-cased.

⚠️ **[C] There is NO typo tolerance and NO fuzzy matching.** The `ListProductsQueryDto` description claims the search is "typo-tolerant", but the implementation is plain substring containment (`prisma-catalog.repository.ts:436-443`). No `similarity()`, no `%` operator, no `pg_trgm` distance threshold appears anywhere in the read path — the trigram index accelerates `LIKE '%…%'`, it does not make it fuzzy. **Do not promise typo tolerance in the UI, and do not rely on it in tests.** See §21-Q5.

**[I]** Substring matching does mean partial words work: `trac` matches `track`. That is prefix/infix tolerance, not typo tolerance.

### 11.5 Relevance ranking

**[C]** `rankByRelevance` — applied only when `sort=relevance` **and** a usable `q` is present. Scored lowest-first:

| Rank | Condition |
| --- | --- |
| 0 | `normalize(sku) == needle` — **exact SKU match** |
| 1 | `normalize(nameEn)` **starts with** needle |
| 2 | `normalize(nameAr)` **starts with** needle |
| 3 | `normalize(nameEn)` **contains** needle |
| 4 | `normalize(nameAr)` **contains** needle |
| 5 | everything else (matched via sku/itemNumber/category/highlight terms) |

**[C]** Stable: ties keep the database order. English is ranked above Arabic — English is primary.

⚠️ **[C] Relevance ranking is done in memory over the full candidate set, then sliced.** `listProducts` skips SQL pagination when ranking (`:483-494`) — it fetches **every** matching row, ranks, then slices the page. Correctness is unaffected; **[I]** but a very broad `q` on a large result set is the slowest request in this API. Keep `limit` at or below 20 for search.

### 11.6 Suggest specifics

**[C]** `suggest` fetches `limit * 4` candidates, ranks them with the same function, then slices to `limit`. **[I]** So a suggestion list is a *ranked sample* of up to 4× the requested size, not the globally best matches. Do not present suggestion order as authoritative ranking.

### 11.7 Search + filters + category

**[C]** `q`, `category`/`includeSubtree`, `attr[…]`, `reportingCategory`, `hasDatasheet`, `available` all **AND** together into one `where`. `/categories/filters` accepts `q` too, so facet counts reflect the search term. → **Always pass the same `q` to both endpoints.**

---

## 12. Filtering

### 12.1 Discovery

**[C]** Filters are **never hard-coded**. Flow:

```
GET /categories/filters?category=X[&attr…][&q…]   →  FilterView[]
        ↓ filters[].code                              (the attr key)
        ↓ filters[].strategy                          (the control)
        ↓ filters[].options[].code                    (the exact token to send)
GET /products?category=X&attr[CODE]=<option.code>
```

### 12.2 ⚠️ `type` vs `strategy` — the distinction that matters most

**[C]** These are two different questions and the API answers both:

| Field | Question it answers | Decided by | Use it for |
| --- | --- | --- | --- |
| `type` (`AttributeType`) | **How is the value stored?** | `Attribute.dataType` — global, one per attribute | **Formatting** and **filter syntax** |
| `strategy` (`FilterStrategy`) | **How should this render, here?** | `CategoryAttribute.filterStrategy` — **per category** | **Choosing the control** |

**[C]** The same attribute can be a checklist in one category and a slider in another: `VOLTAGE` is `DISCRETE` in Down Light (3 distinct values) but `RANGE` across the interior-lighting subtree (19). `IP_RATING` is stored as `NUMBER` but is `DISCRETE` everywhere it is offered.

⚠️ **[C]** The source states this explicitly: *"A client that switches on `type` instead of this will put a slider on IP_RATING, which is the bug this field exists to end."*

**Rule: `strategy` picks the widget. `type` picks the syntax.**

### 12.3 Sending filters

```
?attr[POWER]=10..20&attr[BODY_COLOUR]=BLACK,WHITE&attr[IP_RATING]=65~65
```

**[C] Boolean structure — the standard e-commerce contract:**

- **OR within one attribute** — `BLACK,WHITE` → either.
- **AND across attributes** — every attribute must match.
- **A product matches an attribute if ANY of its values matches** — 62% of products carry at least one multi-valued attribute (`FREQUENCY` = `50 / 60 Hz` being the common case).

### 12.4 Value syntax by storage type

#### `NUMBER` — **two readings, two syntaxes, and they are different questions**

**[C]** This is the subtlest part of the whole contract.

| Syntax | Meaning | Predicate | Emitted by |
| --- | --- | --- | --- |
| `10..20` | "works **anywhere** in 10–20" | **interval overlap** | RANGE slider |
| `10..` | "works at 10 or above" | overlap, open upper | RANGE slider |
| `..20` | "works at 20 or below" | overlap, open lower | RANGE slider |
| `15` | **not equality** — an interval `[15,15]`, matched by overlap | overlap | a bare number |
| `220~240` | "**rated exactly** 220–240" | **identity** on the stored value | DISCRETE checkbox |
| `65~65` | "rated exactly 65" | identity | DISCRETE checkbox |

**[C] Why both exist — a concrete case from the live data:** for `AMBIENT_TEMP`, the rail offers "10–40 °C" because **16 products are rated exactly that**, but **55 products have an interval overlapping it**. A checkbox that advertises 16 and returns 55 is lying about its own count. So the two readings get two syntaxes rather than one guess.

⚠️ **[C] The rule for the client:**
> **`~` (identity) is the ONLY form whose result count matches the count the rail advertised.**
> When the rail gave you `options[].code`, **send it back verbatim** — it is already `min~max`. Never rewrite `65~65` as `65`.
> Compose `lo..hi` **only** from a `RANGE` slider.

**[C]** `230` matching a product rated `220–240 V` is the whole point of overlap — 599 values in the catalogue are genuine ranges, and 384 of 604 `VOLTAGE` rows are ranges.

**[C] Qualifiers expand to real intervals.** A product declaring `> 120°` is stored as 120 with `qualifier = MIN` and matched as `[120, ∞)`. This **favours recall**: it can return a product whose true figure is unknown but plausibly satisfies the filter — and the rendered value always shows the qualifier (`≥ 120`) so the rep can judge. 590 values carry a qualifier. **[I]** Do not suppress qualified values in the UI; the rendered string is the disclosure.

**[C]** A list may **mix** the two forms: `65~65,80..100` = "rated exactly 65, **or** anything usable between 80 and 100". Both are OR-ed.

#### `ENUM`
```
attr[BODY_COLOUR]=BLACK,WHITE
```
**[C]** Option **codes**, comma-separated, upper-cased by the parser. Send `options[].code`.

#### `TEXT`
```
attr[DIMENSIONS]=70*70,56*50
```
**[C]** The **exact stored values**, matched case-insensitively. Escape a literal comma as `\,`.

**[C]** This used to be a substring match and was **changed because it was wrong**: `LUMINOUS_FLUX` aside, a `100` on any numeric string also matched 1000, 4100 and 10000. → **Send the `code` the rail gave you; never compose one.**

### 12.5 Range filters (`strategy: RANGE`)

**[C]** `range: {min, max}` is the **observed span within the current result set**, not the catalogue-wide span. It therefore narrows as other filters are applied.

**[I]** Emit `attr[CODE]=lo..hi`. If the user leaves one end at its bound, you may send the open form (`10..` / `..20`) — both are valid and equivalent in effect.

**[C]** A `RANGE` filter is **omitted entirely** when `min == max` in the current set.

### 12.6 Invalid input and error behaviour

| Input | Result |
| --- | --- |
| `attr[NOPE]=x` (unknown attribute) | `400 CATALOG_UNKNOWN_FILTER_ATTRIBUTE` |
| `attr[X]=y` where `X.isFilterable == false` | **Same** `400 CATALOG_UNKNOWN_FILTER_ATTRIBUTE` |
| `attr[POWER]=abc` | `400 CATALOG_INVALID_FILTER_VALUE` |
| `attr[POWER]=20..10` (lo > hi) | `400 CATALOG_INVALID_FILTER_VALUE` |
| `attr[POWER]=..` (no bound) | `400 CATALOG_INVALID_FILTER_VALUE` |
| `attr[POWER]=240~220` (min > max) | `400 CATALOG_INVALID_FILTER_VALUE` |
| `attr[POWER]=` (empty) | **Skipped silently.** Not an error — "no opinion". |
| `attr[BODY_COLOUR]=NOSUCHCOLOUR` | **No error.** Parsed as an option code; simply matches nothing → empty result. |

**[C]** "Unknown attribute" and "not filterable" are **deliberately one error** — splitting them would let a caller enumerate which attribute codes exist by probing.

⚠️ **[I]** Note the asymmetry: a bad **attribute** is a 400; a bad **ENUM option value** is a silent empty result. A "no results" screen can therefore mean either "genuinely nothing" or "stale option code from a cached rail". → After a publish changes the vocabulary, refresh the rail before trusting an empty result.

### 12.7 Filters and categories

**[C]** Filters are resolved against `CategoryAttribute` bindings. Omitting `?category=` gives a **catalogue-wide** rail (all bindings, deduplicated). With a category, only that category's bindings — **note:** the binding lookup uses `categoryId` exactly, while the *product set* honours `includeSubtree`. **[I]** So on a parent category with `includeSubtree=true`, the rail reflects the parent's own bindings but counts computed over the whole subtree.

**[C]** Subtree strategy conflicts resolve to `RANGE`.

---

## 13. Pagination

**[C]** Two mechanisms, and they share nothing.

### 13.1 Page-based — `GET /products` only

```text
?page=1&limit=20
```

| Aspect | Contract |
| --- | --- |
| Params | `page` (≥ 1, default 1), `limit` (1–**100**, default 20) |
| Response location | **Inside `data`** — `data.items`, `data.total`, `data.page`, `data.limit`, `data.totalPages` (§5.2) |
| `totalPages` | `ceil(total / limit)`. **`0` when `total == 0`.** |
| Next page | `page + 1` while `page < totalPages` |
| Stop condition | `page >= totalPages`, **or** `items.length < limit` |
| Empty result | `200`, `items: []`, `total: 0`, `totalPages: 0`. Never 404. |
| Over-run | **REQUIRES BACKEND CONFIRMATION** — `page=999` beyond the end is not explicitly handled; Prisma `skip` past the end yields an empty array, so **[I]** expect `200` with `items: []` and a non-zero `total`. Verify before relying on it. |
| Refresh | Re-request `page=1`. There is no snapshot/consistency token — **[I]** a publish between pages can shift items. Acceptable for a hand-maintained catalogue; de-duplicate by `id` when appending. |
| Reset triggers | **Any** change to `q`, `category`, `includeSubtree`, `attr`, `sort`, `reportingCategory`, `hasDatasheet`, `available`. |

**[C]** `total` is a genuine `COUNT` over the same `where`, computed before paging — safe to display.

### 13.2 Cursor-based — `GET /catalog/sync` only

```text
?since=3&limit=100          → nextCursor
?since=3&cursor=<uuid>&limit=100
```

| Aspect | Contract |
| --- | --- |
| Params | `since` (≥ 1, optional), `cursor` (≤ 100 chars), `limit` (1–**250**, default 100) |
| Cursor value | The last `productId` of the **scanned** page. Ordered `productId ASC`. Treat as opaque. |
| Next page | Resend with `cursor = nextCursor`, **keeping `since` and `limit` unchanged**. |
| **Stop condition** | **`complete == true`. Nothing else.** |
| Empty `changed` | **Does not mean done** — `limit` bounds items *scanned*, not *returned*. |
| `removed` | Final page only, and only on a delta against a known version. |
| Stability | A version's items never change once written, so the cursor is unaffected by concurrent publishes. **[I]** A publish mid-sync means you finish syncing toward the *old* `toVersion`; the next `/catalog/version` check catches up. |
| Retry | Pages are pure reads — **retrying the same cursor is idempotent and safe.** |

⚠️ **Never mix the two.** `page`/`limit` on `/catalog/sync` → `page` is an unknown param → **400**.

---

## 14. Offline / Synchronization

### 14.1 What the offline system is

**[C]** Publishing (CP2) freezes every ACTIVE, non-deleted product into `CatalogVersionItem.payload` with a per-item sha256 `checksum`. `GET /catalog/sync` ships those frozen payloads (CP3). Deltas are computed by comparing the held version's checksums against the current version's.

**[C]** One builder serves publish, sync and drift — *"if these ever diverge, an offline copy will disagree with the online one and both will look plausible in isolation."*

### 14.2 Full download

```text
GET /catalog/sync?limit=100                    (no `since`)
GET /catalog/sync?limit=100&cursor=<nextCursor>
… until complete == true
```

**[C]** `fromVersion: null`, `removed` always `[]`, every scanned item lands in `changed`.

### 14.3 Delta sync

```text
GET /catalog/sync?since=<heldVersion>&limit=100
GET /catalog/sync?since=<heldVersion>&cursor=<nextCursor>&limit=100
… until complete == true
```

**[C]** Only items whose checksum differs from the held version appear in `changed`. `removed` arrives on the final page.

**[C]** An unknown `since` degrades to a full download — safe.

### 14.4 The processing algorithm (exact)

```text
1.  GET /catalog/version
        503 → keep the existing copy; show "unavailable"; STOP.
2.  if manifestChecksum == stored.manifestChecksum → up to date; STOP.
3.  since := stored.versionNumber (null/absent → omit `since`)
4.  cursor := null;  buffer := []
5.  LOOP:
        GET /catalog/sync?since=…&limit=100[&cursor=…]
        if toVersion == 0 → nothing published; abort; keep existing copy; STOP.
        buffer += page.changed
        if page.complete:
              removals := page.removed
              break
        cursor := page.nextCursor
        if cursor == null and not complete →  ⚠ malformed; abort and retry the whole sync
6.  BEGIN LOCAL TRANSACTION
        upsert every buffer item by productId (payload + checksum)
        delete every id in removals
        stored.versionNumber    := page.toVersion
        stored.manifestChecksum := (re-fetch from /catalog/version, or the value from step 1)
        stored.lastSyncedAt     := now()
     COMMIT
7.  Prefetch media for changed items (see 14.7)
```

⚠️ **[C] Rule 1: apply `removed` only after the final page.** Removals are ids absent from the current version **entirely**; there is no cursor position they belong to.

⚠️ **[I] Rule 2: commit the whole sync in one local transaction.** A partially-applied sync with a committed `versionNumber` is unrecoverable — the next delta would skip the items you never wrote. If you must stream to disk to bound memory, keep `versionNumber` **uncommitted** until the final page lands.

⚠️ **[I] Rule 3: `toVersion` can differ from the `versionNumber` you saw in step 1** if a publish lands mid-sync. **Always store `page.toVersion`**, not the step-1 value. Then re-run step 1 — the checksum comparison will trigger another (small) delta.

⚠️ **[I] Rule 4: guard `toVersion == 0`.** Storing 0 makes the next `?since=0` fail `@Min(1)` with a 400 and wedges sync permanently.

### 14.5 Partial sync and resumption

**[C]** Pages are pure reads and fully idempotent. A dropped connection can resume from the last successful `nextCursor` — *"a rep on a site connection gets each chunk to succeed or retry on its own instead of losing the whole transfer."*

**[I]** Persist `(since, cursor, toVersion)` alongside the buffer if you want cross-launch resumption. Simpler and also correct: discard the buffer and restart the sync — the server does not care.

### 14.6 Sync vs the rate limit

⚠️ **[C]** A full download at `limit=100` over 1005 products is **11 requests**. The global budget is **30 requests / 60 s**, shared with every other call the app makes.

**[I] Recommended:** `limit=250` (the max) → 5 requests for a full download; insert a short delay between pages; never sync concurrently with a browse session. On `429` during sync, **back off and resume from the same cursor** — never restart.

### 14.7 Media

**[C]** Media are **URLs only**; the payload never embeds bytes. URLs are stable and public by design — *"a signed URL would expire before the rep opens the app."*

**[I]** The client prefetches bytes itself, after the payload transaction commits. Prefetch order: `primaryImage`/first `IMAGE` first (cards), then remaining images, then `DATASHEET` PDFs last (largest, least used offline). Cache-key on the URL; invalidate when the product's `checksum` changes.

**REQUIRES BACKEND CONFIRMATION:** whether media URLs are guaranteed immutable for a given `(product, version)`, or whether an admin re-upload can change the bytes behind an unchanged URL. If the latter, URL-keyed caching will serve stale images. The `checksum` covers the URL string, **not** the bytes.

### 14.8 What offline mode can and cannot serve

**[C]** From `CatalogItemPayload` the client can render, with **no network**: product cards, product detail, spec sheets, category breadcrumb (via `category.path`), highlight facets, media (if prefetched).

⚠️ **[I] What it CANNOT do offline, because the payload does not contain it:**

| Capability | Why not |
| --- | --- |
| **Facet counts / the filter rail** | `/categories/filters` computes counts server-side per result set. The payload carries rendered `specSheet` strings and `highlightFacets`, **not** the typed `(attributeId, canonicalMin, canonicalMax, optionId)` rows. → **You cannot reconstruct filter counts offline.** |
| **Filtering by attribute** | Same reason. You would have to re-parse rendered strings — do not. |
| **The category tree with counts** | `/categories` is a separate endpoint and is **not** part of the sync payload. **[I] Cache its response separately** as part of your offline bundle. |
| **The attribute vocabulary** | Also separate (`/catalog/attributes`). **Cache it separately.** |
| **Search** | `searchText` is server-side. **[I]** Build a local index from `name`/`sku`/`itemNumber`/`category.name`, and port `normalizeText` to Dart **verbatim** so offline results match online ones. |

⚠️ **The offline bundle is therefore THREE cached resources, not one:**
`/catalog/sync` payloads **+** `/categories?tree=true` **+** `/catalog/attributes`.

---

## 15. Complete Mobile User Flows

### 15.1 App launch / catalogue bootstrap

```text
App launch (authenticated)
   ↓
GET /catalog/version                                    ← cheap, every launch
   ↓
   ├─ 503 CATALOG_NO_PUBLISHED_VERSION
   │       → serve offline copy if present, else "catalogue unavailable"; STOP
   ├─ 401 → refresh (single-flight) → retry once → else logout
   └─ 200
        ↓
   compare manifestChecksum with stored
        ├─ equal → catalogue current → go to 15.2
        └─ differ (or nothing stored)
             ↓
        GET /categories?tree=true          ─┐
        GET /catalog/attributes            ─┼→ cache all three
        GET /catalog/sync (loop §14.4)     ─┘
             ↓
        commit {versionNumber, manifestChecksum, lastSyncedAt}
             ↓
        prefetch media (background)
```

| Step | Endpoint | Required state | Local state updated | Next |
| --- | --- | --- | --- | --- |
| 1 | `GET /catalog/version` | valid access token + deviceId | — | 2 |
| 2 | *(compare)* | `stored.manifestChecksum` | — | 3 or done |
| 3 | `GET /categories?tree=true` | — | `categories` | 4 |
| 4 | `GET /catalog/attributes` | — | `attributes` | 5 |
| 5 | `GET /catalog/sync` loop | `stored.versionNumber` → `since` | `products`, `checksums` | 6 |
| 6 | *(commit)* | all pages complete | `versionNumber`, `manifestChecksum`, `lastSyncedAt` | 7 |
| 7 | media prefetch | product payloads | media cache | done |

### 15.2 Browse → filter → detail

```text
Category list (from cache)
   ↓ user taps a category
GET /categories/filters?category=<slug>&includeSubtree=true   ─┐  parallel
GET /products?category=<slug>&includeSubtree=true&page=1&limit=20 ─┘
   ↓
render rail (switch on strategy) + product grid (data.items)
   ↓ user checks "Black"
GET /categories/filters?category=<slug>&attr[BODY_COLOUR]=BLACK   ─┐ parallel
GET /products?category=<slug>&attr[BODY_COLOUR]=BLACK&page=1      ─┘  page RESET to 1
   ↓ user scrolls
GET /products?…&page=2                                     append; de-dupe by id
   ↓ user opens a product
GET /products/<slug>
   ↓
render detail; if status == DISCONTINUED → banner
```

| Step | Endpoint | Required state | Local state | Next |
| --- | --- | --- | --- | --- |
| 1 | `/categories/filters` | category slug/id | `activeRail` | 3 |
| 2 | `/products` | same params as 1 | `results`, `total`, `page` | 3 |
| 3 | filter change | `activeRail` codes | reset `page=1` | back to 1+2 |
| 4 | scroll | `page < totalPages` | append `items` | 4 |
| 5 | `/products/{slug}` | product `slug` | `productDetail` cache keyed by `checksum` | — |

**[I]** Steps 1+2 must fire together and be cancelled together. Debounce ≥ 300 ms on filter changes.

### 15.3 Search

```text
User types in the search box
   ↓ trim + require ≥ 2 chars + debounce 300ms
GET /products/suggest?q=<term>&limit=10
   ↓
   ├─ user taps a suggestion → GET /products/<suggestion.slug>   (skip the list)
   └─ user submits
        ↓
   GET /products?q=<term>&sort=relevance&page=1&limit=20     ─┐ parallel
   GET /categories/filters?q=<term>                          ─┘
        ↓
   results + a rail scoped to the search result set
        ↓ user adds a category filter
   GET /products?q=<term>&category=<slug>&page=1
```

**[I]** If `data.total == 0`, surface the §11.3 gap explicitly: *"Spec values like IP65 aren't searchable — try the filters."*

### 15.4 Offline browse

```text
No connectivity
   ↓
serve products from the local payload store
   ↓
show "Last synced: <lastSyncedAt>" persistently
   ↓
disable / hide: filter rail, facet counts, attribute filtering
   ↓
enable: local search over name/sku/itemNumber/category (normalizeText port)
   ↓ connectivity returns
run 15.1 from step 1
```

### 15.5 Token expiry mid-browse

```text
GET /products → 401 (HTTP_EXCEPTION "Unauthorized")
   ↓
interceptor acquires the SINGLE-FLIGHT refresh mutex
   ├─ already refreshing → queue this request; await the result
   └─ acquired
        ↓
   POST /auth/refresh { refreshToken } + X-Device-Id   (NO Authorization header)
        ├─ 200 → store new pair → replay ALL queued requests once
        └─ 401 AUTH_INVALID_REFRESH_TOKEN
              → ALL sessions on ALL devices are dead
              → clear tokens + user; KEEP the catalogue cache
              → navigate to login
```

⚠️ See §3.3. This is the flow most likely to be implemented wrongly, and the failure mode is logging the rep out of every device.

---

## 16. Endpoint Dependency Map

```text
                    ┌──────────────────────────┐
                    │  POST /auth/login        │
                    │  POST /auth/verify-otp   │──→ accessToken + deviceId
                    └────────────┬─────────────┘
                                 │  (every call below needs both)
        ┌────────────────────────┼────────────────────────┐
        ↓                        ↓                        ↓
GET /catalog/version    GET /catalog/attributes    GET /categories
 (versionNumber,          (vocabulary:              (tree, slugs, ids,
  manifestChecksum)        codes, labels,            counts)
        │                  options)                       │
        │ versionNumber                                   │ slug / id
        ↓ as ?since                                       ↓
GET /catalog/sync                              GET /categories/{idOrSlug}
 (payloads, checksums,                          (breadcrumb + children)
  nextCursor, removed)                                    │
        │ nextCursor ↺ (self-loop)                        │ slug / id
        │                                                 ↓
        │                              ┌───────────────────────────────┐
        │                              │ GET /categories/filters       │
        │                              │  ?category=&attr=&q=          │
        │                              │  → filters[].code             │
        │                              │  → filters[].strategy         │
        │                              │  → options[].code             │
        │                              └───────────┬───────────────────┘
        │                                          │ attr[CODE]=<option.code>
        │                                          ↓
        │                              ┌───────────────────────────────┐
        │      checksum  ←────────────→│ GET /products                 │
        │      comparison              │  ?category=&attr=&q=&sort=    │
        │      (BR-12)                 │  → data.items[].slug / .id    │
        │                              └───────────┬───────────────────┘
        │                                          │ slug / id
        │                                          ↓
        │                              GET /products/{idOrSlug}
        │                                          ↑
        │                              GET /products/suggest → slug
        ↓
   offline store
```

### Explicit hand-offs

| Producer | Field | Consumer | As |
| --- | --- | --- | --- |
| `/catalog/version` | `versionNumber` | `/catalog/sync` | `?since=` |
| `/catalog/version` | `manifestChecksum` | *(local)* | staleness comparison |
| `/catalog/sync` | `nextCursor` | `/catalog/sync` | `?cursor=` (self-loop) |
| `/catalog/sync` | `changed[].checksum` | *(local)* | compare with `ProductListItem.checksum` |
| `/categories` | `slug` / `id` | `/products`, `/categories/filters` | `?category=` |
| `/categories` | `id` **(id only)** | `/categories` | `?parentId=` |
| `/categories/{id}` | `children[].slug` | `/products` | `?category=` |
| `/categories/filters` | `filters[].code` | `/products` | `attr[CODE]` key |
| `/categories/filters` | `options[].code` | `/products` | `attr[CODE]` value |
| `/categories/filters` | `range.min/max` | `/products` | `attr[CODE]=min..max` |
| `/catalog/attributes` | `code`, `options[].code` | *(local)* | offline label rendering |
| `/products` | `items[].slug` / `.id` | `/products/{idOrSlug}` | path param |
| `/products/suggest` | `slug` | `/products/{idOrSlug}` | path param |

### Why the order exists

1. **Auth first** — every catalogue route is protected.
2. **Version before sync** — `since` requires a held version, and the checksum decides whether to sync at all.
3. **Attributes early and once** — products carry option *codes*, not labels; without the vocabulary the offline copy cannot render filter labels or ENUM values.
4. **Categories before filters** — the rail is scoped by category, and `?category=` needs a slug or id.
5. **Filters before products** — `attr[CODE]` keys and values are not guessable; they are supplied by the rail, already escaped.
6. **Products before detail** — the detail route needs an id or slug.

---

## 17. Local State / Cache Requirements

Only state the backend actually supports.

### 17.1 Secure storage (`flutter_secure_storage`)

| Item | Why | Created | Updated | Expires | Deleted |
| --- | --- | --- | --- | --- | --- |
| `accessToken` | Every request | login / verify-otp | every refresh | 900 s | logout; refresh-reuse 401 |
| `refreshToken` | Token renewal | login / verify-otp | every refresh (**rotates**) | 604 800 s | logout; refresh-reuse 401 |
| `deviceId` | `X-Device-Id` must match the token | first launch / registration | **never** | never | **Never — not even on logout.** Regenerating it invalidates every future token match. |

### 17.2 Catalogue sync state (plain local DB / prefs)

| Item | Type | Why | Created | Updated | Deleted |
| --- | --- | --- | --- | --- | --- |
| `catalogVersionNumber` | int | The `since` for delta sync | first successful sync | **only on a fully-committed sync**, to `page.toVersion` | on explicit "clear cache". **Never on logout** — the catalogue is not user-scoped (BR-7). |
| `manifestChecksum` | String | Staleness probe | first sync | with `catalogVersionNumber`, atomically | with the above |
| `lastSyncedAt` | DateTime | **Must be shown to the rep** — the only honest signal given BR-11 | each committed sync | each committed sync | with the above |
| `syncCursor` | String? | Resume a partial sync | mid-sync | per page | on completion or abandonment |

⚠️ **[I]** `catalogVersionNumber` and `manifestChecksum` **must be written together, atomically, and only after `complete: true`.** A mismatch silently corrupts every future delta.

### 17.3 Cached catalogue data

| Item | Source | Why | Invalidate when |
| --- | --- | --- | --- |
| `products` (payloads + checksum) | `/catalog/sync` | Offline browse | delta sync replaces/removes |
| `categories` | `/categories?tree=true` | Navigation; **not in the sync payload** | `manifestChecksum` changes **[I]** — no better signal exists |
| `attributes` | `/catalog/attributes` | Offline labels/filters | **No signal exists.** **[I]** Refresh alongside a sync. See §21-Q3. |
| `media` (bytes) | `payload.media[].url` | Offline images/PDFs | product `checksum` changes |
| `productDetail` (online) | `/products/{id}` | Avoid refetching | `checksum` differs from the list's |
| `filterRail` (per category+filters) | `/categories/filters` | Rate-limit relief | **[I]** short TTL (session/minutes) — counts are result-set-dependent and go stale fast |

**[I]** Do **not** persist `/products` list pages long-term. They are cheap to refetch, depend on many parameters, and the offline store is the durable copy.

### 17.4 Deliberately NOT stored

- Any locale preference sent to the API — **there is no locale parameter**. Localisation is entirely client-side.
- Any derived form of `manifestChecksum` — it is opaque (§7.2).
- Any reconstruction of typed facet values from the offline payload — the data is rendered strings, not typed rows (§14.8).

---

## 18. Recommended Flutter Integration Architecture

Derived strictly from the contract above. **No implementation is provided here** — this defines what the layers must handle.

```text
Presentation  (Bloc/Cubit per screen: CategoryBrowse, ProductList, ProductDetail, Search, Sync)
      ↓
Repository    (CatalogRepository — the ONLY layer that decides online vs offline)
      ↓                          ↘
Remote Data Source          Local Data Source
(CatalogRemoteDataSource)   (Drift/Isar: products, categories, attributes, syncState)
      ↓
ApiClient  (Dio + interceptors)
      ↓
Backend
```

### 18.1 `ApiClient`

- `baseUrl = {host}/api/v1`.
- **Auth interceptor** — attaches `Authorization` + `X-Device-Id` to every request.
- **Refresh interceptor** — ⚠️ **single-flight mutex, mandatory** (§3.3/§15.5). Queue concurrent 401s; one refresh; replay all. Never retry a failed refresh.
- **Query flattener** — converts `Map<String,String> attr` into `attr[KEY]=value` pairs (§4.3).
- **Boolean serialiser** — emits exactly `true`/`false` (§4.2).
- **Error mapper** — parses the error envelope into a typed `ApiException(code, statusCode, message, correlationId)`. **Branch on `error.code`, never on `message`** — except the two 403 lockdowns.
- **Cancellation** — `CancelToken` per screen; cancel superseded filter/search requests.

### 18.2 DTO layer — three product shapes

**[C]** Required by §8.9:

| DTO | Source |
| --- | --- |
| `ProductListItemDto` | `data.items[]` |
| `ProductDetailDto` | `data` |
| `OfflineProductPayloadDto` | `data.changed[].payload` |

⚠️ Do not attempt one DTO. `highlights` means different things in the online and offline shapes, `media` loses `id` offline, and `status` is an enum online and a bare string offline. Map all three into **one domain `Product` entity** so the UI is source-agnostic.

**Two response wrappers** (§5.2): `ApiResponse<T>` (reads `data`) and `PaginatedProductResponse` (reads `data.items` + `data.total`). **[I]** Make the latter tolerant of a future top-level `pagination` — see §21-Q1.

### 18.3 `CatalogRepository` — the online/offline decision point

Responsibilities:
- Choose online vs local per call based on connectivity **and** cache freshness.
- Run the sync algorithm (§14.4) inside **one local transaction**.
- Expose `SyncState` (`idle | checking | syncing(progress) | upToDate | unavailable | failed`) — `itemCount` from `/catalog/version` gives a real progress denominator.
- **Never** expose HTTP concerns upward; map `ApiException` → domain failures.
- Enforce: **filters and facet counts are online-only** (§14.8). Offline, the rail must be hidden, not faked.

### 18.4 Pagination handling

Two separate mechanisms, two separate helpers (§13). Do not generalise them. The product paginator resets on **any** parameter change; the sync paginator terminates **only** on `complete: true`.

### 18.5 Filter handling

- Model a filter as `(code, strategy, type, options|range, unit, truncated)`.
- **Widget selection switches on `strategy`.**
- Selected values are stored as the **exact `option.code` strings received** — never re-derived, never re-escaped.
- Serialise a selection set as `attr[CODE]=code1,code2` (join with `,`; the parts are already escaped).
- Re-fetch the rail after every applied filter — options and ranges narrow (BR-15).

### 18.6 Cache handling

Key the media cache on URL; key detail caches on `checksum` (BR-12). Persist three separate bundles (§14.8).

### 18.7 Error handling

One `ApiException` hierarchy keyed on `error.code`, plus a `correlationId` carried into every log line and crash report.

---

## 19. Error Handling Strategy

### 19.1 `401` — decide by `error.code`, not by the status

| `error.code` | Meaning | Refresh? | Retry? | Logout? |
| --- | --- | --- | --- | --- |
| `HTTP_EXCEPTION` (`message: "Unauthorized"`) | Expired/malformed JWT | **Yes** (single-flight) | Yes, once after refresh | Only if refresh fails |
| `AUTH_TOKEN_REVOKED` | Blacklisted (logout / password change / forced logout / rotation) | **[I]** Try once — the refresh token may still be live | Once | If refresh fails |
| `DEVICE_ID_MISMATCH` | Header ≠ token device | **No** — refresh will fail identically | No | **[I]** Yes. Re-authenticate with the persisted `deviceId`. Never regenerate it. |
| `AUTH_TOKEN_NOT_FOUND` | No `Authorization` header | No | No | Client bug — fix the interceptor |
| `AUTH_INVALID_TOKEN_TYPE` | Refresh token used as Bearer | No | No | Client bug |
| `AUTH_USER_NOT_FOUND` | Subject deleted | No | No | **Yes**, clear everything |
| `AUTH_USER_NOT_ACTIVE` | Suspended / banned / pending approval | No | No | **Yes**, with an explanatory message |

⚠️ **Single-flight refresh is mandatory.** `AUTH_INVALID_REFRESH_TOKEN` from a concurrent refresh terminates every session on every device.

### 19.2 `403` — never a role problem on this surface

**[C]** Every catalogue endpoint is `REPRESENTATIVE`+, so **no authenticated user can be role-rejected here.** A 403 from a catalogue route is always a **scope lockdown** (§3.4).

| Signal | Meaning | Action |
| --- | --- | --- |
| `error.code: "HTTP_EXCEPTION"` + message contains `Two-factor authentication setup is required` | 2FA setup pending | Navigate to 2FA setup. **Do not log out.** |
| `error.code: "HTTP_EXCEPTION"` + message contains `You must change your temporary password` | Provisioned account | Navigate to change-password. **Do not log out.** |
| `error.code: "Forbidden"` | `RolesGuard` rejection | **[I]** Unreachable on catalogue routes. If seen, treat as a server-side change — log the `correlationId` and show a generic error. |

**Retrying a 403 never helps.** Resolve the lockdown first.

### 19.3 `400` — split into two families

| Family | Codes | Recoverable client-side? |
| --- | --- | --- |
| **Client bug** | `VALIDATION_ERROR` | No. Do not retry. Log with `correlationId`; show a generic error. Caused by `limit > 100`, `page < 1`, a bad enum, a non-boolean flag, or an **unknown query param**. |
| **Stale filter state** | `CATALOG_UNKNOWN_FILTER_ATTRIBUTE`, `CATALOG_INVALID_FILTER_VALUE` | **Yes.** The rail the client holds no longer matches the vocabulary. |

**[I] Recovery for the second family:**
1. Drop the offending filter (`message` names the attribute code — for a toast only; **parse nothing out of it**).
2. Retry **once** without it.
3. Re-fetch `/categories/filters` to rebuild the rail.
4. Tell the user a filter was removed.

⚠️ Bound the retry to one attempt. A retry loop against a genuine client bug will hit the rate limit in seconds.

### 19.4 `429` — the catalogue's real risk

**[C]** 30 requests / 60 s per user, shared across all endpoints.

**[I] Required mitigations, in priority order:**
1. **Debounce** search (≥ 300 ms) and filter changes (≥ 300 ms); require ≥ 2 chars before calling `suggest`.
2. **Cancel** superseded in-flight requests (`CancelToken`).
3. **Cache** `/categories` and `/catalog/attributes` for the session — they change rarely and have no per-request variance.
4. **Sync at `limit=250`** (5 requests instead of 11) and never concurrently with browsing.
5. On 429: exponential backoff starting at ~2 s, jittered, **max 3 attempts**. During sync, **resume from the same cursor** — never restart.
6. UI: a non-blocking "slow down" indicator, not an error dialog. Never surface a 429 as a failure during background sync.

**REQUIRES BACKEND CONFIRMATION:** whether `Retry-After` is present. If it is, honour it in preference to your backoff curve.

### 19.5 `404`

| Endpoint | Meaning | Action |
| --- | --- | --- |
| `/products/{idOrSlug}` | Unknown, deleted, **or unpublished** (indistinguishable, BR-4) | Show not-found. **Purge the local row** if it came from cache. Do not retry. |
| `/categories/{idOrSlug}` | Unknown category | Clear the selection; re-fetch the tree. |
| `/products?category=` or `/categories/filters?category=` | Unresolvable `category` | Clear the category filter; re-fetch the tree; retry unscoped. |

### 19.6 `503 CATALOG_NO_PUBLISHED_VERSION`

**[C]** Server-state, not client error, and transient.

**[I] Action:** keep every cache intact; if an offline copy exists, serve it and show "last synced"; otherwise show "catalogue not available yet". Offer manual retry. **Never** log out, **never** clear the cache, **never** aggressive-retry (it burns the 30/60 s budget).

### 19.7 `500` and transport errors

**[I]** Exponential backoff, max 3 attempts, then surface a generic error with the `correlationId` visible/copyable. **[C]** A 500 from a catalogue route is a genuine unhandled fault — the domain filter maps every anticipated condition to 4xx/503 — so it is always worth reporting.

### 19.8 Offline / no connectivity

**[I]** Do not surface a network error while an offline copy exists. Serve local data, show "last synced", and queue nothing (this surface is read-only — there is nothing to replay).

---

## 20. Flutter Implementation Checklist

### Authentication & transport
- [ ] Base URL `{host}/api/v1`.
- [ ] Attach `Authorization: Bearer …` to all nine endpoints.
- [ ] Attach `X-Device-Id` to all nine endpoints; persist `deviceId` forever; never regenerate.
- [ ] **Single-flight refresh mutex** with a request queue (§3.3). ⚠️ Highest risk.
- [ ] `POST /auth/refresh` sends **no** `Authorization` header, **does** send `X-Device-Id`.
- [ ] Never retry a failed refresh with the same token.
- [ ] Handle `AUTH_INVALID_REFRESH_TOKEN` → clear tokens, keep catalogue cache, go to login.
- [ ] Handle the two 403 lockdowns by **message** (§3.4).
- [ ] Log `meta.correlationId` on every error.

### Request encoding
- [ ] Flatten `attr` into `attr[CODE]=value` (Dio does not do this).
- [ ] Serialise booleans as exactly `true` / `false`.
- [ ] Never append unknown query params (400 on 7 of 9 endpoints).
- [ ] Clamp `limit` client-side: products ≤ 100, suggest ≤ 25, sync ≤ 250.

### Response parsing
- [ ] `ApiResponse<T>` reading `data` for 8 endpoints.
- [ ] **Separate wrapper for `GET /products`** reading `data.items` / `data.total` / `data.page` / `data.limit` / `data.totalPages` (§5.2). ⚠️
- [ ] Three product DTOs; one domain entity (§8.9). ⚠️
- [ ] `Localized` with nullable `en`, non-null `ar`, and an `ar` fallback for English UI.
- [ ] Defensive enum parsing with an `unknown` fallback everywhere.
- [ ] Handle `category: null` and `breadcrumb: []` (unfiled products).
- [ ] Handle `primaryImage: null` and `thumbnailUrl: null`.

### Catalogue
- [ ] `GET /catalog/version` on launch + (debounced) resume.
- [ ] `GET /catalog/attributes` cached; treat as versionless (§21-Q3).
- [ ] `GET /categories?tree=true` cached separately from the sync payload.
- [ ] `GET /categories/{idOrSlug}` for deep links (note: `?parentId=` takes **ids only**).
- [ ] `GET /categories/filters` with the **same** params as `/products`.
- [ ] `GET /products` with page reset on every parameter change.
- [ ] `GET /products/suggest` gated at ≥ 2 chars + debounced.
- [ ] `GET /products/{idOrSlug}` handling `status == DISCONTINUED` with a banner (BR-2).

### Filtering
- [ ] **Switch on `strategy`, not `type`.** ⚠️
- [ ] `DISCRETE` → checkboxes from `options[]`; show a search box when `truncated == true`.
- [ ] `RANGE` → slider from `range.min`/`range.max`; emit `lo..hi`.
- [ ] Send `option.code` **verbatim** — never re-derive, never re-escape, never rewrite `65~65` as `65`. ⚠️
- [ ] Join multi-select with `,`.
- [ ] Re-fetch the rail after every filter change.
- [ ] Never hard-code a rail (3–14 filters depending on category).
- [ ] Display `filters[].count` and `options[].count` as-is; never sum them.

### Search
- [ ] Require ≥ 2 characters **after trimming**; do not present an unfiltered list as a search result.
- [ ] Do not promise typo tolerance (§11.4). ⚠️
- [ ] Explain in the empty state that spec values are not searchable — direct users to filters.
- [ ] `sort` defaults to `relevance` with `q`, `name` without.

### Offline / sync
- [ ] Compare `manifestChecksum`; sync only on change.
- [ ] Loop on `nextCursor` until **`complete == true`** — not until `changed` is empty. ⚠️
- [ ] Apply `removed` **only** after the final page. ⚠️
- [ ] Commit payloads + `toVersion` + `manifestChecksum` in **one** local transaction. ⚠️
- [ ] Store `page.toVersion` (not the version seen at step 1).
- [ ] Guard `toVersion == 0` (nothing published) — never store it. ⚠️
- [ ] Use `limit=250`; back off and **resume from the same cursor** on 429.
- [ ] Prefetch media after commit; images before datasheets.
- [ ] Persist and display `lastSyncedAt` (BR-11).
- [ ] Cache all **three** bundles: sync payloads + categories + attributes. ⚠️
- [ ] Offline: hide the filter rail and facet counts — they cannot be computed locally. ⚠️
- [ ] Port `normalizeText` **verbatim** to Dart for offline search.

### Business rules
- [ ] Never hide a product because `isAvailable == false` (BR-6).
- [ ] Never present a category count as a result total (BR-8).
- [ ] Exclude `DATASHEET` media from image galleries.
- [ ] Render `specSheet` in array order; handle `code == null` (extra specs).
- [ ] Display `highlights[].display` and `specSheet[].value` as-is — already formatted.
- [ ] Two breadcrumb conventions — normalise (§7.9).

### Errors
- [ ] Branch on `error.code`, never on `message` (except the 403 lockdowns).
- [ ] 503 → keep cache, show "catalogue unavailable", offer retry, never log out.
- [ ] `CATALOG_UNKNOWN_FILTER_ATTRIBUTE` / `CATALOG_INVALID_FILTER_VALUE` → drop filter, retry **once**, refresh the rail.
- [ ] 429 → jittered backoff, max 3, non-blocking UI.
- [ ] 404 on detail → purge the cached row.

---

## 21. Backend Questions / Missing Information

Each item is blocking or risk-bearing for the mobile integration and **cannot be resolved from the source**.

### Q1 — `GET /products` response envelope is inconsistent with the rest of the API
**REQUIRES BACKEND CONFIRMATION.**
`ProductController.list` spreads `paginate()` into the return object, producing `{message, items, total, page, limit, totalPages}` with no `data` key. The interceptor's flat branch requires **both** `message` and `data`, so the payload is nested under `data` with `message: "Success"` at the top — and **no top-level `pagination`**, unlike `/territories` and `/projects` which build one explicitly.
**Ask:** is this intended, or a bug? If it will be fixed to `{message, data: items, pagination: {...}}`, the mobile client must ship tolerant parsing **now**. The admin routes (`/admin/catalog/products`, media-gap, coverage-gap) share the same shape, so a fix would change four endpoints at once.
**Impact:** high. Wrong assumption = the product list never parses.

### Q2 — Two different `manifestChecksum` algorithms exist
**REQUIRES BACKEND CONFIRMATION.**
`prisma-catalog.repository.ts:177-179` hashes `checksum` values joined by `\n`; `catalog-payload.builder.ts:96-108` hashes `productId:checksum` pairs. Only the first reaches clients today.
**Ask:** which is canonical, and is the served value guaranteed stable across backend refactors? If the served implementation is ever swapped, **every client would see a spurious change and re-sync the entire catalogue at once**.
**Impact:** medium (thundering-herd risk).

### Q3 — The attribute vocabulary has no version or checksum
**REQUIRES BACKEND CONFIRMATION.**
`GET /catalog/attributes` returns no version, no checksum and no `updatedAt`. `manifestChecksum` covers product payloads only, so an admin renaming an attribute label or adding an ENUM option produces **no observable signal** on any mobile-facing endpoint.
**Ask:** how should a client know its cached vocabulary is stale? Is a vocabulary checksum or `updatedAt` feasible?
**Interim [I]:** refresh the vocabulary whenever `manifestChecksum` changes, and on a periodic floor (e.g. daily). Both are guesses.
**Impact:** medium — a stale vocabulary shows wrong labels offline, silently.

### Q4 — `SuggestionView.kind` declares `'CATEGORY'` but nothing emits it
**REQUIRES BACKEND CONFIRMATION.**
`prisma-catalog.repository.ts:1045` hard-codes `'PRODUCT'`. No code path produces `'CATEGORY'`.
**Ask:** is category suggestion planned? If yes, mobile should build for it now (the union is already in the contract). If no, the variant should be removed.
**Impact:** low, but it determines whether the suggestion UI needs a type switch.

### Q5 — Search is documented as "typo-tolerant" but is not
**REQUIRES BACKEND CONFIRMATION.**
`ListProductsQueryDto.q` says *"Arabic-normalised and typo-tolerant"*. The implementation is `contains` (substring) over a pre-normalised column. No `similarity()`, no `%` operator, no distance threshold exists in the read path. The trigram GIN index accelerates `LIKE`; it does not make matching fuzzy.
**Ask:** was fuzzy matching intended and dropped, or is the description wrong? Is `pg_trgm` similarity planned?
**Impact:** medium — it directly affects what the search UI may promise and what QA will file as bugs.

### Q6 — `page` beyond the last page is unspecified
**REQUIRES BACKEND CONFIRMATION.**
No explicit handling for `?page=999` on a 6-page result. **[I]** Prisma `skip` past the end yields `[]`, so a `200` with `items: []` and a non-zero `total` is expected — but this is inferred, not verified.
**Ask:** confirm, or add an explicit bound.
**Impact:** low (defensive infinite-scroll handles it), but worth one test.

### Q7 — `429` `Retry-After` presence is unverified
**REQUIRES BACKEND CONFIRMATION.**
`@nestjs/throttler` typically emits `Retry-After`, but nothing in this repository sets, customises or asserts it.
**Ask:** confirm the header is present and its unit.
**Impact:** low-medium — decides whether backoff can be server-driven.

### Q8 — Media URL immutability is not guaranteed
**REQUIRES BACKEND CONFIRMATION.**
`payloadChecksum` hashes the payload including the media **URL string**, not the bytes behind it. If an admin re-uploads an image to the same URL, the checksum does not change and a URL-keyed client cache will serve stale bytes forever.
**Ask:** does the media pipeline (S3/Cloudinary) guarantee a new URL per upload?
**Impact:** medium for offline UX.

### Q9 — Rate limit vs. real catalogue usage
**REQUIRES BACKEND CONFIRMATION.**
30 req/60 s shared across all endpoints. One category interaction = 2 requests; a full sync at `limit=100` = 11; a typeahead session can consume the whole budget alone.
**Ask:** should catalogue read routes get a higher `@Throttle` override, or `/catalog/sync` be exempted? Mobile can mitigate but cannot eliminate this.
**Impact:** high for field usability on first launch.

### Q10 — Drift is invisible to mobile
**REQUIRES BACKEND CONFIRMATION.**
Edits to already-published products go live online but not offline until the next publish (BR-11). Drift is exposed only to admins. A rep with an offline copy can see values that disagree with the online API, with no signal on either side.
**Ask:** is this accepted operationally? Is there an intended publish cadence a client can surface ("data as of …")?
**Impact:** medium — affects trust in offline data; `lastSyncedAt` is the only mitigation available client-side.

### Q11 — `parentId` accepts ids only, silently
**REQUIRES BACKEND CONFIRMATION.**
`GET /categories?parentId=<slug>` returns `[]` rather than 404 or 400, while every other category parameter accepts id **or** slug.
**Ask:** should `parentId` resolve slugs for consistency?
**Impact:** low, but a silent empty result is an easy client bug.

### Q12 — No catalogue endpoint appears in the Postman collection
**Observation, not a blocker.** `postman/newpower API.postman_collection.json` contains no `/catalog`, `/categories` or `/products` requests, so there are no request/response examples or tests to validate against. Every example in this document is derived from the **source types**, not from a captured response.
**Ask:** can the collection be extended with the nine catalogue routes? It would let mobile validate parsing against real payloads before the integration is written.
**Impact:** medium for verification confidence — especially for Q1.

---

## Appendix A — Endpoint quick reference

| # | Method | Path | Auth | 503? | Pagination | Key params |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | GET | `/catalog/attributes` | Bearer + Device | No | — | *(none)* |
| 2 | GET | `/catalog/version` | Bearer + Device | **Yes** | — | *(none)* |
| 3 | GET | `/catalog/sync` | Bearer + Device | No (`toVersion: 0`) | **cursor** | `since`, `cursor`, `limit`≤250 |
| 4 | GET | `/categories` | Bearer + Device | No | — | `tree`, `parentId` *(id only)* |
| 5 | GET | `/categories/filters` | Bearer + Device | **Yes** | — | `category`, `includeSubtree`, `attr`, `q` |
| 6 | GET | `/categories/{idOrSlug}` | Bearer + Device | No | — | — |
| 7 | GET | `/products` | Bearer + Device | **Yes** | **page** ⚠️ nested envelope | `page`, `limit`≤100, `q`, `category`, `includeSubtree`, `attr`, `sort`, `reportingCategory`, `hasDatasheet`, `available` |
| 8 | GET | `/products/suggest` | Bearer + Device | No (`[]`) | — | `q`, `limit`≤25 |
| 9 | GET | `/products/{idOrSlug}` | Bearer + Device | **Yes** | — | — |

## Appendix B — The seven things most likely to be got wrong

1. **`GET /products` nests its payload under `data` with `message: "Success"` and has no `pagination` object** (§5.2).
2. **Filter controls switch on `strategy`, not `type`** (§12.2).
3. **`65~65` (identity) and `65` (overlap) are different queries** — send `option.code` verbatim (§12.4).
4. **Sync stops on `complete: true`, not on an empty `changed`** (§13.2, §14.4).
5. **`removed` applies only after the final page** (§14.4).
6. **The refresh interceptor must be single-flight** or a parallel 401 logs the rep out everywhere (§3.3).
7. **`highlights` means different things online and offline** — three product DTOs, one entity (§8.9).
