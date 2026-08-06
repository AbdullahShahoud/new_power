# Project module — frontend client reference

Complete request/query/body/response contract for `/projects`, `/activities`,
`/outcomes` and `/reports`, with every DTO validation rule and every workflow.

Generated from the source of truth: [`src/project`](../../src/project).

| Companion document | What it gives you |
| --- | --- |
| [README.md](README.md) | Base URL, `X-Device-Id`, auth headers, role hierarchy — shared by all modules |
| [projects.md](projects.md) | The *why* behind each rule — read it once, then work from this file |
| [directory.md](directory.md) | `/projects/{id}/stakeholders`, `/projects/{id}/decision-maker`, `/accounts/*` |

> **Convention in this document.** "Required" means the server rejects the request
> without it. "Optional" means you may omit the key entirely. "Nullable" means you
> may send an explicit `null`, and that `null` has a defined meaning (usually
> *clear this field*) — omitting the key is **not** the same thing.

---

## Table of contents

1. [Transport conventions](#1-transport-conventions)
2. [Roles and permissions](#2-roles-and-permissions)
3. [Enumerations](#3-enumerations)
4. [Shared request objects](#4-shared-request-objects)
5. [Endpoint reference — Projects](#5-endpoint-reference--projects)
6. [Endpoint reference — Activities](#6-endpoint-reference--activities)
7. [Endpoint reference — Outcomes](#7-endpoint-reference--outcomes)
8. [Endpoint reference — Reports](#8-endpoint-reference--reports)
9. [Response object reference](#9-response-object-reference)
10. [Workflows](#10-workflows)
11. [Error codes](#11-error-codes)
12. [Known issues](#12-known-issues)

---

## 1. Transport conventions

### 1.1 Base URL and headers

```
{host}/api/v1
```

Every path below is relative to that prefix — `POST /projects` means
`POST {host}/api/v1/projects`.

| Header | Required | Notes |
| --- | --- | --- |
| `Authorization: Bearer <accessToken>` | Yes, every route in this document | — |
| `X-Device-Id: <deviceId>` | Yes, every route in this document | Must equal the `deviceId` claim in the token, or `401 DEVICE_ID_MISMATCH` |
| `Content-Type: application/json` | On any request with a body | `POST /files` uses `multipart/form-data` instead |

There are **no public routes** in this module, and none anywhere else you will
touch from a project screen. File bytes are fetched straight from Cloudinary with
the signed `url` on every file object — see
[Workflow 11](#workflow-11--reading-a-file-whose-url-has-expired).

### 1.2 Success envelope

Every 2xx response is wrapped by the global response interceptor:

```json
{
  "success": true,
  "message": "Project retrieved successfully",
  "data": { "…": "…" },
  "meta": {
    "timestamp": "2026-08-05T09:12:03.114Z",
    "path": "/api/v1/projects/2b7c…",
    "correlationId": "0f9a…"
  }
}
```

`data` is the payload. Read `message` for a toast if you like, but **never branch
on it** — branch on `error.code` for failures and on the payload for success.

### 1.3 Pagination envelope

List routes add a sibling `pagination` object. It is **not** inside `data`:

```json
{
  "success": true,
  "message": "Projects retrieved successfully",
  "data": [ { "…": "…" } ],
  "pagination": { "total": 128, "page": 1, "limit": 20, "totalPages": 7 },
  "meta": { "…": "…" }
}
```

`page` and `limit` are echoed back exactly as applied, so a client that sent
nothing sees the defaults (`page: 1`, `limit: 20`).

Two routes are **not** paginated and return a bare array in `data`:
`GET /projects/needs-attention` and `POST /projects/{id}/images`.

### 1.4 The nested-message shape

One route in this module returns no payload:
`DELETE /projects/{id}/images/{imageId}`. Because the handler returns only a
message, the interceptor wraps it as data:

```json
{
  "success": true,
  "message": "Success",
  "data": { "message": "Project photo removed successfully" },
  "meta": { "…": "…" }
}
```

Read the string from `data.message`, not the top-level `message`.

### 1.5 Error envelope

Every 4xx/5xx has the same shape, whether it came from validation, from a guard,
or from the project domain:

```json
{
  "success": false,
  "message": "This project changed since you last loaded it. Refresh and reapply your edit.",
  "error": { "code": "PROJECT_VERSION_CONFLICT", "statusCode": 409 },
  "meta": {
    "timestamp": "2026-08-05T09:12:03.114Z",
    "path": "/api/v1/projects/2b7c…",
    "correlationId": "0f9a…"
  }
}
```

**`error.code` is the stable contract.** The full list is in
[§11](#11-error-codes). `message` is human-readable Arabic/English prose that may
be reworded; do not parse it.

### 1.6 Request validation — read this before you build a form

A global `ValidationPipe` runs with `whitelist: true`,
`forbidNonWhitelisted: true`, `transform: true` and
`enableImplicitConversion: true`. In practice:

| Behaviour | Consequence for you |
| --- | --- |
| **Unknown properties are rejected** | Sending a field this document does not list is a `400`, not a silently ignored key. Strip your view-model fields before POSTing. |
| **Types are coerced** | `"20"` is accepted where a number is expected; `"true"`/`"false"` where a boolean is expected; an ISO-8601 string where a `Date` is expected. |
| **Strings are trimmed** | `name`, `description`, `notes`, `addressLine`, `caption`, `reason`, `note`, `narrative`, `clientRef` are trimmed **before** the length check. `"  ok  "` is 2 characters, not 6. |
| **Only the first error is returned** | A validation failure produces `error.code: "VALIDATION_ERROR"` and `message` set to the **first** failing rule only. You cannot render a full field-error map from one round trip — validate client-side. |

A validation failure looks like this:

```json
{
  "success": false,
  "message": "notes must be longer than or equal to 20 characters",
  "error": { "code": "VALIDATION_ERROR", "statusCode": 400 },
  "meta": { "…": "…" }
}
```

### 1.7 A representative never sees who did what

Responses from `/projects/*`, `/activities/*` and `/outcomes/*` pass through a
redaction interceptor. **For a `REPRESENTATIVE`, every key ending in `By` or
`ByUser` is removed at every depth of the payload.** For `SALES_MANAGER` and
above they are present.

Fields that disappear for a rep:

`createdBy` · `createdByUser` · `changedBy` · `changedByUser` · `closedBy` ·
`uploadedBy` · `uploadedByUser` · `submittedBy` · `submittedByUser` ·
`confirmedBy` · `confirmedByUser` · `rejectedBy` · `rejectedByUser` ·
`revisedBy` · `revisedByUser` · `backdateApprovedBy`

Fields that **survive** for a rep, and that you should build the UI on:
`ownerId`, `owner`, `confirmedAt`, `rejectedAt`, `rejectionReason`, `submittedAt`,
`changedAt`, `revisedAt`, `editedAfterWindow`, `backdated`.

> **Build your TypeScript types with these keys optional.** A component that
> renders `activity.createdByUser.firstName` will crash on a rep's device and
> work on a manager's.

Report routes are not redacted — they are `SALES_MANAGER`+ only.

### 1.8 404, not 403

A representative asking for a project that is not theirs gets
**`404 PROJECT_NOT_FOUND`**, not `403`. "Not yours" and "not there" are
deliberately indistinguishable. The same applies to `/activities/{id}` and
`/outcomes/{id}`, which return their own not-found codes.

`403 PROJECT_NOT_ACCESSIBLE` means something narrower: you *can* read the row but
your role does not work deals (back office / GM attempting a write).

### 1.9 Optimistic concurrency

`ProjectView.version` is an integer that increments on every write. Three routes
accept an optional `expectedVersion`:

- `PATCH /projects/{id}`
- `PUT /projects/{id}/stage`
- `PUT /projects/{id}/status`

Send the `version` you last read. If the row moved on, you get
`409 PROJECT_VERSION_CONFLICT` instead of a silent overwrite. Omitting
`expectedVersion` disables the check — acceptable for a foreground edit made
seconds after a fetch, wrong for anything queued offline. See
[Workflow 9](#workflow-9--handling-a-version-conflict).

### 1.10 Data conventions

| Kind | Wire format | Notes |
| --- | --- | --- |
| Timestamps | ISO-8601 UTC string — `"2026-08-01T08:40:00.000Z"` | Serialized from `Date`. Accepted on input as any string `new Date()` parses. |
| Money | `number` + separate ISO-4217 `currency` string | Never a string. Max 2 decimal places on input. A currency is **required whenever an amount is present**. |
| Coordinates | `latitude` / `longitude` as decimal-degree numbers, WGS-84 | Sent nested as `location: { lat, lng }`; returned flat as `latitude` / `longitude`. |
| Ids | UUID strings | `personsMet[]` must be **UUID v4** specifically. |
| Distances | metres, integer or float | `distanceM`, `exifDistanceM`, `accuracyM`, `radiusM` |

---

## 2. Roles and permissions

Access is decided in **two layers**, and you need both to build the UI correctly.
Layer 1 is a coarse route gate; layer 2 is the real control and is per-project.

### 2.1 The hierarchy

```
REPRESENTATIVE (1)  <  SALES_MANAGER (2)  <  SALES_ADMIN (3)  <  GENERAL_MANAGER (4)
```

Everything is compared **by rank**, never by equality — except the two
supervisory acts in [§2.3](#23-layer-2--per-project-authorization), which are
`SALES_MANAGER` *exactly*.

The caller's role is on their JWT; read it once at login and drive the UI from it.

### 2.2 Layer 1 — the route gate

Enforced by a global guard **before** the handler runs. Failing it produces a
plain `403` from the guard with no project-specific error code.

| Route | Minimum role |
| --- | --- |
| Everything under `/projects/*`, `/activities/*`, `/outcomes/*` | `REPRESENTATIVE` |
| `PUT /projects/{id}/location` | `SALES_MANAGER` |
| `POST /outcomes/{id}/confirm` | `SALES_MANAGER` |
| Everything under `/reports/*` | `SALES_MANAGER` |

The gate is deliberately **low** on the project routes: a project is a rep's own
work and almost every route on it is theirs to use.

### 2.3 Layer 2 — per-project authorization

Three predicates run inside the handlers. Learn these three and every row of the
matrix below follows.

| Predicate | Passes for | Fails with |
| --- | --- | --- |
| **View** | the owner · a `SALES_MANAGER` whose team contains the owner · any `SALES_ADMIN` or `GENERAL_MANAGER` | `404 PROJECT_NOT_FOUND` — never 403 |
| **Work** (any write) | the owner · a `SALES_MANAGER` whose team contains the owner | `403 PROJECT_NOT_ACCESSIBLE` for `SALES_ADMIN`/`GENERAL_MANAGER` (they can already read it, so there is nothing to hide) · `404 PROJECT_NOT_FOUND` for everyone else |
| **Supervise** | **`SALES_MANAGER` only** | `403` — see the trap below |

> ⚠️ **The trap: "Supervise" is `SALES_MANAGER` exactly, not `SALES_MANAGER`+.**
> `SALES_ADMIN` and `GENERAL_MANAGER` **outrank** a manager and are still refused.
> They read the pipeline and do not work it — which is what makes the reports mean
> something. This applies to `PUT /projects/{id}/location`
> (`PROJECT_LOCATION_REQUIRES_MANAGER`) and `POST /outcomes/{id}/confirm`
> (`PROJECT_CONFIRMATION_REQUIRES_MANAGER`). Both pass the layer-1 gate and then
> fail in the handler.

### 2.4 List scoping

Every list applies the caller's scope **inside the query**, not to the page — so
`pagination.total` is honest for your role, and there is no "scope" parameter to
send.

| Role | `GET /projects` · `/activities` · `/outcomes` · `needs-attention` · `/reports/*` |
| --- | --- |
| `REPRESENTATIVE` | own only |
| `SALES_MANAGER` | own **plus** their direct team's |
| `SALES_ADMIN` | everything |
| `GENERAL_MANAGER` | everything |

A manager's *own* projects are included deliberately: a manager who registers a
building they were shown must still see it.

### 2.5 Full permission matrix

`own` = projects the caller owns · `team` = projects owned by the caller's direct
reports.

| Action | Endpoint | `REPRESENTATIVE` | `SALES_MANAGER` | `SALES_ADMIN` | `GENERAL_MANAGER` |
| --- | --- | --- | --- | --- | --- |
| Register a building | `POST /projects` | ✔ inside own territory | ✔ any territory | ✖ `403` | ✖ `403` |
| List projects | `GET /projects` | own | own + team | all | all |
| **Nearby buildings** | `GET /projects/nearby` | **all**, narrow projection | **all**, narrow projection | all | all |
| Read one project | `GET /projects/{id}` | own | own + team | all | all |
| Edit the card | `PATCH /projects/{id}` | own | own + team | ✖ `403` | ✖ `403` |
| Change stage | `PUT …/stage` | own | own + team | ✖ `403` | ✖ `403` |
| Reopen from `WON`/`LOST` | `PUT …/stage` | ✖ `403` | ✔ **+ note** | ✖ | ✖ |
| Change status | `PUT …/status` | own | own + team | ✖ `403` | ✖ `403` |
| Revive from `CANCELLED` | `PUT …/status` | ✖ **`404`** | ✔ | ✖ | ✖ |
| Move the location | `PUT …/location` | ✖ `403` (gate) | ✔ **+ reason** | ✖ `403` | ✖ `403` |
| Read history | `GET …/history` | own | own + team | all | all |
| Add / remove photos | `POST`,`DELETE …/images` | own | own + team | ✖ `403` | ✖ `403` |
| Attention list | `GET /projects/needs-attention` | own | own + team | all | all |
| Log an activity | `POST …/activities` | own | own + team | ✖ `403` | ✖ `403` |
| Backdate > 48 h | `POST …/activities` | ✖ `403` | ✔ | n/a | n/a |
| Sync a batch | `POST /activities/sync` | own | own + team | ✖ per item | ✖ per item |
| List / read activities | `GET /activities…` | own | own + team | all | all |
| **Edit an activity** | `PATCH /activities/{id}` | **author only** | **author only** | **author only** | **author only** |
| Submit won / lost | `POST …/won`, `…/lost` | own | own + team | ✖ `403` | ✖ `403` |
| List / read outcomes | `GET /outcomes…` | own | own + team | all | all |
| **Confirm an outcome** | `POST /outcomes/{id}/confirm` | ✖ `403` | ✔ **but not their own** | ✖ `403` | ✖ `403` |
| Reject an outcome | `POST /outcomes/{id}/reject` | ✔ **own submission only** (withdraw) | ✔ team + own submission | ✖ `403` | ✖ `403` |
| Any report | `GET /reports/*` | ✖ `403` (gate) | ✔ team | ✔ all | ✔ all |

**Four rules that are not rank-based and will surprise you:**

1. **`PATCH /activities/{id}` is author-only, at every rank.** A manager who
   disagrees with a rep's record cannot rewrite it — that is what the revision
   trail is for.
2. **A manager cannot confirm an outcome they submitted themselves.** The only
   four-eyes rule in the system.
3. **The submitter — including a representative — may reject their own
   submission.** Label that button *Withdraw*, not *Reject*.
4. **Reviving a `CANCELLED` project as a rep returns `404 PROJECT_NOT_FOUND`,
   not `403`.** Do not show the revive control below `SALES_MANAGER`.

### 2.6 What to hide, and what to let fail

| Hide in the UI (never let the user hit it) | Because |
| --- | --- |
| The whole reports area, below `SALES_MANAGER` | Guard `403`, no useful code to render |
| *Move location*, below `SALES_MANAGER` **and** above it | `SALES_ADMIN`/`GM` are refused too |
| *Confirm* on your own submission, and for everyone but `SALES_MANAGER` | `PROJECT_OUTCOME_SELF_CONFIRMATION` is not a message to show a manager |
| *Reopen* / *Revive*, below `SALES_MANAGER` | One returns `403`, the other `404` |
| *Edit activity* when `createdBy !== me` | Author-only |
| Every write control, for `SALES_ADMIN` and `GENERAL_MANAGER` | They read the pipeline; they do not work it |

| Let it fail and render the error | Because |
| --- | --- |
| `PROJECT_OUTSIDE_OWN_TERRITORY` | You cannot know the territory boundaries client-side |
| `PROJECT_VERSION_CONFLICT` | Inherently a race |
| `PROJECT_NOT_FOUND` on a stale link | Ambiguous on purpose — treat it as "gone" |

> **A representative cannot determine `createdBy` from the response** — it is
> redacted ([§1.7](#17-a-representative-never-sees-who-did-what)). Track authorship
> from the id returned when *they* created the activity, or from the fact that a
> rep's own feed (`GET /activities` without `createdBy`) contains only their own
> work.

---

## 3. Enumerations

Every enum value the module accepts or returns. These are exact — the validators
are `@IsEnum`, so anything else is a `400 VALIDATION_ERROR`.

### `ProjectStage`

```
LEAD · QUALIFIED · ENGAGEMENT · APPROVAL · BOQ_RECEIVED · QUOTE_ISSUED · COMMITTED · WON · LOST
```

Funnel order is exactly the order above. `WON` and `LOST` are terminal and
**cannot be set through `PUT /projects/{id}/stage`** — they arrive only from a
confirmed outcome.

### `ProjectStatus`

```
ACTIVE · DORMANT · CANCELLED
```

Orthogonal to stage. `CANCELLED` means *nobody won* and is excluded from win
rate — it is not a loss.

### `BuildingType`

```
APARTMENT_BUILDING · VILLA · RESIDENTIAL_COMPLEX · COMMERCIAL · MIXED_USE ·
INDUSTRIAL · HOSPITALITY · HEALTHCARE · EDUCATIONAL · GOVERNMENT · RELIGIOUS ·
INFRASTRUCTURE · OTHER
```

### `ConstructionPhase`

```
PLANNING · EXCAVATION · FOUNDATION · STRUCTURE · BLOCKWORK ·
ELECTRICAL_ROUGH_IN · PLASTERING · FINISHING · ELECTRICAL_FIT_OUT · HANDOVER ·
COMPLETED
```

Listed in construction order. Set once at registration, then changed **only** by
`constructionPhaseObserved` on a `VISIT`.

### `StageChangeSource`

```
REP · MANAGER · OUTCOME_CONFIRMED · OUTCOME_REJECTED
```

Read-only, appears on history entries of `kind: "STAGE"`.

### `ActivityKind`

```
VISIT · COMMUNICATION
```

### `ActivityChannel`

```
PHONE_CALL · WHATSAPP · EMAIL · SMS · OTHER
```

Required for `COMMUNICATION`, refused on `VISIT`.

### `ActivityPurpose`

```
DISCOVERY · SAMPLES · CATALOG · QUANTITIES · PRICE_QUOTE · NEGOTIATION ·
FOLLOW_UP · GIFT · OTHER
```

### `ActivityOutcome`

```
PROGRESSING · NEEDS_ANOTHER_VISIT · WAITING_ON_THEM · AWAITING_QUANTITIES ·
COMPETITOR_ON_SITE · DECISION_IMMINENT · NO_ONE_PRESENT · WORK_STOPPED ·
TOO_EARLY_REVISIT_LATER
```

Three carry obligations your form must handle:

| Outcome | Obligation |
| --- | --- |
| `COMPETITOR_ON_SITE` | Offer a competitor picker. `competitorAccountId` may still be omitted for an honest unknown. |
| `TOO_EARLY_REVISIT_LATER` | `nextActionAt` becomes **required** (`ACTIVITY_NEXT_ACTION_REQUIRED`). |
| `WORK_STOPPED` | The response carries `data.suggestion: "SET_DORMANT"`. Offer the rep a "park this project" action — the server did **not** do it. |

### `AttentionReason`

```
FOLLOW_UP_DUE · AWAITING_THEM · STAGE_WITHOUT_EVIDENCE · NO_ACTIVITY
```

Returned in urgency order (the list is already sorted).

### `OutcomeType` / `OutcomeStatus`

```
OutcomeType   : WON · LOST
OutcomeStatus : PENDING · CONFIRMED · REJECTED
```

### `LossReason`

```
PRICE · PAYMENT_TERMS · AVAILABILITY · SPEC_MISMATCH · COMPETITOR_RELATIONSHIP ·
CONSULTANT_SPECIFIED_COMPETITOR · LATE_ENGAGEMENT · OUTLET_DID_NOT_STOCK · OTHER
```

`PRICE` makes `competitorPrice` required.

### `ProductCategory`

```
SOCKETS_SWITCHES · LIGHTING · EXHAUST_FANS · CABLES · DISTRIBUTION_BOARDS ·
CIRCUIT_BREAKERS · CONDUIT_TRUNKING · ACCESSORIES · OTHER
```

### `StakeholderRole`

```
OWNER · MAIN_CONTRACTOR · ELECTRICAL_MEP_SUBCONTRACTOR ·
CONSULTANT_ENGINEERING_OFFICE · PURCHASING_MANAGER · SITE_ELECTRICIAN ·
ELECTRICAL_ENGINEER · SITE_SUPERVISOR · OTHER
```

### `SyncItemStatus`

```
CREATED · DUPLICATE · REJECTED
```

### `WinLossGroupBy`

```
rep · territory · period
```

Lowercase — these are query-string values, not Prisma enums.

### `UserRole` (for the permission tables below)

```
REPRESENTATIVE (1) < SALES_MANAGER (2) < SALES_ADMIN (3) < GENERAL_MANAGER (4)
```

---

## 4. Shared request objects

### `LocationDto` — used by `POST /projects`, `PUT /projects/{id}/location`

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `lat` | number | **Yes** | Valid latitude (`-90 … 90`), decimal degrees |
| `lng` | number | **Yes** | Valid longitude (`-180 … 180`) |

```json
{ "lat": 33.50412, "lng": 36.24107 }
```

### `ActivityLocationDto` — used by activity logging

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `lat` | number | **Yes** | Valid latitude |
| `lng` | number | **Yes** | Valid longitude |
| `accuracyM` | integer | No | `≥ 0`. The phone's own accuracy estimate in metres. |

### `UploadedFileDto` — an activity attachment

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `key` | string | **Yes** | Non-empty, `≤ 255`. The key returned by `POST /files`. |
| `name` | string | **Yes** | Non-empty, `≤ 255`, trimmed. Display label, never a path. |

> `contentType` and `byteSize` are **not accepted**. They are read back from
> storage when the file is attached, so the record describes the object rather
> than repeating a client assertion.

### `ProjectFileRefDto` — a project photo (extends `UploadedFileDto`)

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `key` | string | **Yes** | Non-empty, `≤ 255` |
| `name` | string | **Yes** | Non-empty, `≤ 255`, trimmed |
| `caption` | string | No | `≤ 200`, trimmed |
| `exifLatitude` | number | No | Valid latitude. What *you* read from the photo's EXIF. |
| `exifLongitude` | number | No | Valid longitude |

EXIF stays client-supplied because only the client can read it. It is reported
against the pin as `exifDistanceM`, never enforced.

### `ProjectStakeholderRefDto` — a stakeholder at registration

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `accountId` | string | **Yes** | UUID |
| `role` | `StakeholderRole` | **Yes** | Enum |
| `primaryContactId` | string | No | UUID |
| `note` | string | No | `≤ 500`, trimmed |

### `PaginationQueryDto` — inherited by every paginated list

| Param | Type | Required | Rules | Default |
| --- | --- | --- | --- | --- |
| `page` | integer | No | `≥ 1` | `1` |
| `limit` | integer | No | `1 … 100` | `20` |

---

## 5. Endpoint reference — Projects

Route gate: `REPRESENTATIVE` on every route except `PUT …/location`. The real
control is per-project — see [§2.3](#23-layer-2--per-project-authorization).

| Method | Path | Gate | Effective access |
| --- | --- | --- | --- |
| `POST` | `/projects` | `REPRESENTATIVE` | Rep (own territory) · Manager (any territory). `SALES_ADMIN`/`GM` → `403` |
| `GET` | `/projects` | `REPRESENTATIVE` | Scoped: own / own+team / all |
| `GET` | `/projects/{id}` | `REPRESENTATIVE` | **View** predicate |
| `PATCH` | `/projects/{id}` | `REPRESENTATIVE` | **Work** predicate |
| `PUT` | `/projects/{id}/stage` | `REPRESENTATIVE` | **Work**; reopening needs `SALES_MANAGER` + note |
| `PUT` | `/projects/{id}/status` | `REPRESENTATIVE` | **Work**; reviving from `CANCELLED` needs `SALES_MANAGER` |
| `PUT` | `/projects/{id}/location` | **`SALES_MANAGER`** | **Supervise** — `SALES_MANAGER` **only**, admin/GM refused |
| `GET` | `/projects/{id}/history` | `REPRESENTATIVE` | **View** predicate |
| `POST` | `/projects/{id}/images` | `REPRESENTATIVE` | **Work** predicate |
| `DELETE` | `/projects/{id}/images/{imageId}` | `REPRESENTATIVE` | **Work** predicate |

---

### `POST /projects`

> **Role** — gate `REPRESENTATIVE`. A rep may register only inside **their own**
> territory; a `SALES_MANAGER` may register anywhere. `SALES_ADMIN` and
> `GENERAL_MANAGER` are refused with `403 PROJECT_NOT_ACCESSIBLE`. The new project
> is owned by the caller.

Register a building. Starts at `stage: LEAD`, `status: ACTIVE`, `version: 0`.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `name` | string | **Yes** | `3 … 200`, trimmed |
| `buildingType` | `BuildingType` | **Yes** | Enum |
| `description` | string | **Yes** | `10 … 2000`, trimmed |
| `location` | `LocationDto` | **Yes** | Nested object, validated |
| `constructionPhase` | `ConstructionPhase` | **Yes** | Enum |
| `files` | `ProjectFileRefDto[]` | **Yes** | **1 … 10 items**, each validated |
| `addressLine` | string | No | `≤ 500`, trimmed |
| `unitCount` | integer | No | `1 … 100000` |
| `estimatedValue` | number | No | `≥ 0`, max 2 decimal places |
| `currency` | string | **Conditional** | ISO-4217. **Required when `estimatedValue` is present**, ignored otherwise. |
| `stakeholders` | `ProjectStakeholderRefDto[]` | No | `≤ 20` items |
| `decisionMakerContactId` | string | No | UUID |
| `notes` | string | No | `≤ 2000`, trimmed |

```json
{
  "name": "برج الواحة السكني",
  "buildingType": "APARTMENT_BUILDING",
  "description": "برج 22 طابق على طريق المزة، المقاول الأمل.",
  "location": { "lat": 33.50412, "lng": 36.24107 },
  "addressLine": "طريق المزة، مقابل الإطفاء",
  "constructionPhase": "STRUCTURE",
  "files": [
    { "key": "files/image/2026-08-05/9a3e1c7f-…", "name": "north-elevation.jpg", "caption": "الواجهة الشمالية" }
  ],
  "unitCount": 44,
  "estimatedValue": 850000,
  "currency": "SAR",
  "stakeholders": [
    { "accountId": "0d1e…", "role": "MAIN_CONTRACTOR", "primaryContactId": "77a2…" },
    { "accountId": "5c8b…", "role": "SITE_ELECTRICIAN" }
  ],
  "decisionMakerContactId": "77a2…",
  "notes": "الاستشاري يطلب ملف تأهيل قبل التسعير."
}
```

**Response — `201 Created`**

`data` is a [`RegisterProjectResult`](#registerprojectresult):

```json
{
  "success": true,
  "message": "Project registered",
  "data": {
    "project": {
      "id": "2b7c…", "name": "برج الواحة السكني", "buildingType": "APARTMENT_BUILDING",
      "description": "…", "latitude": 33.50412, "longitude": 36.24107,
      "addressLine": "طريق المزة، مقابل الإطفاء",
      "territoryId": "8f01…",
      "territory": { "id": "8f01…", "name": "المزة", "code": "DAM-MAZ-86" },
      "outsideTerritory": false,
      "constructionPhase": "STRUCTURE", "stage": "LEAD", "status": "ACTIVE",
      "ownerId": "1a2b…",
      "owner": { "id": "1a2b…", "firstName": "خالد", "lastName": "…", "email": "…" },
      "unitCount": 44, "estimatedValue": 850000, "currency": "SAR",
      "notes": "…", "lastActivityAt": null, "nextActionAt": null,
      "closedAt": null, "closedBy": null, "version": 0,
      "createdBy": "1a2b…", "createdByUser": { "…": "…" },
      "createdAt": "2026-08-05T09:12:03.114Z", "updatedAt": "2026-08-05T09:12:03.114Z",
      "imageCount": 1, "activityCount": 0, "stakeholderCount": 2,
      "images": [
        {
          "id": "aa11…", "name": "north-elevation.jpg",
          "url": "https://…signed…", "urlExpiresAt": "2026-08-05T10:12:03.114Z",
          "contentType": "image/jpeg", "byteSize": 2847113,
          "caption": "الواجهة الشمالية",
          "exifLatitude": null, "exifLongitude": null, "exifDistanceM": null,
          "sortOrder": 0, "uploadedAt": "…", "uploadedBy": "1a2b…",
          "uploadedByUser": { "…": "…" }
        }
      ]
    },
    "nearbyProjects": [
      {
        "projectId": "9f4d…", "isYours": false,
        "name": "برج الواحة", "distanceM": 38, "stage": "QUALIFIED",
        "buildingType": "APARTMENT_BUILDING", "constructionPhase": "STRUCTURE",
        "status": "ACTIVE", "description": "…", "addressLine": "…",
        "latitude": 33.50413, "longitude": 36.24107,
        "owner": { "firstName": "Test", "lastName": "User" },
        "unitCount": 24, "estimatedValue": 900000, "currency": "SAR",
        "images": [
          { "key": "files/image/2026-08-06/9f…", "name": "north-elevation.jpg",
            "contentType": "image/jpeg", "byteSize": 2317004,
            "url": "https://res.cloudinary.com/…", "urlExpiresAt": "…" }
        ]
      }
    ]
  },
  "meta": { "…": "…" }
}
```

**Three behaviours your UI must handle**

1. **`nearbyProjects` shows candidates and blocks nothing.** Present them as
   "did you mean one of these?" with a *continue anyway* path. `isYours: true`
   means the caller already registered it — link straight to it.

   **Show the photo.** Each candidate is the full `GET /projects/nearby` card,
   owner name and `images[]` included, and that is the entire point of the
   feature: nothing here is blocked, so persuasion is the only thing that actually
   prevents a duplicate. "برج الواحة, 38m, QUALIFIED" cannot tell a rep whether
   that is the tower they are standing under. A picture of it can, in a second.
2. **`stakeholderLinkFailures` is present only when a link failed** — an array of
   `{ accountId, reason }`. **A missing key means "nothing failed", never "not
   attempted".** The project is created either way; surface the failures as a
   follow-up task, not as an error.
3. **`outsideTerritory: true`** means the GPS fell in *no* territory. Accepted on
   purpose and flagged for back office. Do not treat it as a failure.

**Errors**

| Code | Status | Cause |
| --- | --- | --- |
| `VALIDATION_ERROR` | 400 | Any DTO rule above |
| `PROJECT_IMAGE_REQUIRED` | 400 | Empty `files` |
| `PROJECT_IMAGE_NOT_UPLOADED` | 400 | A `key` is not in storage — retry the upload, then resubmit |
| `PROJECT_TOO_MANY_IMAGES` | 400 | More than 10 |
| `PROJECT_INVALID_LOCATION` | 400 | Off the earth, or `(0,0)` — a phone with no fix |
| `PROJECT_INVALID_NAME` / `PROJECT_INVALID_DESCRIPTION` | 400 | Domain-level value rules |
| `PROJECT_OUTSIDE_OWN_TERRITORY` | 403 | GPS falls inside **another rep's** territory. Managers are exempt. |
| `PROJECT_NOT_ACCESSIBLE` | 403 | `SALES_ADMIN` / `GENERAL_MANAGER` — they do not register |

---

### `GET /projects`

> **Role** — gate `REPRESENTATIVE`. Scoped: rep → own · manager → own + team ·
> `SALES_ADMIN`/`GENERAL_MANAGER` → all. No 403 is ever returned; you simply get
> fewer rows.

**Query**

| Param | Type | Rules |
| --- | --- | --- |
| `page` | integer | `≥ 1`, default `1` |
| `limit` | integer | `1 … 100`, default `20` |
| `stage` | `ProjectStage` | Enum |
| `status` | `ProjectStatus` | Enum |
| `constructionPhase` | `ConstructionPhase` | Enum |
| `buildingType` | `BuildingType` | Enum |
| `territoryId` | string | UUID |
| `outsideTerritoryOnly` | boolean | `"true"` / `"false"`. Back office's worklist: buildings whose GPS fell in no territory. |
| `search` | string | `≤ 100`, trimmed. Case-insensitive match on **name or address line**. |
| `updatedSince` | ISO date | Everything touched since this instant — the offline delta pull. |
| `near` | string | `lat,lng,radiusM` — must match `^-?\d+(\.\d+)?,-?\d+(\.\d+)?,\d+$`. Radius is a **positive integer**, metres. |

```
GET /projects?stage=QUOTE_ISSUED&status=ACTIVE&near=33.50412,36.24107,500&limit=50
```

**Response — `200 OK`**

`data` is [`ProjectSummaryView[]`](#projectsummaryview), plus `pagination`.

- Scope is applied **inside the query, not to the page**, so `pagination.total`
  is honest for your role.
- `near` adds `distanceM` to every row and sorts nearest first. Without `near`,
  `distanceM` is absent — do not assume the key exists.
- Rows carry `imageCount` / `activityCount` / `stakeholderCount` but **no
  `images` array**. Fetch one project to get photos.

---

### `GET /projects/nearby`

> **Role** — gate `REPRESENTATIVE`. **Not owner-scoped for anyone.** Every role
> gets every building within the radius, whoever registered it.

**This is the one read in the subsystem that crosses ownership for a rep**, and
it is a deliberate exception rather than a hole. `GET /projects` answers *what am
I working on*, so narrowing it to the caller is the whole point. This answers
*what is already registered around me* — and a rep shown only their own pins is
told a tower is unclaimed when a colleague registered it last week, which is how
two people spend a month on the same building and one of them wasted it.

What keeps that from being a pipeline leak is **the projection, not a filter**.

**Query**

| Param | Type | Rules |
| --- | --- | --- |
| `near` | string | **Required.** `lat,lng,radiusM`. Radius `1 … 1200` metres — outside that is `400`. |
| `page` | integer | `≥ 1`, default `1` |
| `limit` | integer | `1 … 100`, default `20` |

```
GET /projects/nearby?near=33.50413,36.24107,500&page=1&limit=20
```

**The radius cap is the access control, not a performance guard.** Uncapped, one
call with `radiusM=50000000` returns the entire company pipeline with an owner's
name on every row — the same disclosure the 404-not-403 rule exists to prevent,
handed over in a single request. Roughly a walk; scouting a wider district is
several calls, deliberately.

**Response — `200 OK`**

`data` is [`NearbyProjectCardView[]`](#nearbyprojectcardview), plus `pagination`.

- **Nearest first**, `distanceM` always present.
- `pagination.total` counts what is inside the **circle**, not the bounding box
  the index answered — the page is cut after the exact haversine, so no page
  promises rows that do not exist.
- **Cancelled and closed buildings are included.** `stage` and `status` are in the
  payload, and "this site died" is exactly what you need to know standing in
  front of it.
- **Photos are [`StoredFileView`](#storedfileview--the-one-file-shape)** — a
  signed Cloudinary `url` good for 30 minutes, plus the durable `key`. When it
  expires, `POST /files/resolve` returns the same object with a fresh URL rather
  than re-fetching the page.

**What is absent, and why:** no project `id`, no `ownerId` or owner email, no
`notes`, no activity log, no history, no `territory`, no `version`, no counts.
`GET /projects/{id}` still answers `404 PROJECT_NOT_FOUND` for every row returned
here — nothing in this payload is a handle onto anything else. The owner's first
and last name is the one thing crossed over, and it is the point: a rep who finds
a building already claimed needs to know **who to ask internally** before
spending a morning on it.

Contrast `GET /projects?near=…`: same geometry, opposite question. That one is
*your* pipeline sorted by distance, with the full row shape and no radius cap
(it is owner-scoped first, so a huge radius there only returns more of your own).

---

### `GET /projects/{id}`

> **Role** — gate `REPRESENTATIVE`, then the **View** predicate: owner · manager
> of the owner · `SALES_ADMIN`/`GENERAL_MANAGER`. Anyone else gets
> `404 PROJECT_NOT_FOUND`, never `403`.

**Path params:** `id` — UUID (`ParseUUIDPipe`; a non-UUID is `400`).

**Response — `200 OK`**

`data` is [`ProjectDetailView`](#projectdetailview) — the card, its photos with
freshly signed URLs, its **full activity log**, its live stakeholder roster and
its flagged decision maker.

```json
{
  "success": true,
  "message": "Project retrieved successfully",
  "data": {
    "id": "2b7c…", "name": "…", "stage": "QUOTE_ISSUED", "status": "ACTIVE",
    "version": 7, "imageCount": 3,
    "images": [ { "…": "…" } ],
    "activities": [ { "…": "…" } ],
    "stakeholders": [
      {
        "linkId": "c31a…", "accountId": "0d1e…", "accountName": "مقاولات الأمل",
        "accountType": "COMPANY", "role": "MAIN_CONTRACTOR",
        "primaryContact": {
          "contactId": "77a2…", "accountId": "0d1e…",
          "firstName": "سامر", "lastName": "…", "position": "مدير مشتريات",
          "phone": "+9665…", "email": "…"
        },
        "note": null, "startedAt": "2026-06-01T…"
      }
    ],
    "decisionMaker": {
      "contactId": "77a2…", "contactName": "سامر …",
      "accountId": "0d1e…", "accountName": "مقاولات الأمل"
    }
  },
  "meta": { "…": "…" }
}
```

Four things to know:

- **`activityCount` and `stakeholderCount` are absent here** — replaced by the
  `activities` and `stakeholders` arrays themselves. `imageCount` *does* survive
  and is **not** `images.length`: it counts live photos against the 10-photo
  ceiling, while `images` omits any photo whose URL could not be signed.
- **`activities` is the full log, unpaginated**, newest first by `occurredAt`.
  Use `GET /projects/{id}/activities` when you need paging or filtering.
- `decisionMaker` is `null` when nobody is flagged. If the directory could not be
  reached the key is absent rather than `null`, so you can tell "nobody is linked"
  from "we could not ask".
- `images[].url` is **time-limited and signed** (`urlExpiresAt`). Re-fetch the
  project rather than caching URLs across sessions.

**Errors:** `PROJECT_NOT_FOUND` (404) — no such project **or one you may not
see**.

---

### `PATCH /projects/{id}`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate: the owner, or a
> `SALES_MANAGER` whose team contains the owner. `SALES_ADMIN`/`GENERAL_MANAGER`
> → `403 PROJECT_NOT_ACCESSIBLE`. Anyone else → `404`.

Correct the project card. **Omitted fields are left alone; an explicit `null`
clears the field** where the table says nullable.

Not editable here: `location` (manager route), `stage`, `status`,
`constructionPhase` (visit observation only).

**Body**

| Field | Type | Nullable | Rules |
| --- | --- | --- | --- |
| `name` | string | No | `3 … 200`, trimmed. Sending `null` is a `400`. |
| `buildingType` | `BuildingType` | No | Enum |
| `description` | string | No | `10 … 2000`, trimmed. Sending `null` is a `400`. |
| `addressLine` | string | **Yes** | `≤ 500`, trimmed |
| `unitCount` | integer | **Yes** | `1 … 100000` |
| `estimatedValue` | number | **Yes** | `≥ 0`, max 2 dp |
| `currency` | string | **Yes** | ISO-4217. Send only when changing it alongside the amount. |
| `notes` | string | **Yes** | `≤ 2000`, trimmed |
| `expectedVersion` | integer | No | `≥ 0`. See [§1.9](#19-optimistic-concurrency). |

```json
{ "unitCount": 46, "notes": null, "expectedVersion": 7 }
```

**Response — `200 OK`** · `data` is [`ProjectView`](#projectview) (no images, no
counts).

**Errors:** `VALIDATION_ERROR` (400) · `PROJECT_NOT_FOUND` (404) ·
`PROJECT_NOT_ACCESSIBLE` (403) · `PROJECT_VERSION_CONFLICT` (409) ·
`PROJECT_CANCELLED` (409).

---

### `PUT /projects/{id}/stage`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate.
> **One extra rule:** moving *out of* `WON` or `LOST` additionally requires
> `SALES_MANAGER`+ **and** a `note` — a rep gets
> `403 PROJECT_REOPEN_REQUIRES_MANAGER`.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `stage` | `ProjectStage` | **Yes** | Enum. `WON` / `LOST` are refused. |
| `note` | string | **Conditional** | `10 … 500`, trimmed, **must not contain `< > ; " '`**. Optional in general; **required when reopening a `WON`/`LOST` project**. |
| `expectedVersion` | integer | No | `≥ 0` |

```json
{ "stage": "COMMITTED", "note": "تعميد من المالك بعد اجتماع الموقع", "expectedVersion": 7 }
```

**The system never refuses a stage change except by two rules.** Skipping five
stages forward is valid. Going backwards is valid. Re-picking the current stage
is a no-op, not an error. Build the control as a free dropdown, not a wizard.

| Rule | Error | Status |
| --- | --- | --- |
| `WON` / `LOST` cannot be picked — they come from a confirmed outcome | `PROJECT_STAGE_REQUIRES_OUTCOME` | 400 |
| Leaving `WON` / `LOST` needs a **manager** *and* a `note` | `PROJECT_REOPEN_REQUIRES_MANAGER` | 403 |

**Response — `200 OK`** · `data` is [`ProjectView`](#projectview).

---

### `PUT /projects/{id}/status`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate.
> **One extra rule:** moving *out of* `CANCELLED` requires `SALES_MANAGER`+. A rep
> attempting it gets **`404 PROJECT_NOT_FOUND`**, not a 403 — so hide the revive
> control rather than relying on the error.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `status` | `ProjectStatus` | **Yes** | Enum |
| `reason` | string | **Yes** | `10 … 500`, trimmed, no `< > ; " '` |
| `expectedVersion` | integer | No | `≥ 0` |

```json
{ "status": "DORMANT", "reason": "توقف العمل في الموقع منذ شهر", "expectedVersion": 8 }
```

> **`CANCELLED` means nobody won.** It is excluded from win rate. A deal lost to
> a competitor must go through `POST /projects/{id}/lost` instead — mixing the
> two destroys the number.

Reviving a `CANCELLED` project requires a manager.

**Response — `200 OK`** · `data` is [`ProjectView`](#projectview).

---

### `PUT /projects/{id}/location`

> **Role — `SALES_MANAGER` ONLY.** Two checks stack: the route gate rejects a
> `REPRESENTATIVE`, and then the handler rejects `SALES_ADMIN` and
> `GENERAL_MANAGER` with `403 PROJECT_LOCATION_REQUIRES_MANAGER` **even though they
> outrank a manager**. The manager must also pass the **Work** predicate on the
> project (own, or their team's).

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `location` | `LocationDto` | **Yes** | Nested, validated |
| `reason` | string | **Yes** | `10 … 500`, trimmed, no `< > ; " '` |
| `addressLine` | string | Nullable | `≤ 500`, trimmed. `null` clears it. |

**The territory moves with the pin** — it is derived from the coordinate, not
chosen alongside it. A building moved across a boundary belongs to the new zone
from the next report onward.

**Response — `200 OK`** · `data` is [`ProjectView`](#projectview) with the new
`territoryId` / `territory` / `outsideTerritory`.

---

### `GET /projects/{id}/history`

> **Role** — gate `REPRESENTATIVE`, then the **View** predicate. For a
> representative every `changedBy` / `changedByUser` is stripped, so the feed reads
> as an anonymous timeline.

**Query:** `page`, `limit` (standard pagination only).

**Response — `200 OK`** · `data` is
[`ProjectHistoryEntryView[]`](#projecthistoryentryview), newest first, **stage
and status changes merged into one chronological feed**.

```json
{
  "data": [
    {
      "kind": "STATUS", "id": "…", "projectId": "2b7c…",
      "fromStatus": "DORMANT", "toStatus": "ACTIVE",
      "reason": "استأنف العمل في الموقع",
      "changedAt": "2026-08-04T…", "changedBy": "…", "changedByUser": { "…": "…" }
    },
    {
      "kind": "STAGE", "id": "…", "projectId": "2b7c…",
      "fromStage": "COMMITTED", "toStage": "WON",
      "source": "OUTCOME_CONFIRMED", "note": null,
      "changedAt": "2026-08-01T…", "changedBy": "…", "changedByUser": { "…": "…" }
    }
  ],
  "pagination": { "…": "…" }
}
```

**Discriminate on `kind`** — `"STAGE"` entries carry `fromStage`/`toStage`/
`source`/`note`; `"STATUS"` entries carry `fromStatus`/`toStatus`/`reason`.

For a representative, `changedBy` and `changedByUser` are stripped
([§1.7](#17-a-representative-never-sees-who-did-what)) — the feed still reads as
a timeline, just an anonymous one.

---

### `POST /projects/{id}/images`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `files` | `ProjectFileRefDto[]` | **Yes** | **1 … 10 items** |

Every key is verified against storage before anything is attached. The 10-photo
ceiling counts **live** photos, so a project that has had some removed can take
more.

**Response — `201 Created`** · `data` is a bare
[`ProjectImageView[]`](#projectimageview) — **the newly added images only**, not
the whole gallery. No pagination.

**Errors:** `PROJECT_IMAGE_NOT_UPLOADED` (400) · `PROJECT_TOO_MANY_IMAGES` (400)
· `PROJECT_NOT_FOUND` (404).

---

### `DELETE /projects/{id}/images/{imageId}`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate.

Soft removal — the row is closed and the object stays, because an image named in
an old ownership dispute must stay retrievable.

> **The last photo cannot be removed** (`PROJECT_IMAGE_REQUIRED`, 400). Disable
> the delete control when `imageCount === 1`.

**Response — `200 OK`**, [nested-message shape](#14-the-nested-message-shape):

```json
{ "success": true, "message": "Success", "data": { "message": "Project photo removed successfully" }, "meta": { "…": "…" } }
```

**Errors:** `PROJECT_IMAGE_NOT_FOUND` (404) · `PROJECT_IMAGE_REQUIRED` (400).

---

## 6. Endpoint reference — Activities

Route gate: `REPRESENTATIVE` on every route. No route-level overrides — the
differences are all per-project or per-author.

| Method | Path | Gate | Effective access |
| --- | --- | --- | --- |
| `GET` | `/projects/needs-attention` | `REPRESENTATIVE` | Scoped like a list — **see [§12](#12-known-issues)** |
| `POST` | `/projects/{projectId}/activities` | `REPRESENTATIVE` | **Work** predicate; backdating > 48 h needs `SALES_MANAGER` |
| `GET` | `/projects/{projectId}/activities` | `REPRESENTATIVE` | **View** predicate |
| `POST` | `/activities/sync` | `REPRESENTATIVE` | **Work** predicate, evaluated **per item** |
| `GET` | `/activities` | `REPRESENTATIVE` | Scoped: own / own+team / all |
| `GET` | `/activities/{id}` | `REPRESENTATIVE` | **View** predicate on the parent project |
| `PATCH` | `/activities/{id}` | `REPRESENTATIVE` | **The author only — at every rank, including `GENERAL_MANAGER`** |

---

### `GET /projects/needs-attention`

> **Role** — gate `REPRESENTATIVE`. Scoped like any list: rep → own · manager →
> own + team · `SALES_ADMIN`/`GENERAL_MANAGER` → all. In practice only a rep's
> view of it is meaningful.

The rep's home screen. One entry per project, most urgent first.

> ⚠️ **This route is currently shadowed — see [§12](#12-known-issues) before you
> build against it.**

**Query**

| Param | Type | Rules | Default |
| --- | --- | --- | --- |
| `limit` | integer | `≥ 1`. **No upper bound is enforced by the validator** despite the docs saying 200; the handler slices after ranking. | `50` |

**Response — `200 OK`** · `data` is a bare
[`AttentionItemView[]`](#attentionitemview). **No pagination.**

```json
{
  "data": [
    { "projectId": "…", "name": "برج الواحة", "reason": "FOLLOW_UP_DUE",
      "message": "وعدت بالمتابعة اليوم.", "dueAt": "2026-08-05T09:00:00.000Z", "daysWaiting": 0 },
    { "projectId": "…", "name": "فيلا النخيل", "reason": "NO_ACTIVITY",
      "message": "٢٣ يوم بدون نشاط.", "dueAt": null, "daysWaiting": 23 }
  ]
}
```

`message` is composed server-side **in Arabic** — render it directly, do not
rebuild it from `reason` + `daysWaiting`. `reason` stays machine-readable for
icons and grouping.

**Ranking rules — first match wins, one item per project:**

| Order | `reason` | Trigger |
| --- | --- | --- |
| 1 | `FOLLOW_UP_DUE` | `nextActionAt` has arrived. `dueAt` is set (the only reason that sets it). |
| 2 | `AWAITING_THEM` | Latest outcome is `WAITING_ON_THEM` / `AWAITING_QUANTITIES`, ≥ **14** days ago |
| 3 | `STAGE_WITHOUT_EVIDENCE` | At `QUOTE_ISSUED` or later, nothing logged for **30** days |
| 4 | `NO_ACTIVITY` | Nothing logged for **21** days |

Projects that are `WON`, `LOST`, or not `ACTIVE` never appear. A project never
visited counts from its **registration date**, which is what makes it sort above
one that merely went quiet last month.

---

### `POST /projects/{projectId}/activities`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate: the owner, or a
> `SALES_MANAGER` whose team contains the owner. `SALES_ADMIN`/`GENERAL_MANAGER`
> → `403 PROJECT_NOT_ACCESSIBLE`.
> **One extra rule:** an `occurredAt` more than **48 h** before now requires
> `SALES_MANAGER`+ — a rep gets `403 ACTIVITY_BACKDATING_NEEDS_MANAGER`. The
> activity is then stored with `backdated: true`.

The highest-volume write in the system.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `kind` | `ActivityKind` | **Yes** | `VISIT` \| `COMMUNICATION` |
| `channel` | `ActivityChannel` | **Conditional** | **Required when `kind === "COMMUNICATION"`**; refused on a `VISIT` (`ACTIVITY_CHANNEL_NOT_ALLOWED`) |
| `purpose` | `ActivityPurpose` | **Yes** | Enum |
| `outcome` | `ActivityOutcome` | **Yes** | Enum |
| `occurredAt` | ISO date | **Yes** | When it **happened**. Not the future (5-min clock-skew tolerance). More than **48 h** back needs a manager. |
| `notes` | string | **Yes** | **`20 … 4000`, trimmed.** The 20-char floor is enforced twice — DTO and domain. |
| `personsMet` | string[] | **Yes** | **UUID v4** each, `1 … 20` items. `VISIT` ≥ 1; **`COMMUNICATION` exactly 1**. Everyone must be reachable through the project's live stakeholders. |
| `location` | `ActivityLocationDto` | No | GPS fix. See below. |
| `constructionPhaseObserved` | `ConstructionPhase` | No | **`VISIT` only** (`ACTIVITY_PHASE_OBSERVATION_NOT_ALLOWED`). The only way a project's phase ever changes. |
| `competitorAccountId` | string | No | UUID. For `COMPETITOR_ON_SITE`. Omit for an honest unknown. |
| `nextActionAt` | ISO date | **Conditional** | **Required when `outcome === "TOO_EARLY_REVISIT_LATER"`** |
| `files` | `UploadedFileDto[]` | No | `≤ 10` items |

```json
{
  "kind": "VISIT",
  "purpose": "SAMPLES",
  "outcome": "DECISION_IMMINENT",
  "occurredAt": "2026-08-01T08:40:00.000Z",
  "location": { "lat": 33.50409, "lng": 36.24112, "accuracyM": 12 },
  "constructionPhaseObserved": "ELECTRICAL_ROUGH_IN",
  "personsMet": ["77a2c1de-0000-4000-8000-000000000001"],
  "notes": "سلمت الكهربائي عينات أفياش ومفاتيح كلاسيك أبيض. طلب عرض سعر بعد حصر الكميات.",
  "nextActionAt": "2026-08-04T09:00:00.000Z",
  "files": [ { "key": "files/document/2026-08-05/11f1…pdf", "name": "boq-scan.pdf" } ]
}
```

**Two kinds, one shape**

| | `VISIT` | `COMMUNICATION` |
| --- | --- | --- |
| `channel` | refused | **required** |
| `location` | GPS if available | not meaningful |
| `personsMet` | ≥ 1 | **exactly 1** — three calls are three activities |
| `notes` | ≥ 20 chars | ≥ 20 chars |
| `constructionPhaseObserved` | optional | refused |

**GPS is a signal, not a gate.** A fix far from the project is **saved** with
`locationVerified: false`. Never block the submit on distance; never retry with a
moved pin.

**Timing.** `occurredAt` is when it happened; `capturedAt` is stamped server-side.
They differ constantly — reps log a day in one evening batch — and both are
stored. Show `occurredAt` in the log.

**Response — `201 Created`**

```json
{
  "message": "Activity logged",
  "data": {
    "activity": { "…": "…" },
    "suggestion": null
  }
}
```

`data.activity` is an [`ActivityView`](#activityview). `data.suggestion` is
`"SET_DORMANT"` when `outcome === "WORK_STOPPED"`, otherwise `null` — **an offer
for you to show, never something the server did.**

**Errors**

| Code | Status |
| --- | --- |
| `VALIDATION_ERROR` · `ACTIVITY_NOTES_TOO_SHORT` · `ACTIVITY_CHANNEL_REQUIRED` · `ACTIVITY_CHANNEL_NOT_ALLOWED` · `ACTIVITY_PERSONS_MET_REQUIRED` · `ACTIVITY_NEXT_ACTION_REQUIRED` · `ACTIVITY_COMPETITOR_REQUIRED` · `ACTIVITY_PHASE_OBSERVATION_NOT_ALLOWED` · `ACTIVITY_OCCURRED_IN_FUTURE` · `ACTIVITY_CONTACT_NOT_ON_PROJECT` | 400 |
| `ACTIVITY_BACKDATING_NEEDS_MANAGER` | 403 |
| `PROJECT_NOT_FOUND` | 404 |
| `PROJECT_CANCELLED` | 409 |

---

### `GET /projects/{projectId}/activities` and `GET /activities`

> **Role** — gate `REPRESENTATIVE`. The project-scoped route applies the **View**
> predicate to that project (`404` if you may not see it); the bare route applies
> list scoping (own / own+team / all). For a representative, `createdBy` and
> `createdByUser` are stripped from every row.

Identical query contract. The project-scoped route pins `projectId`; the bare
route is "your own feed" scoped by role.

**Query**

| Param | Type | Rules |
| --- | --- | --- |
| `page` / `limit` | integer | `≥ 1` / `1 … 100` |
| `kind` | `ActivityKind` | Enum |
| `purpose` | `ActivityPurpose` | Enum |
| `outcome` | `ActivityOutcome` | Enum |
| `createdBy` | string | UUID |
| `occurredFrom` | ISO date | Inclusive lower bound on `occurredAt` |
| `occurredTo` | ISO date | Upper bound |
| `editedAfterWindowOnly` | boolean | `"true"` / `"false"`. A manager's review list. |

**Response — `200 OK`** · `data` is [`ActivityView[]`](#activityview), **newest
first by `occurredAt`** (when it happened, not when it was typed), plus
`pagination`.

---

### `GET /activities/{id}`

> **Role** — gate `REPRESENTATIVE`, then the **View** predicate on the parent
> project. `revisions[].revisedBy` / `revisedByUser` are stripped for a
> representative — the diff is still visible, the reviser's name is not.

**Response — `200 OK`** · `data` is
[`ActivityDetailView`](#activitydetailview) — an `ActivityView` plus
`revisions[]`.

`revisions` is populated only for an activity edited **after** its 24-hour
window. Each entry carries `before`, `after` and the list of `fields` that
changed — this is what settles an ownership dispute.

**Errors:** `ACTIVITY_NOT_FOUND` (404).

---

### `PATCH /activities/{id}`

> **Role — the author, and nobody else, at any rank.** A `SALES_MANAGER`,
> `SALES_ADMIN` or `GENERAL_MANAGER` editing someone else's activity gets
> `403 ACTIVITY_NOT_AUTHOR`. This is the one place in the module where rank buys
> nothing at all.

A manager who disagrees does not rewrite the record — that is the whole reason
the revision trail exists.

**Body** — all fields optional; at least one should be present.

| Field | Type | Nullable | Rules |
| --- | --- | --- | --- |
| `purpose` | `ActivityPurpose` | No | Enum |
| `outcome` | `ActivityOutcome` | No | Enum |
| `notes` | string | No | `20 … 4000`, trimmed. `null` is a `400`. |
| `personsMet` | string[] | No | UUID v4, `1 … 20` |
| `nextActionAt` | ISO date | **Yes** | `null` clears a promise you no longer intend to keep |
| `competitorAccountId` | string | **Yes** | UUID. `null` clears it. |

**Not editable, by design:** `kind`, `channel`, `occurredAt`, `location`,
`constructionPhaseObserved`, `files`. Those are what the activity *is* — log a
new one instead. Sending them is a `400 VALIDATION_ERROR` (unknown property).

**The edit window**

| When | What happens |
| --- | --- |
| Within **24 h** of `capturedAt` | Edited in place. Nothing is flagged. |
| After 24 h | **Still accepted.** The original is preserved in `revisions`, and `editedAfterWindow` becomes `true`. |

A late edit is never refused. Warn the rep in the UI ("this will be visible to
your manager"), then submit.

**Response — `200 OK`** · `data` is [`ActivityView`](#activityview).

---

### `POST /activities/sync`

> **Role** — gate `REPRESENTATIVE`. Authorization is then evaluated **per item**
> against that item's `projectId`, using the same **Work** predicate as the online
> route. An item on a project you may not write to comes back as `REJECTED` with
> its own error code — it does not fail the batch.

The offline batch. **Never all-or-nothing, and always `200`.**

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `items` | `SyncActivityItem[]` | **Yes** | **1 … 100 items** |

Each item is a full `LogActivityDto` (every rule in
[`POST /projects/{projectId}/activities`](#post-projectsprojectidactivities)
applies) **plus**:

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `projectId` | string | **Yes** | UUID |
| `clientRef` | string | **Yes** | `8 … 100`, trimmed. Your own id for the item, unique per rep. |

```json
{
  "items": [
    {
      "projectId": "2b7c…", "clientRef": "local-8f3a-2026-08-01-001",
      "kind": "VISIT", "purpose": "FOLLOW_UP", "outcome": "PROGRESSING",
      "occurredAt": "2026-08-01T08:40:00.000Z",
      "personsMet": ["77a2c1de-0000-4000-8000-000000000001"],
      "notes": "زيارة متابعة، الكهربائي بدأ التمديدات في الطابق الثالث."
    }
  ]
}
```

**Response — `200 OK`** (never 207, never 4xx for a bad item):

```json
{
  "message": "Activity batch synced",
  "data": {
    "results": [
      { "clientRef": "local-8f3a…", "status": "CREATED",   "activityId": "aa11…", "error": null },
      { "clientRef": "local-2b91…", "status": "DUPLICATE", "activityId": "bb22…", "error": null },
      { "clientRef": "local-77c0…", "status": "REJECTED",  "activityId": null,
        "error": { "code": "ACTIVITY_CONTACT_NOT_ON_PROJECT", "message": "…" } }
    ],
    "created": 1, "duplicates": 1, "rejected": 1
  }
}
```

**Client handling, per status:**

| `status` | Meaning | What to do |
| --- | --- | --- |
| `CREATED` | Written | Store `activityId`, clear the local record |
| `DUPLICATE` | **A success.** Already written by an earlier attempt; `activityId` is the original's. | Clear the local record. **Do not retry.** |
| `REJECTED` | Invalid; retrying unchanged will not help | Show the rep `error.code`, let them fix it, resubmit as a new item |

`REJECTED` carries any code from [§11](#11-error-codes) — including the
authorization ones (`PROJECT_NOT_FOUND`, `PROJECT_NOT_ACCESSIBLE`) when the item
targets a project that was reassigned while the rep was offline. One extra code
appears **only here**: `ACTIVITY_SYNC_FAILED`, meaning an unexpected server-side
failure. That one **is** worth retrying later, unlike every other rejection.

Idempotency comes from `clientRef`. A batch replayed after a dropped response
returns `DUPLICATE` throughout and writes nothing — so **retrying the whole batch
is always safe**.

Match results to inputs by `clientRef`; do not rely on array order.

---

## 7. Endpoint reference — Outcomes

| Method | Path | Gate | Effective access |
| --- | --- | --- | --- |
| `POST` | `/projects/{projectId}/won` | `REPRESENTATIVE` | **Work** predicate |
| `POST` | `/projects/{projectId}/lost` | `REPRESENTATIVE` | **Work** predicate |
| `GET` | `/outcomes` | `REPRESENTATIVE` | Scoped by the **project's owner**, not the submitter |
| `GET` | `/outcomes/{id}` | `REPRESENTATIVE` | **View** predicate on the parent project |
| `POST` | `/outcomes/{id}/confirm` | **`SALES_MANAGER`** | **Supervise** — `SALES_MANAGER` **only**, **and not the submitter** |
| `POST` | `/outcomes/{id}/reject` | `REPRESENTATIVE` | The **submitter** (any rank, a withdrawal) **or** a `SALES_MANAGER` who can view the project |

> **The four-eyes rule.** Submitting does **not** move the project's stage. The
> project becomes `WON` / `LOST` only when a *different* person confirms. This is
> the only such rule in the system.

---

### `POST /projects/{projectId}/won`

> **Role** — gate `REPRESENTATIVE`, then the **Work** predicate. A manager may
> submit on a team member's project; `SALES_ADMIN`/`GENERAL_MANAGER` cannot submit
> at all (`403 PROJECT_NOT_ACCESSIBLE`). Whoever submits **cannot later confirm**.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `distributorAccountId` | string | **Yes** | UUID. Must be an Account carrying an **active `DISTRIBUTOR` classification**. |
| `value` | number | No | `≥ 0`, max 2 dp |
| `currency` | string | **Conditional** | ISO-4217. **Required when `value` is present.** |
| `soldAt` | ISO date | No | — |
| `categories` | `ProductCategory[]` | No | `≤ 20` items |
| `unitsSupplied` | integer | No | `≥ 0` |
| `unitsTotal` | integer | No | `≥ 0`. `unitsSupplied > unitsTotal` → `PROJECT_UNITS_EXCEED_TOTAL`. |
| `buyerContactId` | string | No | UUID — who signed |
| `notes` | string | No | `≤ 2000`, trimmed |

```json
{
  "distributorAccountId": "4d2e…",
  "value": 792000,
  "currency": "SAR",
  "soldAt": "2026-08-01",
  "categories": ["SOCKETS_SWITCHES", "LIGHTING", "EXHAUST_FANS"],
  "unitsSupplied": 20,
  "unitsTotal": 35,
  "buyerContactId": "77a2…",
  "notes": "تعميد من المالك، التوريد عن طريق محل ماجد."
}
```

An **unappointed** outlet is accepted — `isAuthorized: false` on the returned
`distributor`. Only a missing or non-`DISTRIBUTOR` account is refused
(`404 PROJECT_DISTRIBUTOR_NOT_FOUND`). Propose one from the field with
`POST /accounts/{id}/classifications`.

**Response — `201 Created`** · `data` is an [`OutcomeView`](#outcomeview) with
`status: "PENDING"`. **The project's `stage` has not moved.**

---

### `POST /projects/{projectId}/lost`

> **Role** — identical to `…/won`: gate `REPRESENTATIVE`, then the **Work**
> predicate, and the submitter is barred from confirming it.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `someoneElseWon` | boolean | **Yes** | **Must be `true`.** `false` is refused with a message pointing at cancellation. |
| `reason` | `LossReason` | **Yes** | Enum |
| `competitorPrice` | number | **Conditional** | `≥ 0`, max 2 dp. **Required when `reason === "PRICE"`.** |
| `currency` | string | **Conditional** | ISO-4217. **Required when `competitorPrice` is present.** |
| `competitorAccountId` | string | No | UUID. Must carry an active `COMPETITOR` classification. **Omit it for an honest UNKNOWN.** |
| `narrative` | string | No | `≤ 2000`, trimmed |
| `notes` | string | No | `≤ 2000`, trimmed |

```json
{
  "someoneElseWon": true,
  "competitorAccountId": "9b3c…",
  "reason": "PRICE",
  "competitorPrice": 690000,
  "currency": "SAR",
  "narrative": "نزلوا ١٧٪ على الكابلات وأخذوا السكوب كامل."
}
```

> **Do not offer `someoneElseWon: false` in the UI at all.** If nobody won, the
> building died — route the rep to `PUT /projects/{id}/status` → `CANCELLED`
> instead. The server refuses it with `PROJECT_LOSS_REQUIRES_WINNER` (400).

**Response — `201 Created`** · `data` is an [`OutcomeView`](#outcomeview) with
`status: "PENDING"`.

---

### `GET /outcomes`

> **Role** — gate `REPRESENTATIVE`. **Scoped by the project's owner, not by who
> submitted**: a manager needs everything awaiting them across their team, and
> most of those were submitted by their reps.

**Query**

| Param | Type | Rules |
| --- | --- | --- |
| `page` / `limit` | integer | `≥ 1` / `1 … 100` |
| `status` | `OutcomeStatus` | `PENDING` is the manager's confirmation queue |
| `type` | `OutcomeType` | `WON` \| `LOST` |
| `projectId` | string | UUID |
| `submittedBy` | string | UUID |

```
GET /outcomes?status=PENDING&limit=50
```

**Response — `200 OK`** · `data` is [`OutcomeView[]`](#outcomeview) + pagination.

`?status=PENDING` returns **oldest first** — the one waiting longest is holding
up someone's numbers. Scope follows the **project's owner**, not the submitter, so
a manager sees everything awaiting them across their team.

---

### `GET /outcomes/{id}`

> **Role** — gate `REPRESENTATIVE`, then the **View** predicate on the parent
> project; otherwise `404 OUTCOME_NOT_FOUND`.

**Response — `200 OK`** · `data` is a single [`OutcomeView`](#outcomeview).

---

### `POST /outcomes/{id}/confirm`

**No request body.**

> **Role — `SALES_MANAGER` ONLY, and never the submitter.** Three checks stack:
> 1. the route gate rejects a `REPRESENTATIVE`;
> 2. the handler rejects `SALES_ADMIN` and `GENERAL_MANAGER` with
>    `403 PROJECT_CONFIRMATION_REQUIRES_MANAGER` **despite them outranking a
>    manager** — this is the single most load-bearing write in the system, and they
>    audit the pipeline rather than working it;
> 3. the **View** predicate must pass on the project (own, or their team's), and
>    the four-eyes rule rejects the submitter with
>    `403 PROJECT_OUTCOME_SELF_CONFIRMATION`.

On success the outcome becomes `CONFIRMED` **and** the project moves to `WON` /
`LOST` in the same transaction, with `source: "OUTCOME_CONFIRMED"` on the stage
log.

**Response — `200 OK`** · `data` is the settled [`OutcomeView`](#outcomeview).

**Errors**

| Code | Status | Cause |
| --- | --- | --- |
| `PROJECT_OUTCOME_SELF_CONFIRMATION` | 403 | You submitted it. Another manager has to confirm. |
| `PROJECT_CONFIRMATION_REQUIRES_MANAGER` | 403 | Rep, back office, or GM |
| `PROJECT_OUTCOME_ALREADY_SETTLED` | 409 | Already confirmed or rejected |
| `OUTCOME_NOT_FOUND` | 404 | — |

---

### `POST /outcomes/{id}/reject`

> **Role — deliberately wider than confirm.** Gate `REPRESENTATIVE`, then the
> **View** predicate on the project, then: **if you are the submitter you are
> allowed through at any rank** (this is a withdrawal); otherwise the `SALES_MANAGER`
> **only** rule applies, exactly as for confirm. So a rep may withdraw their own
> submission, a manager may reject their team's, and `SALES_ADMIN`/`GENERAL_MANAGER`
> may reject nothing.

**Body**

| Field | Type | Required | Rules |
| --- | --- | --- | --- |
| `reason` | string | **Yes** | `10 … 500`, trimmed, no `< > ; " '`. **The rep will read this.** |

The project returns to `previousStage` — the stage it was at when the outcome was
submitted, captured then so the restore is exact.

**Unlike confirmation, the submitter may reject their own** (a withdrawal). A
rejected outcome can be superseded by a new submission.

**Response — `200 OK`** · `data` is the settled
[`OutcomeView`](#outcomeview) with `status: "REJECTED"`, `rejectedAt` and
`rejectionReason` populated.

---

## 8. Endpoint reference — Reports

> **Role — `SALES_MANAGER`+ on all five.** This is the one group where rank alone
> decides, and where `SALES_ADMIN` and `GENERAL_MANAGER` have *more* access than a
> manager rather than less.
>
> | Role | Reports |
> | --- | --- |
> | `REPRESENTATIVE` | ✖ `403` from the route gate |
> | `SALES_MANAGER` | ✔ own + direct team |
> | `SALES_ADMIN` | ✔ the whole company |
> | `GENERAL_MANAGER` | ✔ the whole company |
>
> Gate the entire reports area behind `role >= SALES_MANAGER` in your router.

A representative does not need a report to know their own day — they have
`GET /projects/needs-attention`, a list of what to do rather than a count of what
was done.

**Two rules run through all five:** only **`CONFIRMED`** outcomes count, and
**`CANCELLED`** projects are excluded from win rate.

**Scope is not a parameter** — it comes from your role. A manager sees their team;
`SALES_ADMIN` and `GENERAL_MANAGER` see the company. `ownerId` narrows within
what you may already see; it cannot widen it.

### Shared query — `ReportFiltersDto`

| Param | Type | Rules |
| --- | --- | --- |
| `from` | ISO date | Inclusive lower bound. Omit for all time. |
| `to` | ISO date | Upper bound |
| `territoryId` | string | UUID |
| `ownerId` | string | UUID — one representative |

Reports are **not paginated**; `data` is a single report object.

---

### `GET /reports/pipeline`

Open projects only. `data` is [`PipelineReportView`](#report-views).

```json
{
  "data": {
    "period": { "from": "2026-07-01T00:00:00.000Z", "to": null },
    "byStage": [
      { "stage": "QUOTE_ISSUED", "projectCount": 40, "estimatedValue": 3000000, "valuedProjectCount": 4, "currency": "SAR" }
    ],
    "totalProjects": 128,
    "totalEstimatedValue": 9400000
  }
}
```

> **Always render `valuedProjectCount` beside `estimatedValue`.** A total of
> 3,000,000 across 4 of 40 projects is a different statement from the same total
> across all 40, and a bare sum cannot tell them apart.

---

### `GET /reports/rep-activity`

`data` is [`RepActivityReportView`](#report-views).

`projectsTouched` counts **distinct projects**, not activities — ten calls to one
building is one project touched.

**A rep with nothing at all is kept in the rows and sorts last.** "Who did nothing
this week" is the question this report is usually opened to answer; do not filter
zero rows out client-side.

---

### `GET /reports/win-loss`

**Query:** `ReportFiltersDto` **plus**

| Param | Type | Rules | Default |
| --- | --- | --- | --- |
| `groupBy` | `rep` \| `territory` \| `period` | Lowercase. `period` = calendar month. | `rep` |

`data` is [`WinLossReportView`](#report-views).

> **`winRate` is `null`, never `0`, when nothing has been decided.** Render `—`,
> not `0%`. A rep with no closed deals has no win rate; `0%` reads as "loses
> everything".

`cancelled` is reported on every row even though it is excluded from the rate —
show the column, it is what makes the definition self-evident.

---

### `GET /reports/sales-by-outlet`

`data` is [`OutletSalesReportView`](#report-views).

`isAuthorized` distinguishes a formally appointed dealer from an outlet a rep
simply buys through. **Both appear**, because most are the latter. An outlet
archived since the sale still appears.

---

### `GET /reports/loss-analysis`

`data` is [`LossAnalysisReportView`](#report-views).

> **Always render `priceGapSampleSize` beside `averagePriceGap`.** An average over
> 2 of 30 losses is a rumour with a decimal point. `averagePriceGap` is `null`
> when no loss in the group carried both numbers.

**`UNKNOWN` is a real row** in `byCompetitor`, with `accountId: null`. Do not
filter it — "we do not know who took 40% of our losses" is the most actionable
line on the report.

---

## 9. Response object reference

Suggested TypeScript. Remember [§1.7](#17-a-representative-never-sees-who-did-what):
mark every `…By` / `…ByUser` field optional if a representative will use the app.

### `ActorView`

```ts
interface ActorView {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
}
```

Always nullable where it appears. `null` means "that id no longer names an
account", never "no actor was recorded" — the raw id always sits beside it.

### `TerritoryRefView`

```ts
interface TerritoryRefView { id: string; name: string; code: string }
```

### `ProjectView`

```ts
interface ProjectView {
  id: string;
  name: string;
  buildingType: BuildingType;
  description: string;
  latitude: number;
  longitude: number;
  addressLine: string | null;
  territoryId: string | null;
  territory: TerritoryRefView | null;
  outsideTerritory: boolean;      // GPS fell in no territory — back office worklist
  constructionPhase: ConstructionPhase;
  stage: ProjectStage;
  status: ProjectStatus;
  ownerId: string;
  owner: ActorView | null;
  unitCount: number | null;
  estimatedValue: number | null;
  currency: string | null;
  notes: string | null;
  lastActivityAt: string | null;  // ISO
  nextActionAt: string | null;    // ISO
  closedAt: string | null;
  closedBy?: string | null;       // stripped for REPRESENTATIVE
  version: number;                // optimistic-concurrency token
  createdBy?: string;             // stripped for REPRESENTATIVE
  createdByUser?: ActorView | null;
  createdAt: string;
  updatedAt: string;
}
```

Returned by `PATCH /projects/{id}`, `PUT …/stage`, `PUT …/status`,
`PUT …/location`.

### `ProjectSummaryView`

```ts
interface ProjectSummaryView extends ProjectView {
  imageCount: number;
  activityCount: number;
  stakeholderCount: number;
  distanceM?: number;   // only on a `near=` query
}
```

Returned by `GET /projects` (list rows).

### `StoredFileView` — the one file shape

**Every response in the API that carries a file returns this**, and adds fields to
it rather than inventing a different object. Upload results, project photos,
nearby-building photos and activity attachments are all this shape.

```ts
interface StoredFileView {
  key: string;              // durable handle — store this one
  name: string;             // display label, never a path
  contentType: string;      // read back from storage, never client-declared
  byteSize: number;
  url: string | null;       // signed, 30 minutes, CDN-served
  urlExpiresAt: string | null;
}
```

- **`url` renders it now. `key` renders it later.** When `url` is null or has
  expired, `POST /files/resolve` turns the key into a fresh temporary URL. The key
  never expires and is safe to store in any table.
- **`url` can be null, and for documents that is normal, not an error.** PDFs and
  Word files are stored `raw`, which Cloudinary will not deliver over the CDN
  unless that account setting is on. Use the key and the token route for those.
- **`contentType` is why a file is not always an image.** The bucket accepts
  photos, voice notes and PDF/Word — branch on this rather than assuming `<img>`.

What each context adds on top:

| Context | Extra fields |
| --- | --- |
| `ProjectImageView` | `id`, `caption`, `sortOrder`, `exifLatitude`, `exifLongitude`, `exifDistanceM`, `uploadedAt`, `uploadedBy*` |
| `ActivityAttachmentView` | `id`, `uploadedAt`, `uploadedBy` |
| `GET /projects/nearby` images | nothing — the bare shape |
| `POST /files` | nothing — the bare shape |

### `NearbyProjectCardView`

Returned by `GET /projects/nearby`. **A signpost, not a file** — the deliberately
narrow projection is what makes a cross-owner read safe.

```ts
interface NearbyProjectCardView {
  name: string;
  buildingType: BuildingType;
  description: string;
  latitude: number;
  longitude: number;
  addressLine: string | null;
  constructionPhase: ConstructionPhase;
  stage: ProjectStage;
  status: ProjectStatus;
  owner: { firstName: string; lastName: string };   // a name to ask for — never an id or email
  unitCount: number | null;
  estimatedValue: number | null;
  currency: string | null;
  images: StoredFileView[];
  distanceM: number;                 // always present, nearest first
}
```

**Not** a `ProjectSummaryView` with fields removed — a different type, on purpose.
No `id`, `ownerId`, `notes`, `territory`, `version`, `createdBy`, counts, or
timestamps. `owner` survives the `REPRESENTATIVE` attribution redaction because it
does not end in `By`: that rule hides who *did* things, and ownership is an
ongoing fact rather than a logged action.

The registration response reuses this card for `nearbyProjects`, plus `projectId`
and `isYours` — see [`POST /projects`](#post-projects).

### `ProjectImageView`

```ts
interface ProjectImageView extends StoredFileView {   // key, name, contentType, byteSize, url, urlExpiresAt
  id: string;
  caption: string | null;
  exifLatitude: number | null;
  exifLongitude: number | null;
  exifDistanceM: number | null;   // EXIF vs the project pin — reported, never enforced
  sortOrder: number;
  uploadedAt: string;
  uploadedBy?: string;            // stripped for REPRESENTATIVE
  uploadedByUser?: ActorView | null;
}
```

**An image whose URL could not be signed is no longer dropped from the array** —
it comes back with `url: null` and its `key`, which still opens it through
`POST /files/resolve`. `imageCount` remains the count against the ten-photo ceiling
and is still not `images.length`.

### `ProjectDetailView`

Returned by `GET /projects/{id}`.

```ts
interface ProjectDetailView extends ProjectView {
  imageCount: number;          // live photos vs the 10 ceiling — NOT images.length
  images: ProjectImageView[];  // omits any photo whose URL could not be signed
  activities: ActivityView[];  // FULL log, newest first by occurredAt, unpaginated
  stakeholders: StakeholderRefView[];
  decisionMaker: DecisionMakerRefView | null;
  // note: no activityCount, no stakeholderCount
}

interface StakeholderRefView {
  linkId: string;
  accountId: string;
  accountName: string;
  accountType: string;
  role: StakeholderRole;
  primaryContact: {
    contactId: string; accountId: string;
    firstName: string; lastName: string; position: string | null;
    phone: string | null; email: string | null;
  } | null;
  note: string | null;
  startedAt: string;
}

interface DecisionMakerRefView {
  contactId: string; contactName: string;
  accountId: string; accountName: string;
}
```

Ended stakeholder links are simply absent. For "who was the main contractor
before this one", use the directory's
`GET /projects/{id}/stakeholders?includeClosed=true`.

### `RegisterProjectResult`

```ts
interface RegisterProjectResult {
  project: ProjectSummaryView & { images: ProjectImageView[] };
  // The same card GET /projects/nearby returns, plus two facts.
  nearbyProjects: (NearbyProjectCardView & {
    projectId: string;
    isYours: boolean;   // "you already registered this"
  })[];
  stakeholderLinkFailures?: { accountId: string; reason: string }[];
}
```

### `ProjectHistoryEntryView`

```ts
type ProjectHistoryEntryView =
  | {
      kind: 'STAGE';
      id: string; projectId: string;
      fromStage: ProjectStage | null; toStage: ProjectStage;
      source: StageChangeSource;
      note: string | null;
      changedAt: string;
      changedBy?: string; changedByUser?: ActorView | null;
    }
  | {
      kind: 'STATUS';
      id: string; projectId: string;
      fromStatus: ProjectStatus; toStatus: ProjectStatus;
      reason: string;
      changedAt: string;
      changedBy?: string; changedByUser?: ActorView | null;
    };
```

### `ActivityView`

```ts
interface ActivityView {
  id: string;
  projectId: string;
  projectName: string;
  kind: ActivityKind;
  channel: ActivityChannel | null;
  purpose: ActivityPurpose;
  outcome: ActivityOutcome;
  occurredAt: string;          // when it happened
  capturedAt: string;          // when it was typed — server-stamped
  latitude: number | null;
  longitude: number | null;
  locationAccuracyM: number | null;
  locationVerified: boolean;   // a fix was supplied AND it lands near the project
  constructionPhaseObserved: ConstructionPhase | null;
  competitorAccountId: string | null;
  competitorName: string | null;
  notes: string;
  personsMet: {
    contactId: string; firstName: string; lastName: string;
    position: string | null; accountId: string; accountName: string;
  }[];
  // StoredFileView + who filed it. Signed like every other file.
  attachments: (StoredFileView & {
    id: string;
    uploadedAt: string;
    uploadedBy?: string;       // stripped for REPRESENTATIVE
  })[];
  nextActionAt: string | null;
  nextActionDoneAt: string | null;
  backdated: boolean;          // logged as > 48h before capture
  backdateApprovedBy?: string | null;
  editedAfterWindow: boolean;  // an edit landed after 24h — see `revisions`
  createdBy?: string;
  createdByUser?: ActorView | null;
  createdAt: string;
  updatedAt: string;
}
```

> **`attachments[].key` is a storage key, not a URL** — unlike a project photo,
> which arrives pre-signed. A list of thirty activities would mean thirty signing
> round trips for files nobody clicks, so exchange the key for a token at the
> moment something is actually opened. See
> [Workflow 11](#workflow-11--reading-an-activity-attachment).

> **`locationVerified: false` is not a problem to chase.** A fix taken inside a
> concrete structure drifts, and phones routinely report 30 m out. Render it as a
> quiet badge at most.

### `ActivityDetailView`

```ts
interface ActivityDetailView extends ActivityView {
  revisions: {
    id: string;
    activityId: string;
    before: Record<string, unknown>;
    after: Record<string, unknown>;
    fields: string[];
    revisedAt: string;
    revisedBy?: string;
    revisedByUser?: ActorView | null;
  }[];
}
```

### `AttentionItemView`

```ts
interface AttentionItemView {
  projectId: string;
  name: string;
  reason: AttentionReason;
  message: string;            // Arabic, composed server-side — render as-is
  dueAt: string | null;       // set only for FOLLOW_UP_DUE
  daysWaiting: number;
}
```

### `SyncActivitiesResult`

```ts
interface SyncActivitiesResult {
  results: {
    clientRef: string;
    status: 'CREATED' | 'DUPLICATE' | 'REJECTED';
    activityId: string | null;
    error: { code: string; message: string } | null;
  }[];
  created: number;
  duplicates: number;
  rejected: number;
}
```

### `OutcomeView`

```ts
interface OutcomeView {
  id: string;
  projectId: string;
  projectName: string;
  type: OutcomeType;
  status: OutcomeStatus;

  // WON
  distributorAccountId: string | null;
  distributor: CounterpartyView | null;
  value: number | null;
  soldAt: string | null;
  categories: ProductCategory[];
  unitsSupplied: number | null;
  unitsTotal: number | null;
  buyerContactId: string | null;

  // LOST — a null competitor means UNKNOWN and nothing else
  competitorAccountId: string | null;
  competitor: CounterpartyView | null;
  lossReason: LossReason | null;
  competitorPrice: number | null;
  narrative: string | null;

  currency: string | null;    // covers `value` and `competitorPrice` alike
  notes: string | null;

  submittedAt: string;
  submittedBy?: string;       // stripped for REPRESENTATIVE
  submittedByUser?: ActorView | null;
  confirmedAt: string | null;
  confirmedBy?: string | null;
  confirmedByUser?: ActorView | null;
  rejectedAt: string | null;
  rejectedBy?: string | null;
  rejectedByUser?: ActorView | null;
  rejectionReason: string | null;

  previousStage: ProjectStage;  // where the project returns to on rejection
}

interface CounterpartyView {
  accountId: string;
  name: string;
  city: string | null;
  isAuthorized: boolean;   // DISTRIBUTOR only: formally appointed, not merely real
}
```

A rep still sees `confirmedAt`, `rejectedAt` and `rejectionReason` — they know
their submission was settled and why, just not by which manager.

### Report views

```ts
interface ReportPeriod { from: string | null; to: string | null }

interface PipelineReportView {
  period: ReportPeriod;
  byStage: {
    stage: ProjectStage;
    projectCount: number;
    estimatedValue: number;
    valuedProjectCount: number;   // how many of them carry an estimate
    currency: string | null;
  }[];
  totalProjects: number;
  totalEstimatedValue: number;
}

interface RepActivityReportView {
  period: ReportPeriod;
  rows: {
    repId: string; repName: string;
    visits: number; communications: number;
    projectsTouched: number;      // DISTINCT projects
    projectsOwned: number;
    projectsGoneQuiet: number;    // owned, open, nothing logged for 21 days
    newProjects: number;
  }[];
}

interface WinLossReportView {
  period: ReportPeriod;
  groupedBy: 'rep' | 'territory' | 'period';
  rows: {
    key: string; label: string;
    won: number; lost: number; cancelled: number;
    winRate: number | null;       // null, never 0, when nothing is decided
    wonValue: number;
  }[];
  totals: { won: number; lost: number; cancelled: number; winRate: number | null; wonValue: number };
}

interface OutletSalesReportView {
  period: ReportPeriod;
  rows: {
    accountId: string; name: string; city: string | null;
    isAuthorized: boolean;
    wins: number; totalValue: number; unitsSupplied: number;
    lastSoldAt: string | null;
  }[];
  totalValue: number;
}

interface LossAnalysisReportView {
  period: ReportPeriod;
  byReason: {
    reason: LossReason; count: number;
    averagePriceGap: number | null;   // percentage, both numbers present only
    priceGapSampleSize: number;
  }[];
  byCompetitor: {
    accountId: string | null;         // null = UNKNOWN, a real row
    name: string;
    losses: number;
    averagePriceGap: number | null;
  }[];
  totalLosses: number;
}
```

---

## 10. Workflows

### Workflow 1 — Upload a file

Every photo and attachment in this module is a **key**. This subsystem never
receives bytes.

```
1.  POST /files                          multipart/form-data, field name "file"
    → 201 { data: { key: "files/image/2026-08-05/9a3e…" } }

2.  Quote the key wherever the file belongs:
    { key: "files/image/…", name: "north-elevation.jpg" }
```

**One file per call, not one call per form.** A rep on a site with two bars of
signal sending five 6 MB photos gets five independent retries instead of one
30 MB request that either completes or is lost — and the registration body itself
stays small JSON that almost always gets through.

Accepted types and size limits are enforced by `POST /files` (10 MB images, 25 MB
audio, 15 MB documents); an oversized file is a `413`.

**Every key is verified against storage before it is attached.** A key that is
not there comes back as `PROJECT_IMAGE_NOT_UPLOADED`, naming exactly which ones —
re-upload those and resubmit.

---

### Workflow 2 — Register a building

```
1.  Capture GPS.                          location: { lat, lng }
2.  Take ≥1 photo   → Workflow 1 per photo
3.  (Optional) pick stakeholders from the directory, flag a decision maker
4.  POST /projects
    → 201 { data: { project, nearbyProjects, stakeholderLinkFailures? } }
```

Then branch on the response:

| Response fact | Your UI |
| --- | --- |
| `nearbyProjects` non-empty | Show "did you mean one of these?" — the project **is already created**. Offer to open a candidate, and note `isYours`. |
| `stakeholderLinkFailures` present | Toast "2 companies could not be linked", queue a fix-up task. Not an error. |
| `project.outsideTerritory === true` | Quiet badge: "outside any mapped territory — back office will assign". Not an error. |
| `403 PROJECT_OUTSIDE_OWN_TERRITORY` | **This one is a refusal.** The GPS is inside another rep's area. Show the territory name from the message and stop. |

---

### Workflow 3 — The rep's daily loop

```
1.  GET /projects/needs-attention?limit=50
    → the home screen, already ranked. Render `message` verbatim.

2.  Rep taps an item →
    GET /projects/{id}              full card + photos + activity log + stakeholders

3.  Rep visits or calls →
    POST /projects/{id}/activities
    → 201 { data: { activity, suggestion } }

4.  If data.suggestion === "SET_DORMANT":
        offer "park this project"  →  PUT /projects/{id}/status { status: "DORMANT", reason }
    If the rep promised to come back:
        nextActionAt was set  →  the project reappears on needs-attention that day
```

**Any activity resets the quiet clock**, so the item drops off the list on its own.

---

### Workflow 4 — Log a visit vs. log a communication

Build **one form** with a kind toggle; only four things differ.

```
VISIT                                    COMMUNICATION
─────                                    ─────────────
kind: "VISIT"                            kind: "COMMUNICATION"
(no channel)                             channel: required
location: { lat, lng, accuracyM }        (omit location)
personsMet: [1 … 20]                     personsMet: [exactly 1]
constructionPhaseObserved: optional      (omit — refused)
notes: ≥ 20 chars                        notes: ≥ 20 chars
```

Client-side guards that save a round trip:

- Block submit under 20 characters of `notes` (after trimming).
- Force exactly one person on a `COMMUNICATION` — three calls are three
  activities.
- Make `nextActionAt` required when `outcome === "TOO_EARLY_REVISIT_LATER"`.
- Offer the competitor picker on `COMPETITOR_ON_SITE`, with an explicit
  "I couldn't tell" option that simply omits the field.
- **Never block on GPS distance.** Submit whatever fix you have, or none.
- Persons met must come from the project's live stakeholders — populate the
  picker from `GET /projects/{id}` → `stakeholders[].primaryContact`, or the
  directory's stakeholder route for the full contact list.

---

### Workflow 5 — Offline capture and sync

```
Offline
  1.  Rep logs activities into local storage.
      Generate a clientRef per item: stable, unique per rep, 8–100 chars.
      e.g. `${userId}-${deviceId}-${localSeq}`

Back online
  2.  POST /activities/sync   { items: [ …up to 100… ] }
      → 200, ALWAYS. Never 4xx for a bad item.

  3.  For each result, matched by clientRef:
        CREATED   → save activityId, delete local record
        DUPLICATE → delete local record (it was already written). Do not retry.
        REJECTED  → keep local record, show error.code, let the rep fix and resend
```

**Retrying the whole batch is always safe** — a replay returns `DUPLICATE`
throughout and writes nothing. If the response is lost, resend the identical
batch.

Also pull the delta while you are online:

```
GET /projects?updatedSince=<last successful sync ISO timestamp>&limit=100
```

Queued writes should carry `expectedVersion` — see
[Workflow 9](#workflow-9--handling-a-version-conflict).

---

### Workflow 6 — Correct an activity

```
1.  GET /activities/{id}
2.  Compute hours since `capturedAt`:
      < 24h  →  edit silently
      ≥ 24h  →  warn: "your manager will see this change", then proceed
3.  PATCH /activities/{id}   { purpose?, outcome?, notes?, personsMet?, nextActionAt?, competitorAccountId? }
```

- Only the **author** may edit — hide the control for everyone else rather than
  letting them hit `403 ACTIVITY_NOT_AUTHOR`.
- `kind`, `channel`, `occurredAt` and the GPS are immutable. Offer "log a new
  activity" instead.
- A late edit is **never refused**. Afterwards `editedAfterWindow: true` and the
  original lives in `revisions`.
- Send `nextActionAt: null` to cancel a promise.

---

### Workflow 7 — Move a project through the funnel

```
PUT /projects/{id}/stage   { stage, note?, expectedVersion? }
```

Render the stage control as a **plain dropdown of all seven open stages**, in
funnel order, with no gating:

```
LEAD → QUALIFIED → ENGAGEMENT → APPROVAL → BOQ_RECEIVED → QUOTE_ISSUED → COMMITTED
```

- **Do not** offer `WON` / `LOST` in the dropdown — they come from an outcome.
  Route those buttons to `POST /projects/{id}/won` / `/lost`.
- **Do not** disable backwards moves or stage skips. Both are valid and both are
  the truth.
- Re-selecting the current stage is a no-op, not an error.
- `note` is optional here — but make it required in your form when the project is
  currently `WON` or `LOST` (see Workflow 10).

---

### Workflow 8 — Close a deal

```
Rep                                        Manager (a different person)
───                                        ────────────────────────────
POST /projects/{id}/won                    GET /outcomes?status=PENDING
  or  /lost                                  (oldest first — the queue)
→ 201, status: PENDING                     ↓
  project.stage has NOT moved              GET /outcomes/{id}
                                           ↓
                                    ┌──── POST /outcomes/{id}/confirm
                                    │       → 200, status: CONFIRMED
                                    │       → project.stage becomes WON / LOST
                                    │         (same transaction, source: OUTCOME_CONFIRMED)
                                    │
                                    └──── POST /outcomes/{id}/reject { reason }
                                            → 200, status: REJECTED
                                            → project returns to `previousStage`
```

Client rules:

- After submitting, show the project as **"awaiting confirmation"**, driven by
  the outcome's `status`, **not** by the project's stage — the stage is still
  `COMMITTED`.
- Hide the *Confirm* button when `submittedBy === currentUserId`, and for anyone
  below `SALES_MANAGER`, rather than surfacing
  `403 PROJECT_OUTCOME_SELF_CONFIRMATION`. For a representative `submittedBy` is
  redacted — in that case simply never render the button.
- **Show *Reject* to the submitter too.** Label it *Withdraw*. A rep may take
  back their own submission; making them find a manager makes them stop
  submitting.
- On rejection, show `rejectionReason` to the rep and offer *submit again* — a
  rejected outcome is meant to be superseded.
- Only one open outcome per project: a second submission while one is `PENDING`
  or `CONFIRMED` is `409 PROJECT_OUTCOME_ALREADY_OPEN`.

**Won vs. cancelled — the branch that matters most.**

```
Did a competitor take it?
├── Yes  →  POST /projects/{id}/lost   { someoneElseWon: true, reason, … }
└── No, the building died / work stopped / scope removed
          →  PUT /projects/{id}/status { status: "CANCELLED", reason }
```

Never offer "lost — nobody won". It is refused, and mixing the two is what
destroys win rate.

---

### Workflow 9 — Handling a version conflict

```
1.  Read a project → keep `version`
2.  Write with     → expectedVersion: <that version>
3.  On 409 PROJECT_VERSION_CONFLICT:
      a. GET /projects/{id}            re-read
      b. Show the rep what changed underneath them
      c. Re-apply their edit on the fresh version, or discard it
      d. Retry with the NEW version
```

**Never retry the same body on a 409** — the version will not have changed.

Send `expectedVersion` on anything queued offline. It is optional for a
foreground edit made seconds after a fetch.

---

### Workflow 10 — Reopen a closed project

Only a `SALES_MANAGER`+ can leave `WON` or `LOST`, and only with a note.

```
PUT /projects/{id}/stage
{ "stage": "COMMITTED", "note": "أعيد فتح الصفقة بعد اعتراض المالك على التوريد", "expectedVersion": 12 }
```

- Hide the control entirely for a representative.
- Make `note` a **required** field in this form (`10 … 500`, no `< > ; " '`).
- Warn that this re-enters reports a closed month may already have been drawn
  from.

The same applies to reviving a `CANCELLED` project via
`PUT /projects/{id}/status` → `ACTIVE`.

---

### Workflow 11 — Reading a file whose URL has expired

**Every file — project photo, nearby-building photo, activity attachment, upload
result — arrives pre-signed.** Use `url` directly; it is a Cloudinary address and
needs no Authorization header. Nothing has to be exchanged before a first render.

The one thing to handle is `url` running out after **30 minutes**, which is what
`key` is for:

```
POST /files/resolve   { "key": "files/document/2026-08-06/49fd…pdf" }
  → 200 { data: { key, name, contentType, byteSize, url, urlExpiresAt } }
```

Same object, fresh 30-minute URL. Resolve at the moment the user opens the file,
not when the list loads — the clock starts when it is issued.

> **The download-token flow is gone.** `GET /files/download/{token}` and the
> five-minute JWT behind it no longer exist. Bytes come from Cloudinary's CDN
> now; this API never proxies them. If you have a client minting tokens, point it
> at the `url` field instead.

Attachments cannot be removed. An activity is evidence and already append-only.

---

### Workflow 12 — Managing project photos

```
Add    :  Workflow 1 per photo  →  POST /projects/{id}/images { files: [ … ] }
           → 201, data = the NEW images only (not the gallery)
Remove :  DELETE /projects/{id}/images/{imageId}
           → 200, data.message
```

- The ceiling is **10 live photos**. `imageCount` on the project is the number to
  check against it — not `images.length`.
- **Disable delete when `imageCount === 1`.** The last photo cannot be removed
  (`PROJECT_IMAGE_REQUIRED`).
- Signed URLs expire (`urlExpiresAt`). Re-fetch the project rather than caching
  URLs across sessions.

---

### Workflow 13 — Manager review of late edits

```
GET /activities?editedAfterWindowOnly=true&occurredFrom=…&limit=50
  → the review queue

GET /activities/{id}
  → `revisions[]` carries { before, after, fields, revisedAt, revisedBy }
```

Render a field-by-field diff from `fields`, `before` and `after`. This is what an
ownership dispute over a visit is settled with, and it is why late edits are kept
rather than refused.

---

### Workflow 14 — Reading the reports

```
GET /reports/pipeline?from=…&to=…&territoryId=…&ownerId=…
GET /reports/rep-activity?…
GET /reports/win-loss?…&groupBy=rep|territory|period
GET /reports/sales-by-outlet?…
GET /reports/loss-analysis?…
```

- Gate the whole reports area behind `role >= SALES_MANAGER`.
- Do not offer a "scope" selector — scope follows the role. Offer `ownerId` as a
  *narrow to one rep* filter only.
- Render `winRate: null` as `—`, never `0%`.
- Render `valuedProjectCount` beside `estimatedValue`, and `priceGapSampleSize`
  beside `averagePriceGap`.
- Keep the `UNKNOWN` competitor row and the zero-activity rep rows.

---

### Workflow 15 — Back office's territory-gap worklist

```
GET /projects?outsideTerritoryOnly=true&limit=100
```

Buildings whose GPS fell inside no drawn territory. They were **accepted on
purpose** — losing a rep's claim over a mapping gap would be the wrong trade.
Resolve by drawing/extending a territory, or by
`PUT /projects/{id}/location` (manager) if the pin itself was wrong.

---

## 11. Error codes

Every code below arrives in the [standard error envelope](#15-error-envelope) as
`error.code`.

### Role-related failures at a glance

| Code | Status | Who triggers it |
| --- | --- | --- |
| *(no code — plain guard 403)* | 403 | Below the route gate: a rep on `/reports/*`, `PUT …/location`, `POST /outcomes/{id}/confirm` |
| `PROJECT_NOT_FOUND` | 404 | A rep touching someone else's project · **a rep reviving a `CANCELLED` project** |
| `PROJECT_NOT_ACCESSIBLE` | 403 | `SALES_ADMIN` / `GENERAL_MANAGER` attempting any write |
| `PROJECT_LOCATION_REQUIRES_MANAGER` | 403 | `SALES_ADMIN` / `GENERAL_MANAGER` moving a pin |
| `PROJECT_CONFIRMATION_REQUIRES_MANAGER` | 403 | `SALES_ADMIN` / `GENERAL_MANAGER` settling an outcome; a rep rejecting someone else's |
| `PROJECT_OUTCOME_SELF_CONFIRMATION` | 403 | A manager confirming their own submission |
| `PROJECT_REOPEN_REQUIRES_MANAGER` | 403 | A rep leaving `WON`/`LOST`, or a manager doing it with no note |
| `ACTIVITY_BACKDATING_NEEDS_MANAGER` | 403 | A rep logging something > 48 h old |
| `ACTIVITY_NOT_AUTHOR` | 403 | Anyone, at any rank, editing someone else's activity |
| `PROJECT_OUTSIDE_OWN_TERRITORY` | 403 | A rep registering outside their territory (managers exempt) |

### Projects

| Code | Status | Meaning / client action |
| --- | --- | --- |
| `VALIDATION_ERROR` | 400 | A DTO rule failed. `message` names the **first** failure only. |
| `PROJECT_NOT_FOUND` | 404 | No such project — **or one you may not see** |
| `PROJECT_NOT_ACCESSIBLE` | 403 | You can read it, but your role does not work deals |
| `PROJECT_INVALID_NAME` | 400 | Domain-level name rule |
| `PROJECT_INVALID_DESCRIPTION` | 400 | Domain-level description rule |
| `PROJECT_INVALID_LOCATION` | 400 | Off the earth, or `(0,0)` — a phone with no fix |
| `PROJECT_INVALID_MONEY` | 400 | Amount/currency rule |
| `PROJECT_INVALID_REASON` | 400 | A reason/note failed the domain rule |
| `PROJECT_IMAGE_REQUIRED` | 400 | Registering with no photo, **or removing the last one** |
| `PROJECT_IMAGE_NOT_UPLOADED` | 400 | A quoted `key` is not in storage — re-upload and resubmit |
| `PROJECT_TOO_MANY_IMAGES` | 400 | Ceiling is 10 live photos |
| `PROJECT_IMAGE_NOT_FOUND` | 404 | — |
| `PROJECT_OUTSIDE_OWN_TERRITORY` | 403 | GPS falls in another rep's area (managers exempt) |
| `PROJECT_STAGE_REQUIRES_OUTCOME` | 400 | `WON`/`LOST` come from a confirmed outcome |
| `PROJECT_REOPEN_REQUIRES_MANAGER` | 403 | Leaving `WON`/`LOST` needs a manager **and** a note |
| `PROJECT_LOCATION_REQUIRES_MANAGER` | 403 | Moving a registered building |
| `PROJECT_VERSION_CONFLICT` | 409 | Re-read, re-apply, retry with the new `version` |
| `PROJECT_CANCELLED` | 409 | The project is written off — reopen it first |

### Activities

| Code | Status | Meaning |
| --- | --- | --- |
| `ACTIVITY_NOT_FOUND` | 404 | No such activity, or one on a project you may not see |
| `ACTIVITY_NOTES_TOO_SHORT` | 400 | Under 20 characters after trimming |
| `ACTIVITY_CHANNEL_REQUIRED` | 400 | A `COMMUNICATION` must say how |
| `ACTIVITY_CHANNEL_NOT_ALLOWED` | 400 | A `VISIT` happened in person |
| `ACTIVITY_PERSONS_MET_REQUIRED` | 400 | ≥1 on a visit, exactly 1 on a communication |
| `ACTIVITY_NEXT_ACTION_REQUIRED` | 400 | `TOO_EARLY_REVISIT_LATER` needs a date |
| `ACTIVITY_COMPETITOR_REQUIRED` | 400 | Competitor named on a non-competitor outcome |
| `ACTIVITY_PHASE_OBSERVATION_NOT_ALLOWED` | 400 | Phase comes from a `VISIT` only |
| `ACTIVITY_OCCURRED_IN_FUTURE` | 400 | Beyond 5 minutes of clock skew |
| `ACTIVITY_BACKDATING_NEEDS_MANAGER` | 403 | More than 48 h back |
| `ACTIVITY_NOT_AUTHOR` | 403 | Only whoever logged it may correct it |
| `ACTIVITY_CONTACT_NOT_ON_PROJECT` | 400 | Person not reachable through the stakeholders |

### Outcomes

| Code | Status | Meaning |
| --- | --- | --- |
| `OUTCOME_NOT_FOUND` | 404 | — |
| `PROJECT_DISTRIBUTOR_REQUIRED` | 400 | A win must name the outlet |
| `PROJECT_DISTRIBUTOR_NOT_FOUND` | 404 | That account carries no active `DISTRIBUTOR` classification |
| `PROJECT_COMPETITOR_NOT_FOUND` | 404 | That account is not on the competitor list |
| `PROJECT_LOSS_REQUIRES_WINNER` | 400 | Nobody won — cancel the project instead |
| `PROJECT_LOSS_PRICE_REQUIRED` | 400 | `reason: PRICE` needs `competitorPrice` |
| `PROJECT_UNITS_EXCEED_TOTAL` | 400 | `unitsSupplied > unitsTotal` |
| `PROJECT_OUTCOME_ALREADY_OPEN` | 409 | One open-or-confirmed outcome per project |
| `PROJECT_OUTCOME_ALREADY_SETTLED` | 409 | Already confirmed or rejected |
| `PROJECT_OUTCOME_SELF_CONFIRMATION` | 403 | **The four-eyes rule** |
| `PROJECT_CONFIRMATION_REQUIRES_MANAGER` | 403 | Only a manager settles an outcome |

### The three codes worth writing explicit handlers for

| Code | Why |
| --- | --- |
| `PROJECT_VERSION_CONFLICT` | Routine, not exceptional, on an offline client. Needs a re-read-and-reapply flow, not a retry. |
| `PROJECT_IMAGE_NOT_UPLOADED` | Recoverable: re-upload the named keys and resubmit the same form. |
| `ACTIVITY_CONTACT_NOT_ON_PROJECT` | The rep's contact picker is stale — refresh the stakeholder roster and let them re-pick. |

---

## 12. Known issues

### `GET /projects/needs-attention` is shadowed by `GET /projects/{id}`

**Status: confirmed by test, unfixed at the time of writing.**

`ProjectController` is registered before `ActivityController` in
[`project.module.ts:170-175`](../../src/project/project.module.ts#L170-L175).
Express matches in registration order, so `GET /projects/needs-attention` is
matched by `ProjectController`'s `@Get(':id')` and fails its `ParseUUIDPipe`:

```json
{
  "success": false,
  "message": "Validation failed (uuid is expected)",
  "error": { "code": "VALIDATION_ERROR", "statusCode": 400 },
  "meta": { "…": "…" }
}
```

The per-controller "ROUTE ORDER MATTERS" comments are correct within each
controller, but ordering across two controllers is decided by the `controllers`
array, and `needs-attention` lives on `ActivityController` while `:id` lives on
`ProjectController`.

**Fix (backend, one line):** list `ActivityController` before `ProjectController`
in the module's `controllers` array, or move the `needs-attention` handler into
`ProjectController` above `@Get(':id')`.

**Until then:** the rep home screen cannot be built on this route. Nothing else in
the module is affected — no other cross-controller path collides.
