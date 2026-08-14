# Mobile API Integration Specification — Accounts, Contacts & Project Linkage
### The `REPRESENTATIVE` surface only

**Scope:** creating and updating **accounts** and **contacts**, and wiring both into a **project** — restricted to what a `REPRESENTATIVE` can actually reach.
**Source of truth:** `src/directory/**`, `src/common/interceptors/**`, `src/auth/domain/model/user-role.ts`.
**Companion:** [catalog-mobile-integration.md](catalog-mobile-integration.md) — §2–§3 there (base URL, envelope, auth headers, refresh, rate limit) apply here unchanged and are **not repeated**.

### Label key

| Label | Meaning |
| --- | --- |
| **[C]** | Confirmed — readable directly in the backend source. |
| **[I]** | Inferred — implied by the code, not stated. |
| **REQUIRES BACKEND CONFIRMATION** | Not determinable from the source. |

> Everything below assumes `role = REPRESENTATIVE`. Routes reachable only by `SALES_MANAGER`+ are listed once, in §2, so you know they exist and do **not** build UI for them.

---

## 1. Why this module is shaped the way it is

**[C]** The directory resolves a deliberate tension, stated verbatim in `directory-authorization.ts:46-60`:

- **A3** — representatives may not edit master data.
- **SH6** — representatives *create* accounts and contacts, because **they meet people first**.

The resolution: **"create and correct your own" is a rep capability; "correct anyone's" belongs to the tiers above.**

Three consequences that drive every screen you will build:

1. **A rep contributes records and manages what they contributed, but reads almost nothing they did not add.**
2. **A rep's entry lands unchecked** — `isVerified: false` on an account, `isAuthorized: false` on a DISTRIBUTOR — and waits for a manager to confirm it. This is normal, not an error state.
3. **A rep never sees who did what.** `RedactActorAttributionInterceptor` strips every attribution field before a rep sees the response (§4.3).

**[C]** Both `AccountsController` and `ContactsController` carry a **class gate of `SALES_MANAGER`**, with individual routes let *down* to `REPRESENTATIVE`. This is deliberate and stated in the source: a route added later is **closed to reps by default** rather than open by omission. `ProjectStakeholdersController` is the opposite — class gate `REPRESENTATIVE`, every route open.

---

## 2. ⚠️ The rep permission map — read this before designing anything

### 2.1 Reachable by a `REPRESENTATIVE`

| # | Method | Path | Notes |
| --- | --- | --- | --- |
| A1 | `POST` | `/accounts` | Create. May inline `classification` + up to 20 `contacts`. |
| A2 | `GET` | `/accounts` | **Must send `search` or `classification`.** Page cap **25**. |
| A3 | `PATCH` | `/accounts/{id}` | **Own records only** → else `403 ACCOUNT_NOT_OWNER`. |
| A4 | `POST` | `/accounts/{id}/classifications` | Rep's DISTRIBUTOR arrives unappointed. |
| A5 | `GET` | `/accounts/{id}/contacts` | Roster — **narrowed to contacts the rep added**. |
| C1 | `POST` | `/contacts` | `accountId` **optional**. |
| C2 | `GET` | `/contacts` | **Must send `search`.** Page cap **25**. Own contacts only. |
| C3 | `GET` | `/contacts/{id}` | Own only → else **404** (not 403). |
| C4 | `PATCH` | `/contacts/{id}` | Own only. |
| C5 | `DELETE` | `/contacts/{id}` | Archive (soft). Own only. Needs `reason`. |
| C6 | `PUT` | `/contacts/{id}/account` | File or move. Own only. |
| P1 | `POST` | `/projects/{projectId}/stakeholders` | Link an account in a role. |
| P2 | `GET` | `/projects/{projectId}/stakeholders` | |
| P3 | `PATCH` | `/projects/{projectId}/stakeholders/{linkId}` | Contact + note only. **Role is immutable.** |
| P4 | `DELETE` | `/projects/{projectId}/stakeholders/{linkId}` | Close link. Needs `reason`. |
| P5 | `POST` | `/projects/{projectId}/stakeholders/{linkId}/replace` | Close + open in one act. Needs `reason`. |
| P6 | `PUT` | `/projects/{projectId}/decision-maker` | Set or move the flag. |
| P7 | `GET` | `/projects/{projectId}/decision-maker` | `null` is a normal answer. |
| P8 | `DELETE` | `/projects/{projectId}/decision-maker` | Refused from Engagement onwards. |
| P9 | `GET` | `/projects/{projectId}/decision-maker/history` | Paginated. |

### 2.2 ⛔ NOT reachable — do not build UI for these

**[C]** All of these fall through to the `SALES_MANAGER` class gate and return **`403 Forbidden`** (`error.code: "Forbidden"`, `message: "Forbidden resource"`) for a rep.

| Method | Path | Why it matters to you |
| --- | --- | --- |
| **`GET`** | **`/accounts/{id}`** | ⚠️ **See §2.3 — this is the big one.** |
| `POST` | `/accounts/{id}/verify` | A rep cannot verify, not even their own entry. |
| `DELETE` | `/accounts/{id}` | A rep cannot archive an account. |
| `GET` | `/accounts/{id}/projects` | A rep has **no cross-project view of an account** (SH1). |
| `GET` | `/accounts/duplicates` | |
| `GET` | `/accounts/quality-signals` | |
| `POST` | `/accounts/{id}/classifications/{c}/authorize` | Appointment is a manager's act. |
| `DELETE` | `/accounts/{id}/classifications/{c}` | No withdrawal by a rep. |
| all | `/account-merges/*` | Merging is back office's. |

### 2.3 ⚠️ A rep cannot read a single account by id

**[C]** `AccountsController.getOne` (`accounts.controller.ts:326-336`) carries **no `@MinRole(REPRESENTATIVE)` override**, so it inherits the class gate. A rep calling `GET /accounts/{id}` gets **403**.

**Consequences you must design around:**

| What you lose | Where to get it instead |
| --- | --- |
| The full account record | `GET /accounts?search=…` → the **list row** (`AccountListItemView`) carries everything `AccountWithCountsView` has, **plus** open `classifications`. |
| `contacts[]` embedded in the account | `GET /accounts/{id}/contacts` (A5) — narrowed to the rep's own. |
| Full classification **history** (closed periods) | **Unavailable to a rep.** The list carries **open periods only**. |
| `resolvedFrom` — the merge redirect | **Unavailable to a rep.** See §10 BR-9. |

**[I] Therefore: build the account "detail" screen from a cached list row + the roster call.** There is no single-account fetch. If the user deep-links to an account id you no longer hold a row for, you must re-find it by search — there is no id-based read.

### 2.4 The two per-record narrowings

**[C]** Route access and record access answer different questions, and both apply:

| Rule | Function | Effect on a rep |
| --- | --- | --- |
| **Edit narrowing** | `assertMayEditRecord` | May PATCH/DELETE only records they created → else `403 ACCOUNT_NOT_OWNER` with message *"Only whoever added this record (or back office) may {operation} it"*. **Never a partial write.** |
| **Read narrowing** | `narrowContactsForActor` / `maySeeAllContacts` | Contact reads return **only contacts the rep created**. Filters rather than refuses — an empty list, not a 403. |

**[C]** `GET /contacts/{id}` on someone else's contact is **404, not 403** — deliberately, because a 403 would confirm that the id names a real person at a company the rep cannot otherwise read.

---

## 3. Authentication & headers

**[C]** Identical to the catalogue surface — see [catalog-mobile-integration.md §3](catalog-mobile-integration.md).

| Header | Required | Value |
| --- | --- | --- |
| `Authorization` | Yes | `Bearer <accessToken>` |
| `X-Device-Id` | Yes | Must equal the token's `deviceId` claim |
| `Content-Type` | Yes, on every write | `application/json` |

**[C]** All nine catalogue endpoints were reads. **Here 11 of the 20 rep-reachable routes are writes**, which changes the risk profile of the auth interceptor: a 401 mid-`POST` must **not** be blind-retried after refresh unless the write is safe to repeat. See §14.5.

**[C]** Global rate limit: **30 requests / 60 s per user, shared with the catalogue surface**.

---

## 4. Envelope, pagination and the redaction layer

### 4.1 Success envelope

**[C]** The directory controllers return `{ message, data }` (and `{ message, data, pagination }` on lists), so they take the interceptor's **flat branch** — unlike `GET /products`. The envelope is the standard one:

```json
{
  "success": true,
  "message": "Account created successfully",
  "data": { },
  "meta": { "timestamp": "…", "path": "…", "correlationId": "…" }
}
```

**[C]** Paginated reads (`GET /accounts`, `GET /contacts`, `GET …/decision-maker/history`) put `pagination` **beside** `data`:

```json
{
  "success": true,
  "message": "Accounts retrieved successfully",
  "data": [ /* rows */ ],
  "pagination": { "total": 37, "page": 1, "limit": 25, "totalPages": 2 },
  "meta": { … }
}
```

⚠️ **[C] This is the *opposite* of `GET /products`**, which nests everything under `data` with no `pagination` key. **Do not reuse the catalogue's paginated response model here.** Two shapes, two parsers.

### 4.2 Two return shapes on the same resource

⚠️ **[C]** `POST /accounts` and `PATCH /accounts/{id}` do **not** return the same thing:

| Endpoint | `data` is | Type |
| --- | --- | --- |
| `POST /accounts` | `{ account, classification?, contacts?, duplicateCandidates? }` | **wrapper object** |
| `PATCH /accounts/{id}` | the account itself | `AccountWithCountsView` |

**[I]** So `POST` needs `response.data.account`, `PATCH` needs `response.data`. This trips every client that assumes create and update are symmetric.

**[C]** Contacts are consistent — `POST /contacts`, `PATCH /contacts/{id}` and `PUT /contacts/{id}/account` all return `ContactView` directly as `data`.

### 4.3 ⚠️ Actor attribution is stripped for representatives

**[C]** `RedactActorAttributionInterceptor` walks every response and **deletes any key ending in `By` or `ByUser`** before a `REPRESENTATIVE` sees it. Matched **by shape, not by a list**, so new columns are redacted automatically.

**Fields a rep will never receive:**

| On | Removed keys |
| --- | --- |
| Account | `createdBy`, `createdByUser`, `verifiedBy`, `verifiedByUser`, `archivedBy`, `archivedByUser` |
| Contact | `createdBy`, `createdByUser`, `archivedBy`, `archivedByUser` |
| Classification | `addedBy`, `addedByUser`, `authorizedBy`, `authorizedByUser`, `removedBy`, `removedByUser` |
| Stakeholder link | `linkedBy`, `linkedByUser`, `endedBy`, `endedByUser` |
| Decision-maker period | `setBy`, `setByUser`, `endedBy`, `endedByUser` |

**[C] What survives:** `verifiedAt`, `archivedAt`, `addedAt`, `authorizedAt`, `setAt`, `endedAt`, `changeReason`, `endReason`, `removalReason`, and **`replacedByLinkId`** (it names a link, not a person).

**[I] Mobile consequences:**
- Model every `…By` / `…ByUser` field as **optional/nullable in Dart** — they are absent for reps and present for managers, and the same DTO may serve both if the app is ever used by a manager.
- You **cannot** render "added by X" or "verified by X" anywhere in the rep app.
- The decision-maker history still reads as a history: *what changed, when and why* — just never *who*.
- **[C]** `createdBy` was only ever going to be the rep's own id anyway, since their reads are already narrowed to their own records.

---

## 5. Common error contract

**[C]** `DirectoryDomainExceptionFilter` reproduces the global envelope exactly:

```json
{
  "success": false,
  "message": "Only whoever added this record (or back office) may update it",
  "error": { "code": "ACCOUNT_NOT_OWNER", "statusCode": 403 },
  "meta": { "timestamp": "…", "path": "/api/v1/accounts/…", "correlationId": "…" }
}
```

⚠️ **[C] Only `code`, `statusCode` and `message` are serialised.** Several error classes carry extra public fields (`survivingAccountId`, `accountId`, `contactId`, `operation`) that **never reach the client** — except where they were deliberately baked into the message text (§5.2).

### 5.1 Complete code table for the rep surface

| HTTP | `error.code` | Raised when |
| --- | --- | --- |
| **400** | `VALIDATION_ERROR` | DTO validation (lengths, enums, uuid format, unknown property). |
| 400 | `ACCOUNT_INVALID_NAME` | Name < 2, > 200, control chars, or nothing left after folding punctuation/legal forms. |
| 400 | `ACCOUNT_INVALID_REGISTRATION_NUMBER` | Arabic-Indic digits, non-alphanumeric, or length outside 3–40 after stripping separators. |
| 400 | `CONTACT_INVALID_NAME` | First/last < 2, > 80, or control chars. |
| 400 | `CONTACT_INVALID_PHONE` | **Arabic-Indic digits**, disallowed characters, or digit count outside 7–15. |
| 400 | `CONTACT_INVALID_EMAIL` | Fails the shape check, or > 254 chars. |
| 400 | `STAKEHOLDER_INVALID_REASON` | Reason < 10, > 500, or contains `< > ; ' "`. |
| 400 | `ACCOUNT_INVALID_CLASSIFICATION` | Unknown classification value. |
| 400 | `ACCOUNT_ARCHIVED` | Target account is archived. |
| 400 | `CONTACT_ARCHIVED` | Target contact is archived. |
| 400 | `CONTACT_UNATTACHED_CANNOT_BE_PRIMARY` | `isPrimary: true` on a contact with no `accountId`. |
| 400 | `CONTACT_NOT_ON_ACCOUNT` | `primaryContactId` belongs to a different account. |
| 400 | `STAKEHOLDER_LINK_CLOSED` | Operating on an already-closed link. |
| 400 | `CONTACT_NOT_ON_PROJECT` | Decision-maker contact's account has no live link on the project — **including an unfiled contact**. |
| 400 | `DECISION_MAKER_REQUIRED_AT_STAGE` | `DELETE /decision-maker` at Engagement or beyond. |
| **403** | `ACCOUNT_NOT_OWNER` | Editing a record the rep did not create. |
| 403 | `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE` | Project is neither owned nor supported by the rep. |
| 403 | `Forbidden` | Route above the rep's tier (§2.2). `message: "Forbidden resource"`. |
| **404** | `ACCOUNT_NOT_FOUND` | Unknown account id. |
| 404 | `CONTACT_NOT_FOUND` | Unknown contact id — **or somebody else's contact**. |
| 404 | `STAKEHOLDER_LINK_NOT_FOUND` | Unknown link id. |
| 404 | `DECISION_MAKER_NOT_SET` | No flag to clear. |
| 404 | `STAKEHOLDER_PROJECT_NOT_FOUND` | Project not found, **or not visible to the rep**. |
| **409** | `ACCOUNT_ALREADY_MERGED` | Account was merged away. **Survivor id is in the message text.** |
| 409 | `ACCOUNT_ALREADY_CLASSIFIED` | Classification already carried (**`POST` only** — `PATCH` is a no-op). |
| 409 | `STAKEHOLDER_ALREADY_LINKED` | Active link already exists for (project, account, role). |
| 409 | `CONTACT_IS_DECISION_MAKER` | Archiving or re-filing a contact who holds the flag. |
| 409 | `ACCOUNT_HAS_ACTIVE_LINKS` | (manager-only archive) |
| **429** | `RATE_LIMIT_EXCEEDED` | 30 / 60 s. |
| **401** | *(auth codes)* | See catalogue spec §6.1. |

### 5.2 `ACCOUNT_ALREADY_MERGED` — the survivor id is in the message

**[C]** The error class carries `survivingAccountId` as a public field, but the filter drops it. It survives **only** because it was written into the message:

```json
{
  "success": false,
  "message": "This account was merged into 7f3a9c2e-1b4d-4e6a-8c9f-0d1e2b3c4a55; use the surviving account instead",
  "error": { "code": "ACCOUNT_ALREADY_MERGED", "statusCode": 409 }
}
```

⚠️ **[I]** Extracting the uuid means **parsing a human-readable message** — fragile, and the standing rule of this API is *never branch on `message`*. **Recommendation:** on this code, do **not** parse. Show *"This account has been merged; please search for it again"* and send the user back to search. See §16-Q2.

### 5.3 Project access: 403 or 404?

⚠️ **REQUIRES BACKEND CONFIRMATION.** Two mutually exclusive behaviours exist in the source:

- `ProjectStakeholdersController`'s class comment states: *"Asking about a project you may not see returns **404, not 403**"* — decided by subsystem 04.
- `ProjectNotAccessibleError` exists, is mapped to **403** `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE`, and is reachable.

**[I] Handle both identically:** treat `404 STAKEHOLDER_PROJECT_NOT_FOUND` and `403 STAKEHOLDER_PROJECT_NOT_ACCESSIBLE` as *"this project is not yours"* → pop to the project list and refresh it.

---

## 6. Accounts

### 6.1 `POST /accounts` — create (A1)

#### Purpose

**[C]** Record a company or person the rep just met. **Never blocked for resembling an existing account** — refusing here "would only teach reps to type *Al Amal 2*" (SH6).

#### HTTP

```text
POST /api/v1/accounts        → 201 Created
```

#### Request body — `CreateAccountDto`

| Field | Type | Required | Validation | Notes |
| --- | --- | --- | --- | --- |
| `name` | String | **Yes** | 2–200, trimmed, no control chars | Stored exactly as typed, punctuation and legal forms kept. |
| `type` | Enum | No | `COMPANY` \| `INDIVIDUAL` | **Defaults to `COMPANY`.** |
| `registrationNumber` | String \| null | No | ≤ 40; **western digits only**; 3–40 A–Z0–9 after separators stripped | Normalised to upper case. |
| `phone` | String \| null | No | ≤ 30; **western digits only**; 7–15 digits; optional leading `+`; separators ` `, `-`, `.` | Stored normalised. |
| `email` | String \| null | No | ≤ 254; lower-cased | Pragmatic shape check, not RFC 5322. |
| `city` | String \| null | No | ≤ 120 | |
| `addressLine` | String \| null | No | ≤ 300 | |
| `notes` | String \| null | No | ≤ 2000 | |
| `classification` | Enum | No | `PROJECT_STAKEHOLDER` \| `DISTRIBUTOR` \| `COMPETITOR` | Opens a period in the same call. |
| `contacts` | Array | No | **max 20**, each an `AddContactDto` | One visit, one request. |

**[C]** Every string field is trimmed; **`""` is normalised to `null`** (`trimToNull`), except `name` which is only trimmed.

**[C]** An unknown `classification` is refused **before the account is written** — a 400 never leaves a half-created account behind. Likewise **all contacts are validated before the account is written**: a bad phone on the third person creates *nothing*.

**[C]** `contacts[].isPrimary` is applied **in array order — if two entries claim it, the last wins.**

#### Nested `contacts[]` — `AddContactDto`

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `firstName` | String | **Yes** | 2–80 |
| `lastName` | String | **Yes** | 2–80 |
| `position` | String \| null | No | ≤ 120 |
| `phone` | String \| null | No | as above |
| `email` | String \| null | No | ≤ 254 |
| `notes` | String \| null | No | ≤ 2000 |
| `isPrimary` | Boolean | No | default `false` |

**[C]** No `accountId` and no `company` here — the account being created is the one they belong to.

#### Request example

```json
{
  "name": "Al-Amal Contracting Co.",
  "type": "COMPANY",
  "phone": "+963 11 234 5678",
  "city": "Damascus",
  "addressLine": "Mazzeh highway, building 12",
  "notes": "Deals only through their Aleppo office.",
  "classification": "PROJECT_STAKEHOLDER",
  "contacts": [
    { "firstName": "Ahmad", "lastName": "Al Sayed", "position": "Purchasing Manager", "phone": "0991234567", "isPrimary": true },
    { "firstName": "Rana", "lastName": "Haddad", "position": "Site Engineer", "phone": "0997654321" }
  ]
}
```

#### Success response `201`

```json
{
  "success": true,
  "message": "Account created successfully",
  "data": {
    "account": {
      "id": "3f2504e0-4f89-41d3-9a0c-0305e82c3301",
      "name": "Al-Amal Contracting Co.",
      "type": "COMPANY",
      "registrationNumber": null,
      "phone": "+963112345678",
      "email": null,
      "city": "Damascus",
      "addressLine": "Mazzeh highway, building 12",
      "notes": "Deals only through their Aleppo office.",
      "isVerified": false,
      "verifiedAt": null,
      "createdAt": "2026-08-14T08:12:03.114Z",
      "updatedAt": "2026-08-14T08:12:03.114Z",
      "archivedAt": null,
      "mergedIntoId": null,
      "mergedAt": null,
      "contactCount": 2,
      "activeLinkCount": 0
    },
    "classification": {
      "id": "9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb6d",
      "accountId": "3f2504e0-4f89-41d3-9a0c-0305e82c3301",
      "classification": "PROJECT_STAKEHOLDER",
      "isAuthorized": false,
      "authorizedAt": null,
      "addedAt": "2026-08-14T08:12:03.114Z",
      "removedAt": null,
      "removalReason": null
    },
    "contacts": [
      {
        "id": "c0a80101-0000-4000-8000-000000000001",
        "accountId": "3f2504e0-4f89-41d3-9a0c-0305e82c3301",
        "account": { "id": "3f2504e0-…", "name": "Al-Amal Contracting Co.", "type": "COMPANY" },
        "company": null,
        "firstName": "Ahmad", "lastName": "Al Sayed",
        "position": "Purchasing Manager",
        "phone": "0991234567", "email": null, "notes": null,
        "isPrimary": true,
        "createdAt": "2026-08-14T08:12:03.114Z",
        "updatedAt": "2026-08-14T08:12:03.114Z",
        "archivedAt": null
      },
      { "id": "c0a80101-0000-4000-8000-000000000002", "…": "…", "isPrimary": false }
    ]
  },
  "meta": { … }
}
```

> Attribution fields (`createdBy`, `createdByUser`, `verifiedBy`, `addedBy`, …) are **absent** — stripped for reps (§4.3).

#### Role-dependent outcomes

**[C]** Neither is a refusal:

| | Rep | `SALES_MANAGER`+ |
| --- | --- | --- |
| `account.isVerified` | **`false`** — waits for `POST /accounts/{id}/verify` | `true` on the spot |
| `classification.isAuthorized` (DISTRIBUTOR) | **`false`** — waits for the authorize call | `true` on the spot |
| `duplicateCandidates` key | **absent entirely** (not `undefined`, not `[]`) | present when candidates exist |

**[C]** Duplicate *detection* still runs for a rep — the event and back office's merge queue are fed regardless. Only the **list** is withheld, because near-duplicates name accounts on another rep's patch.

#### Keys present only conditionally

**[C]** `classification`, `contacts` and `duplicateCandidates` are **spread in**, so the key is *absent* when not applicable rather than `null`. **[I]** In Dart, check `containsKey`, not `!= null`.

#### Errors

| HTTP | Code | Mobile action |
| --- | --- | --- |
| 400 | `VALIDATION_ERROR`, `ACCOUNT_INVALID_NAME`, `ACCOUNT_INVALID_REGISTRATION_NUMBER`, `CONTACT_INVALID_*`, `ACCOUNT_INVALID_CLASSIFICATION`, `CONTACT_UNATTACHED_CANNOT_BE_PRIMARY` | Map to the offending field; **nothing was created** — the form can be corrected and resubmitted safely. |
| 401 / 429 | — | §14 |

**[C]** **No 409 on a similar name.** Duplicates never block creation.

---

### 6.2 `PATCH /accounts/{id}` — correct (A3)

#### Purpose

**[C]** *"A rep corrects the accounts they entered and nobody else's"* — open to reps precisely so a typo does not become permanent.

#### HTTP

```text
PATCH /api/v1/accounts/{id}        → 200 OK
```

#### Semantics — three distinct behaviours in one body

⚠️ **[C]** This is the subtlest part of the account contract:

| You send | Result |
| --- | --- |
| field **omitted** | left alone |
| field `= null` | **cleared** |
| field `= ""` | **cleared** (`""` is trimmed to `null` — what a form sends when a user empties an input) |
| `classification` | **add-only.** Adds one the account lacks; a value it already carries is a **no-op, not a 409**. There is **no way to remove one** here. |

**[C]** So a `PATCH` without `phone` **keeps** the number. And a client may safely re-send the whole object it just read — the classification will not 409.

#### Body — `UpdateAccountDto`

Same fields and validation as `CreateAccountDto` **minus `contacts`**, with every field optional and nullable except `name` (optional, but non-null when present: 2–200).

```json
{ "phone": "+963 11 999 8877", "notes": null, "classification": "DISTRIBUTOR" }
```

#### Success response `200`

**[C]** `data` is the account itself (`AccountWithCountsView`) — **not** wrapped:

```json
{
  "success": true,
  "message": "Account updated successfully",
  "data": {
    "id": "3f2504e0-…", "name": "Al-Amal Contracting Co.", "type": "COMPANY",
    "phone": "+963119998877", "notes": null,
    "isVerified": false, "contactCount": 2, "activeLinkCount": 1,
    "…": "…"
  },
  "meta": { … }
}
```

⚠️ **[C]** The response carries **no `classifications` array** — `AccountWithCountsView` does not include one. After adding a classification via PATCH you **cannot see it in the response**; a rep must re-run `GET /accounts?search=…` to observe it. See §16-Q3.

#### Errors

| HTTP | Code | Mobile action |
| --- | --- | --- |
| 403 | `ACCOUNT_NOT_OWNER` | **Not yours.** Disable editing; show a read-only view. Never retry. |
| 404 | `ACCOUNT_NOT_FOUND` | Drop from local cache; return to search. |
| 400 | `ACCOUNT_ARCHIVED` | Read-only; refresh the row. |
| 409 | `ACCOUNT_ALREADY_MERGED` | Send the user back to search (§5.2). |
| 400 | validation codes | Field-level errors. |

**[I]** Because the ownership check runs **inside the handler**, a rep's edit of somebody else's account is a clean 403 with **no partial write** — safe to surface as a plain "not permitted".

---

### 6.3 `POST /accounts/{id}/classifications` — classify (A4)

**[C]** `201 Created`. Open to reps because *"the rep standing in the shop is the one who knows the deal was supplied through it."*

**Body:**

```json
{ "classification": "DISTRIBUTOR" }
```

| Field | Type | Required | Allowed |
| --- | --- | --- | --- |
| `classification` | Enum | **Yes** | `PROJECT_STAKEHOLDER` \| `DISTRIBUTOR` \| `COMPETITOR` |

**[C] `data`** is the created `AccountClassificationView`, with `isAuthorized: false` for a rep's DISTRIBUTOR.

⚠️ **[C] Differs from `PATCH`:** classifying an account that already carries it is a **409 `ACCOUNT_ALREADY_CLASSIFIED`**, not a no-op — *"a period names a stretch of time, and silently handing back the existing one would hide that the caller believes they just created something."*

**[I] UI rule:** disable the classification the account already shows. If you get the 409 anyway, treat it as success-with-refresh, not an error.

**[C]** An account may carry **several classifications at once** — a shop that also does installation is one account that is both `DISTRIBUTOR` and `PROJECT_STAKEHOLDER`.

---

### 6.4 `GET /accounts` — search (A2)

#### ⚠️ A rep must say what they are looking for

**[C]** `mayReadDirectoryInBulk` is false for a rep, so:

1. **`search` OR `classification` is required.** Sending neither returns an **empty page** — `200`, `data: []`, `total: 0` — **not a 403**. *"The list is not forbidden, there is simply nothing to return until you say what you are looking for."* (SH7 — no bulk export.)
2. **`limit` is silently capped at `REP_MAX_PAGE_SIZE = 25`**, whatever you ask for.

**[I] UI consequence:** the accounts screen **opens as a search screen**, never as a browsable list. An empty state before the first query is correct behaviour, not a bug.

#### Query parameters — `ListAccountsQueryDto`

| Name | Type | Required | Default | Notes |
| --- | --- | --- | --- | --- |
| `search` | String | **rep: yes*** | — | ≤ 200. Matches name, city, phone, email, registration number — **and the account's people** (see `in`). |
| `in` | Enum | No | **`both`** | `accounts` \| `contacts` \| `both`. `contacts` = *accounts found through their people*. **Always returns accounts.** |
| `classification` | Enum | **rep: yes*** | — | Open periods only. **Satisfies the search requirement on its own.** |
| `authorizedOnly` | Boolean | No | — | Only meaningful with `classification=DISTRIBUTOR`; ignored otherwise. |
| `type` | Enum | No | — | `COMPANY` \| `INDIVIDUAL` |
| `city` | String | No | — | ≤ 120 |
| `includeArchived` | Boolean | No | `false` | |
| `includeMerged` | Boolean | No | `false` | Off by default — a merged husk is noise. |
| `page` | Int | No | `1` | ≥ 1 |
| `limit` | Int | No | `20` | ≤ 100 in the DTO, **capped to 25 for a rep** |

\* **[C]** One of `search` / `classification` — not both.

**[C]** Booleans accept `?flag` (bare), `?flag=true` and `?flag=1`; also `false` / `0`. **More permissive than the catalogue's parser** — a bare flag with no value means `true` here.

**[C]** `in=both` is the default because *"that is the question a rep actually has: they remember the man, not the company."*

#### Success response `200`

```json
{
  "success": true,
  "message": "Accounts retrieved successfully",
  "data": [
    {
      "id": "3f2504e0-…",
      "name": "Al-Amal Contracting Co.",
      "type": "COMPANY",
      "registrationNumber": null,
      "phone": "+963112345678",
      "email": null,
      "city": "Damascus",
      "addressLine": "Mazzeh highway, building 12",
      "notes": null,
      "isVerified": false,
      "verifiedAt": null,
      "createdAt": "2026-08-14T08:12:03.114Z",
      "updatedAt": "2026-08-14T08:12:03.114Z",
      "archivedAt": null,
      "mergedIntoId": null,
      "mergedAt": null,
      "contactCount": 2,
      "activeLinkCount": 1,
      "classifications": [
        { "classification": "DISTRIBUTOR", "isAuthorized": true, "addedAt": "2026-05-02T10:00:00.000Z" },
        { "classification": "PROJECT_STAKEHOLDER", "isAuthorized": false, "addedAt": "2026-08-14T08:12:03.114Z" }
      ]
    }
  ],
  "pagination": { "total": 3, "page": 1, "limit": 25, "totalPages": 1 },
  "meta": { … }
}
```

**[C]** `classifications` carries **open periods only, appointed first** — so it reads as *what this account currently is*. Closed periods live on `GET /accounts/{id}`, **which a rep cannot reach**.

⚠️ **[C] `isVerified` and `isAuthorized` answer different questions:**

| Flag | Means |
| --- | --- |
| `isVerified` | The **account record** has been checked by a manager. |
| `isAuthorized` | The **outlet** is a formally appointed NEWPOWER dealer (DISTRIBUTOR only). |

**[C]** *"Most outlets a rep buys through are real and unappointed, and that is a normal state rather than a problem."* **[I] Do not render `isAuthorized: false` as a warning.**

---

### 6.5 `GET /accounts/{id}/contacts` — the roster (A5)

**[C]** Ordered **primary first, then alphabetical** — the order somebody opening a company page wants.

| Query param | Type | Default |
| --- | --- | --- |
| `includeArchived` | Boolean | `false` |

**[C] `data`** is a bare `ContactView[]` (no pagination).

⚠️ **[C] Narrowed to the contacts the rep added.** A rep who added nobody here gets `[]` — *"the honest answer to 'which of these people are yours'"* — **not a 403**.

**[I] UI consequence:** `account.contactCount` (from the list row) counts **everyone**, while this endpoint returns **only the rep's own**. **These two numbers legitimately disagree.** Never render "showing X of contactCount".

---

## 7. Contacts

### 7.1 `POST /contacts` — record a person (C1)

#### Purpose

**[C]** *"A rep takes a name and a number at a site gate, at a trade counter, off a business card, and only later finds out which company is behind it."* This controller exists because the old account-nested route **could not express an unfiled person** — and forcing an account at that moment is what produced throwaway "Unknown Contractor" records.

#### HTTP

```text
POST /api/v1/contacts        → 201 Created
```

#### Body — `CreateContactDto`

| Field | Type | Required | Validation | Notes |
| --- | --- | --- | --- | --- |
| `firstName` | String | **Yes** | 2–80 | |
| `lastName` | String | **Yes** | 2–80 | **Both parts required** — a first name alone is not findable six months later. |
| `accountId` | uuid | **No** | valid v4 | ⚠️ **Optional on purpose.** Omit when the company is unknown. |
| `company` | String \| null | No | ≤ 200 | **Free text — NOT a reference.** What they *said* they work for. |
| `position` | String \| null | No | ≤ 120 | Job title as heard; not a fixed list. |
| `phone` | String \| null | No | western digits, 7–15 | |
| `email` | String \| null | No | ≤ 254 | |
| `notes` | String \| null | No | ≤ 2000 | |
| `isPrimary` | Boolean | No | default `false` | **Requires `accountId`.** |

**[C]** `accountId` + `company` together is **normal, not a contradiction** — it is what every contact looks like the moment after being filed. **The account wins on read.**

**[C]** `company` is **never cleared** and is **not editable** by `PATCH` — it is the raw capture and the clue that later found the account.

**[C]** `isPrimary` is an **account-level** attribute: setting it **demotes the incumbent in the same transaction**, including a contact another rep added. Without `accountId` → `400 CONTACT_UNATTACHED_CANNOT_BE_PRIMARY`.

#### Request examples

**Filed immediately:**
```json
{
  "accountId": "3f2504e0-4f89-41d3-9a0c-0305e82c3301",
  "firstName": "Ahmad", "lastName": "Al Sayed",
  "position": "Purchasing Manager",
  "phone": "0991234567",
  "isPrimary": true
}
```

**Met at the gate, company unknown:**
```json
{
  "firstName": "Ahmad", "lastName": "Al Sayed",
  "company": "Al-Amal Contracting",
  "phone": "0991234567",
  "notes": "Met at the Mazzeh tower gate; handles procurement."
}
```

#### Success response `201`

**[C] `data`** is a `ContactView`. For the unfiled case, `accountId` and `account` are **both `null`**, and `company` carries the note:

```json
{
  "success": true,
  "message": "Contact added successfully",
  "data": {
    "id": "c0a80101-0000-4000-8000-000000000001",
    "accountId": null,
    "account": null,
    "company": "Al-Amal Contracting",
    "firstName": "Ahmad", "lastName": "Al Sayed",
    "position": null,
    "phone": "0991234567",
    "email": null,
    "notes": "Met at the Mazzeh tower gate; handles procurement.",
    "isPrimary": false,
    "createdAt": "2026-08-14T08:20:00.000Z",
    "updatedAt": "2026-08-14T08:20:00.000Z",
    "archivedAt": null
  },
  "meta": { … }
}
```

**[C]** `account` is **null exactly when `accountId` is null** — every read joins it, so a null means *"nobody has filed this person"*, never *"the join was skipped"*.

⚠️ **[I] Keep the returned `id` locally.** A rep can only find this person again through `GET /contacts?search=…` — and see §7.3 for why "list my unfiled contacts" is not directly expressible.

#### Errors

| HTTP | Code | Cause |
| --- | --- | --- |
| 400 | `CONTACT_INVALID_NAME` / `_PHONE` / `_EMAIL` | Value-object validation |
| 400 | `CONTACT_UNATTACHED_CANNOT_BE_PRIMARY` | `isPrimary` without `accountId` |
| 400 | `ACCOUNT_ARCHIVED` | `accountId` names an archived account |
| 404 | `ACCOUNT_NOT_FOUND` | Unknown `accountId` |
| 409 | `ACCOUNT_ALREADY_MERGED` | `accountId` was merged away |

---

### 7.2 `PATCH /contacts/{id}` — correct (C4)

**[C]** Own records only. Omitted → left alone; `null` / `""` → cleared.

| Field | Editable here |
| --- | --- |
| `firstName`, `lastName`, `position`, `phone`, `email`, `notes`, `isPrimary` | ✅ |
| **`accountId`** | ❌ → `PUT /contacts/{id}/account` (§7.5) |
| **`company`** | ❌ **Not editable at all** — it is the raw capture. |

**[C]** `isPrimary: true` promotes and demotes the incumbent in one transaction; needs an account → else `400 CONTACT_UNATTACHED_CANNOT_BE_PRIMARY`.

**[C] `data`** = `ContactView`.

---

### 7.3 `GET /contacts` — search (C2)

**[C]** **The only read that reaches a person filed under no account.**

| Name | Type | Required | Default | Notes |
| --- | --- | --- | --- | --- |
| `search` | String | **rep: yes** | — | ≤ 200. Omitting it as a rep → **empty page**, not 403. |
| `in` | Enum | No | **`both`** | `contacts` (name, position, phone, email) \| `company` (the free-text note **and** the filed account's name) \| `both` |
| `accountId` | uuid | No | — | One company's people, search-shaped. |
| `unassigned` | Boolean | No | — | Only people filed under **no account**. **Overrides `accountId`.** |
| `includeArchived` | Boolean | No | `false` | |
| `page` / `limit` | Int | No | `1` / `20` | **capped to 25 for a rep** |

**[C]** Ordered **newest first** — unlike the roster (§6.5), which is primary-first. *"The unfiled slice is a queue, and the person met this morning is the one being looked for."*

**[C]** `in=company` covers **both** the free-text `company` note and the name of the filed account, *"because those are two storage answers to one question."*

⚠️ **[I] A rep cannot list "all my unfiled contacts."** `unassigned=true` does **not** satisfy the rep search requirement — only `search` does. So `?unassigned=true` alone returns an empty page. **[I]** Track unfiled contacts **client-side** from your own create responses if you want that queue in the rep app. See §16-Q4.

**[C] `data`** is `ContactView[]` with a sibling `pagination`.

---

### 7.4 `GET /contacts/{id}` (C3) · `DELETE /contacts/{id}` (C5)

**`GET`** — **[C]** own only; somebody else's is **404, not 403**. `data` = `ContactView`.

**`DELETE`** — **[C]** archives (never hard-deletes, A4). Body **requires** `reason`:

```json
{ "reason": "left the company and is no longer reachable" }
```

| Rule | **[C]** |
| --- | --- |
| `reason` | **10–500 chars, no `< > ; ' "`** |
| Refused while they hold the decision-maker flag on **any** project | `409 CONTACT_IS_DECISION_MAKER` — name a different decision maker first |
| A primary is **stepped down on the way out** | A retired person cannot stay the account's default contact |
| Response | `{ message: "Contact archived successfully" }` — **`data` is absent** |

---

### 7.5 `PUT /contacts/{id}/account` — file or move (C6)

#### Purpose

**[C]** How a person recorded without a company gets one, **and** how a person filed under the wrong company is moved. *"Both are the same fact arriving late."*

```text
PUT /api/v1/contacts/{id}/account        → 200 OK
```

```json
{ "accountId": "3f2504e0-4f89-41d3-9a0c-0305e82c3301" }
```

| Rule | **[C]** |
| --- | --- |
| `accountId` | **Required, cannot be null — there is no detach.** *"Returning a person the field has been dealing with to the unfiled queue is a hole rather than a correction."* |
| `company` | **Never touched** — reads render the account's name in preference to it. |
| Primary status | **Stepped down on the way out.** Re-promote afterwards if intended. |
| Decision-maker flag | **Refused** → `409 CONTACT_IS_DECISION_MAKER`. Moving them would leave a project's decision maker pointing at a company they no longer work for. |
| Filing where they already are | **No-op returning them unchanged** — not a 409. Safe to re-send. |

**[C] `data`** = `ContactView`, now with `accountId` and `account` populated and `company` unchanged.

**[I] UI:** render the company as `account?.name ?? company ?? "—"`. Both being null is impossible only if `company` was supplied; a contact with neither is legal.

---

## 8. Linking to a project

### 8.1 `POST /projects/{projectId}/stakeholders` — link (P1)

#### Purpose

**[C]** Attach an account to a project **in a role**. *"Any rep may link any account to a project they own or support, and doing so grants nothing on that account's other projects (SH1). Exclusivity is per project."*

```text
POST /api/v1/projects/{projectId}/stakeholders        → 201 Created
```

#### Body — `LinkStakeholderDto`

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `accountId` | uuid | **Yes** | v4 |
| `role` | Enum | **Yes** | see §9 — 9 values |
| `primaryContactId` | uuid | No | **Must be a contact of the account being linked** → else `400 CONTACT_NOT_ON_ACCOUNT` |
| `note` | String \| null | No | ≤ 2000 |
| `startedAt` | ISO date-time | No | Defaults to now. **Back-dating is supported** for an involvement recorded after the fact. |

```json
{
  "accountId": "3f2504e0-4f89-41d3-9a0c-0305e82c3301",
  "role": "MAIN_CONTRACTOR",
  "primaryContactId": "c0a80101-0000-4000-8000-000000000001",
  "note": "Introduced by the consultant; handles the electrical package."
}
```

#### Uniqueness rules — what *is* allowed

**[C]** One active link per **(project, account, role)**. Beyond that:

| Situation | Allowed? |
| --- | --- |
| Two accounts sharing one role | ✅ *"two consultants on a tower is normal"* |
| One account holding two roles | ✅ |
| A **second `OWNER`** | ✅ *"more likely real joint ownership than an error"* |
| Same account, same role, twice | ❌ `409 STAKEHOLDER_ALREADY_LINKED` |

**[I] Do not enforce single-owner or single-role-holder in the UI.** The backend deliberately does not.

**[C] `data`** = `ProjectStakeholderView`, including the joined `account` summary and `primaryContact` summary, `isActive: true`, and `startedAt`.

#### Errors

| HTTP | Code | Mobile action |
| --- | --- | --- |
| 404 | `STAKEHOLDER_PROJECT_NOT_FOUND` | Not yours / gone → pop to project list |
| 403 | `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE` | Same handling (§5.3) |
| 404 | `ACCOUNT_NOT_FOUND` | Re-search the account |
| 400 | `CONTACT_NOT_ON_ACCOUNT` | The picked contact belongs elsewhere — reload the roster |
| 400 | `ACCOUNT_ARCHIVED` | Pick another account |
| 409 | `ACCOUNT_ALREADY_MERGED` | Re-search (§5.2) |
| 409 | `STAKEHOLDER_ALREADY_LINKED` | Already linked in that role — refresh the list |

---

### 8.2 `GET /projects/{projectId}/stakeholders` (P2)

| Query param | Type | Default | Notes |
| --- | --- | --- | --- |
| `includeClosed` | Boolean | `false` | **[C]** How *"who was the main contractor before this one"* is answered. Closed links are **never deleted** (S-E2). |

**[C]** Ordered **active first, then newest**. `data` = `ProjectStakeholderView[]`, no pagination.

---

### 8.3 `PATCH /projects/{projectId}/stakeholders/{linkId}` (P3)

**[C]** Only two fields:

| Field | Type | Notes |
| --- | --- | --- |
| `primaryContactId` | uuid \| null | `null` clears. Must belong to the linked account. |
| `note` | String \| null | ≤ 2000 |

⚠️ **[C] The `role` cannot be changed.** *"It is part of the link's identity, so moving an account from Consultant to Main Contractor closes one link and opens another rather than rewriting history."* → use **replace** (§8.5), or close and link again.

**[I] UI:** render the role as static text on the edit screen, with a "change role" affordance that routes to close-and-relink — not a dropdown.

---

### 8.4 `DELETE /projects/{projectId}/stakeholders/{linkId}` — close (P4)

```json
{ "reason": "the owner awarded the electrical works to another contractor", "endedAt": "2026-07-01T00:00:00.000Z" }
```

| Field | Type | Required | Validation |
| --- | --- | --- | --- |
| `reason` | String | **Yes** | **10–500, no `< > ; ' "`** |
| `endedAt` | ISO date-time | No | Back-dated end; defaults to now |

**[C]** The link is **closed with an end date, never deleted** — every visit and quote stays attached to the project.

⚠️ **[C] Refused when this link's account holds the decision-maker flag** — closing it would orphan the flag. → use **replace**, or name a different decision maker first.

**[C]** Response: `{ message: "Stakeholder link closed successfully" }` — **no `data`**.

---

### 8.5 `POST /projects/{projectId}/stakeholders/{linkId}/replace` (P5)

#### Purpose

**[C]** SH4 — **one business event, one transaction**: the outgoing link closes with an end date, the incoming account opens **in the same role**, and the closed link records its successor in `replacedByLinkId`. *"All prior visits, quotes and history stay attached to the project."*

```text
POST /api/v1/projects/{projectId}/stakeholders/{linkId}/replace        → 200 OK
```

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `newAccountId` | uuid | **Yes** | **Inherits the outgoing role automatically** — a replacement keeps the role by definition. |
| `newPrimaryContactId` | uuid | **Conditional** | ⚠️ **Required when the outgoing account holds the decision-maker flag.** |
| `note` | String \| null | No | ≤ 2000 |
| `reason` | String | **Yes** | 10–500. **Doubles as the decision-maker move reason** when the flag travels. |

**[C]** If the outgoing account holds the flag, **the flag moves with the replacement** — leaving the project flagless is not allowed (S3).

**[I] UI:** before submitting, check `GET /decision-maker`; if its `accountId` equals the outgoing link's account, make the new-contact picker **required** in the form rather than discovering it via a 400.

---

### 8.6 The decision maker (P6–P9)

#### The rule

**[C]** **Exactly one stakeholder-contact per project at any time (S3).** The flagged contact's account **must have a live link on this project** — *"a quote is an offer *to* someone."*

⚠️ **[C]** An **unfiled contact can never be the decision maker.** `DecisionMakerPolicy.resolveLinkFor` refuses a `null` accountId explicitly → `400 CONTACT_NOT_ON_PROJECT`. **File them first** with `PUT /contacts/{id}/account`.

#### `PUT /projects/{projectId}/decision-maker` (P6)

```json
{ "contactId": "c0a80101-…", "reason": "purchasing moved from the contractor to the owner" }
```

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `contactId` | uuid | **Yes** | |
| `reason` | String | **Conditional** | ⚠️ **Required when changing an existing decision maker; omitted for the first one.** 10–500, no `< > ; ' "`. |

**[C]** *"Naming someone for the first time is not a change to explain; moving the flag always is."*

**[C]** The move is **atomic** — the old period closes and the new opens in one transaction, so the project is never left with zero or two.

**[C]** Re-flagging the **same** person is a **no-op and needs no reason**.

**[C]** On a change, **subsystem 04 offers the rep a stage regression** and **08 flags an active quote as "approved by previous decision maker"** (SH3). **Neither is forced** — the log keeps both facts.
**[I]** So after a successful change, **re-fetch the project** — its stage or quote flags may have moved. This is the one cross-subsystem side effect on this surface.

**[C] `data`** = `DecisionMakerView` (`periodId`, `projectId`, `linkId`, `accountId`, `account`, `contactId`, `contact`, `setAt`).

#### `GET /projects/{projectId}/decision-maker` (P7)

**[C]** Returns **`data: null`** when none is flagged — *"an ordinary state for a project at Lead, not an error."* **[I]** Render an empty state, never an error.

#### `DELETE /projects/{projectId}/decision-maker` (P8)

**[C]** Body requires `reason` (10–500). ⚠️ **Refused from Engagement onwards** → `400 DECISION_MAKER_REQUIRED_AT_STAGE`, because the flag is the **gate** for entering Engagement.

**[C]** *"Naming a replacement is always allowed at any stage — that is a change, not a removal."*
**[I] UI:** hide "remove" for projects at Engagement+ and offer only "replace".

#### `GET /projects/{projectId}/decision-maker/history` (P9)

**[C]** Newest first, **paginated** (`page` / `limit`, default 1 / 20). `data` = `DecisionMakerPeriodView[]` + sibling `pagination`.

**[C]** For a rep, `setBy` / `endedBy` / `setByUser` / `endedByUser` are **stripped**, but `setAt`, `endedAt`, `changeReason`, `isActive` and `replacedByLinkId` survive — *"a rep sees that the flag moved and why, without the record naming which colleague moved it."*

---

## 9. Enums

**[C]** No values invented. Parse defensively with an `unknown` fallback.

### `AccountType`
```text
COMPANY · INDIVIDUAL
```
**[C]** No business rule treats them differently — the distinction is for reporting and **for how the app presents contacts**: a company has several, an individual is usually their own single contact.
**[I]** Reasonable UI: for `INDIVIDUAL`, collapse the roster into the header instead of a separate section.

### `AccountClassification`
```text
PROJECT_STAKEHOLDER · DISTRIBUTOR · COMPETITOR
```

| Value | Meaning | Rep UI |
| --- | --- | --- |
| `PROJECT_STAKEHOLDER` | Appears on project links. **Implied, not enforced** — linking does not require it. | Neutral chip. |
| `DISTRIBUTOR` | An outlet that moves NEWPOWER product. Named on a **won** outcome. | Chip + appointment state (`isAuthorized`). |
| `COMPETITOR` | A rival brand or supplier. Named on a **lost** outcome. | Distinct chip colour. |

**[C]** It is a **set an account carries, not a field it is**. Only `DISTRIBUTOR` is authorizable — authorizing a `COMPETITOR` is a category error.

### `StakeholderRole` — 9 values
```text
OWNER
MAIN_CONTRACTOR
ELECTRICAL_MEP_SUBCONTRACTOR
CONSULTANT_ENGINEERING_OFFICE
PURCHASING_MANAGER
SITE_ELECTRICIAN
ELECTRICAL_ENGINEER
SITE_SUPERVISOR
OTHER
```

**[C]** The role belongs to the **link, never to the account** — the same contractor is `MAIN_CONTRACTOR` on one building and `OWNER` of another.

**[C]** The three site roles (`SITE_ELECTRICIAN`, `ELECTRICAL_ENGINEER`, `SITE_SUPERVISOR`) were added with subsystem 04: *"in residential work the electrician is very often the person who actually decides which sockets go in"*, and without them every such person landed in `OTHER`.

⚠️ **[C] `OTHER` is never blocked**, but a rep whose links exceed **30% `OTHER`** (once they have ≥ **5** links) surfaces on their manager's data-quality report.
**[I] UI:** put `OTHER` **last** in the picker and require the `note` field when it is chosen. Nothing enforces this server-side — it is a nudge, and the whole point is that the overuse is visible rather than punished.

### `AccountSearchScope` (`GET /accounts?in=`)
```text
accounts · contacts · both        (default: both)
```

### `ContactSearchScope` (`GET /contacts?in=`)
```text
contacts · company · both         (default: both)
```

---

## 10. Business rules

**BR-1 — A rep creates and corrects their own; never anyone else's.**
`assertMayEditRecord`. Violation is `403 ACCOUNT_NOT_OWNER` with **no partial write**.

**BR-2 — A rep's entry lands unchecked.**
`isVerified: false` on accounts, `isAuthorized: false` on their DISTRIBUTOR. A manager confirms. **This is the normal path, not an error** — present it as *"pending review"*, never as a failure.

**BR-3 — Duplicates are monitored, never gated.**
Creation is never refused for resembling an existing account. Detection still runs; the merge queue is fed. **Reps do not receive the candidate list.**

**BR-4 — Nothing is ever hard-deleted (A4).**
Accounts and contacts archive; stakeholder links close with an end date; classification periods close. Every "delete" in the UI is an **archive** and takes a **reason**.

**BR-5 — Reasons are mandatory and substantive.**
10–500 characters, no `< > ; ' "`. Enforced **twice** — DTO *and* the `ChangeReason` value object. *"'n/a' and '-' are what a mandatory-reason field collects when it accepts anything."*

**BR-6 — Western digits only, in phone and registration number.**
⚠️ **Arabic-Indic digits (`٠-٩`) are rejected, not transliterated** — *"a phone number is dialled and pasted into other systems."* **[I] This is the single most likely field-failure in an Arabic-first UI.** See §12.

**BR-7 — A person is a directory record, not a child row of a company.**
`accountId` is optional on create. `company` is free text, permanent and non-editable.

**BR-8 — Exclusivity is per project (SH1).**
Linking an account grants **nothing** on its other projects. A rep has no cross-project view of an account at all — `GET /accounts/{id}/projects` is manager-only.

**BR-9 — A rep cannot follow a merge.**
`GET /accounts/{id}` returns the survivor with `resolvedFrom` — but reps cannot call it. A rep hitting `409 ACCOUNT_ALREADY_MERGED` must **re-search**.

**BR-10 — The role is part of a link's identity.**
Immutable. Changing it means closing one link and opening another.

**BR-11 — Exactly one decision maker, always (S3).**
Atomic moves; no zero-or-two window. Cannot be cleared from Engagement onwards. Cannot be an unfiled contact. Cannot be someone whose account has no live link.

**BR-12 — `isPrimary` is account-level and steals.**
Promoting one contact demotes the incumbent **in the same transaction** — including a contact another rep added. Archiving or re-filing steps them down automatically.

**BR-13 — The directory can be searched, never walked (SH7).**
Reps must supply `search` (or `classification` on accounts), and are capped at **25 per page**. There is no export route at all.

**BR-14 — Two ways to say "already there", and they differ.**
`POST /accounts/{id}/classifications` on an existing classification → **409**. `PATCH /accounts/{id}` with the same value → **no-op**. Deliberate: POST asserts a new fact, PATCH resends state.

---

## 11. Data models

**N** = nullable **[C]**. Attribution fields are **omitted entirely** for reps (§4.3) — model them as optional.

### `Account` (`AccountView` → `AccountWithCountsView` → `AccountListItemView`)

```text
id: String
name: String
type: AccountType
registrationNumber: String?       N
phone: String?                    N
email: String?                    N
city: String?                     N
addressLine: String?              N
notes: String?                    N
isVerified: bool
verifiedAt: DateTime?             N
createdAt: DateTime
updatedAt: DateTime
archivedAt: DateTime?             N
mergedIntoId: String?             N   ← set when merged away
mergedAt: DateTime?               N
─ AccountWithCountsView adds:
contactCount: int                     ← ALL contacts, not just the rep's
activeLinkCount: int                  ← live project links
─ AccountListItemView adds:
classifications: List<ClassificationSummary>   ← OPEN periods only
```

### `ClassificationSummary` / `AccountClassificationView`

```text
ClassificationSummary               (on list rows)
  classification: AccountClassification
  isAuthorized: bool
  addedAt: DateTime

AccountClassificationView           (returned by POST create / classify)
  id, accountId, classification, isAuthorized
  authorizedAt: DateTime?           N
  addedAt: DateTime
  removedAt: DateTime?              N
  removalReason: String?            N
```

### `Contact` (`ContactView`)

```text
id: String
accountId: String?                N   ← null while unfiled
account: AccountSummary?          N   ← null EXACTLY when accountId is null
company: String?                  N   ← free text, permanent, non-editable
firstName: String
lastName: String
position: String?                 N
phone: String?                    N
email: String?                    N
notes: String?                    N
isPrimary: bool
createdAt / updatedAt: DateTime
archivedAt: DateTime?             N
```

### `AccountSummary` / `ContactSummary`

```text
AccountSummary  { id, name, type }
ContactSummary  { id, accountId?, firstName, lastName, position?, phone?, email? }
```

### `ProjectStakeholderView`

```text
id: String
projectId: String
accountId: String
account: AccountSummary
role: StakeholderRole             ← IMMUTABLE
primaryContactId: String?         N
primaryContact: ContactSummary?   N
note: String?                     N
startedAt: DateTime
endedAt: DateTime?                N
endReason: String?                N
replacedByLinkId: String?         N   ← survives redaction
isActive: bool                        ← denormalised; do not compare dates yourself
```

### `DecisionMakerView` / `DecisionMakerPeriodView`

```text
DecisionMakerView
  periodId, projectId, linkId, accountId, contactId
  account: AccountSummary
  contact: ContactSummary
  setAt: DateTime

DecisionMakerPeriodView extends it
  endedAt: DateTime?              N
  changeReason: String?           N   ← null while the period is open
  isActive: bool
```

### `Pagination`

```text
{ total: int, page: int, limit: int, totalPages: int }   ← SIBLING of data
```

---

## 12. ⚠️ Validation reference — build the form against this

**[C]** Every constraint below is enforced. Validate client-side to the same rules; the round trip is expensive in the field.

| Field | Min | Max | Extra rules |
| --- | --- | --- | --- |
| `account.name` | 2 | 200 | No control chars. **Must contain something beyond punctuation and legal forms** — a bare `شركة` or `...` is refused. |
| `account.registrationNumber` | 3\* | 40\* | \*after stripping ` - / . _`. **Western digits only.** `A–Z0–9` after normalisation. Upper-cased. |
| `account.phone` / `contact.phone` | 7 digits | 15 digits | **Western digits only.** Optional leading `+`. Separators ` `, `-`, `.` allowed. Letters and parentheses **rejected**. |
| `account.email` / `contact.email` | — | 254 | `something@domain.tld`, no whitespace. Lower-cased. |
| `account.city` | — | 120 | |
| `account.addressLine` | — | 300 | |
| `notes` (both) | — | 2000 | |
| `contact.firstName` / `lastName` | 2 | 80 | **Both required.** No control chars. Internal whitespace collapsed. |
| `contact.position` | — | 120 | |
| `contact.company` | — | 200 | Create-only; never editable. |
| `link.note` | — | 2000 | |
| **any `reason`** | **10** | **500** | **No `< > ; ' "`.** Whitespace collapsed. |
| `contacts[]` on create | — | **20 items** | |
| `search` (both lists) | — | 200 | |
| `limit` (rep) | 1 | **25 effective** | DTO allows 100; silently capped. |

### 12.1 The Arabic-digit trap

⚠️ **[C]** `phone` and `registrationNumber` **reject `٠-٩` and `۰-۹` outright**, with a specific message: *"Use western digits (0-9) only — Arabic-Indic digits are not accepted."*

**[I] Required mitigations in an Arabic-first UI:**
1. Force a **Latin numeric keyboard** on those fields (`TextInputType.number` + `LengthLimitingTextInputFormatter` + a digit-only `FilteringTextInputFormatter`).
2. **Transliterate on input**, client-side: map `٠١٢٣٤٥٦٧٨٩` → `0123456789` **before** sending. The backend deliberately will not do this for you.
3. Validate the digit **count** (7–15) client-side, since the server counts digits after stripping separators.

**[C]** Note the asymmetry: `AccountName` **does** fold `٠-٩` for its duplicate-matching key — *"but that is a fuzzy comparison key nobody dials."* So Arabic digits are fine **in a name** and rejected **in a phone number**.

### 12.2 Empty string means "clear"

**[C]** On both PATCH bodies, `trimToNull` turns `""` into `null` → **the field is cleared**. **[I]** If your form binds empty `TextEditingController`s directly, an untouched field will **wipe server data**. Send only **dirty** fields.

---

## 13. Complete rep flows

### 13.1 One field visit → one request

```text
Rep meets a new contractor on site
   ↓
POST /accounts { name, type, city, phone, classification, contacts:[…] }   ← ONE call
   ↓ 201
data.account.id          → keep
data.contacts[].id       → keep, needed immediately below
data.account.isVerified  → false (pending review — show as a chip)
   ↓
POST /projects/{projectId}/stakeholders
     { accountId, role, primaryContactId: data.contacts[0].id }
   ↓ 201
   ↓ (optional, if this is the person who decides)
PUT /projects/{projectId}/decision-maker { contactId }        ← no reason: it is the FIRST
   ↓ 200
re-fetch the project — stage/quote flags may have moved (SH3)
```

**[C]** This is the path the inline `contacts[]` and `classification` fields exist for: *"one visit, one request."*

### 13.2 Person met before the company is known

```text
Rep takes a name + number at a site gate
   ↓
POST /contacts { firstName, lastName, phone, company: "Al-Amal Contracting" }
   ↓ 201  — accountId: null, account: null, company preserved
KEEP data.id LOCALLY  ← a rep can only re-find them by search (§7.3)
   ↓ … later, the company becomes known …
GET /accounts?search=al-amal
   ├─ found  → PUT /contacts/{id}/account { accountId }
   └─ absent → POST /accounts { name: "Al-Amal Contracting", … }
                 → PUT /contacts/{id}/account { accountId }
   ↓ 200 — company text untouched; account now wins on read
   ↓ (only now can they be a decision maker)
POST /projects/{pid}/stakeholders { accountId, role, primaryContactId }
PUT  /projects/{pid}/decision-maker { contactId }
```

⚠️ **[C]** The order is forced: **file the contact → link the account → then flag the decision maker.** An unfiled contact is refused with `CONTACT_NOT_ON_PROJECT`, and so is a filed contact whose account has no live link.

### 13.3 Attaching an existing account to a project

```text
Project screen → "add stakeholder"
   ↓
GET /accounts?search=<term>&limit=25          ← search REQUIRED
   ↓ pick a row (keep the whole row — there is no GET /accounts/{id})
GET /accounts/{id}/contacts                   ← the rep's own contacts there
   ├─ empty → POST /contacts { accountId, … }  ← record the person now
   └─ pick one
   ↓
POST /projects/{projectId}/stakeholders { accountId, role, primaryContactId, note }
   ↓ 201 → refresh GET /projects/{projectId}/stakeholders
```

**[I]** Because A5 is narrowed to the rep's own contacts, an **empty roster on a real account is normal** — the account may have ten people, added by colleagues. The empty state must say *"you have not added anyone here yet"*, **never** *"this account has no contacts"*.

### 13.4 The contractor changed mid-project

```text
GET /projects/{pid}/decision-maker
   ↓
outgoing link holds the flag?
   ├─ YES → newPrimaryContactId is REQUIRED below
   └─ NO  → optional
   ↓
POST /projects/{pid}/stakeholders/{linkId}/replace
     { newAccountId, newPrimaryContactId?, note?, reason: "…10+ chars…" }
   ↓ 200
old link: endedAt set, replacedByLinkId → new link
new link: same role, isActive true
flag (if it moved): old period closed with `reason`, new period open
   ↓
re-fetch project + stakeholders + decision-maker
```

### 13.5 Correcting your own entry

```text
GET /accounts?search=…  → row (isVerified: false)
   ↓ tap edit
PATCH /accounts/{id} { only dirty fields }
   ├─ 200 → data IS the account (not data.account)
   └─ 403 ACCOUNT_NOT_OWNER → switch the screen to read-only, no retry
```

**[I]** You cannot know ownership from the payload — `createdBy` is redacted for reps. **[I]** Track *"accounts I created this session/device"* locally, and treat the 403 as the authoritative answer for anything older. See §16-Q1.

---

## 14. Error → mobile behaviour

### 14.1 `403 ACCOUNT_NOT_OWNER`

**[C]** Not a permission bug and not retryable — the record belongs to someone else.
**[I]** Switch the screen to **read-only**, show *"يمكنك تعديل السجلات التي أضفتها فقط"*, and **mark the record locally as not-mine** so you stop offering an edit button for it.

### 14.2 `403 Forbidden` / `"Forbidden resource"`

**[C]** A route above the rep's tier (§2.2). **This is a client bug** — the app should never call those routes. Log with `correlationId`, show a generic error, and fix the call site.

### 14.3 `404 CONTACT_NOT_FOUND` on a contact you believe exists

**[C]** Almost certainly **someone else's contact** — reads are narrowed and answer 404 by design.
**[I]** Treat exactly as "not found": remove from local cache, return to search. **Do not** message the user as if it were deleted.

### 14.4 `409 CONTACT_IS_DECISION_MAKER`

**[C]** Blocks **archiving** and **re-filing** a contact.
**[I]** Recovery is a two-step flow the UI must offer explicitly:
> *"هذا الشخص هو صاحب القرار في مشروع. سمِّ صاحب قرار آخر أولاً."* → deep-link to `PUT /decision-maker` on the affected project.

⚠️ **REQUIRES BACKEND CONFIRMATION:** the error does **not** name which project(s). The class carries `contactId` only, and the message is generic. A rep with many projects cannot be told where to go. See §16-Q5.

### 14.5 `401` on a write — retry only what is safe

**[C]** The refresh interceptor (catalogue spec §3.3) is single-flight and replays the original request.
⚠️ **[I]** Replaying is safe for **GET**, `PATCH`, `PUT /contacts/{id}/account` (no-op when unchanged) and `PUT /decision-maker` (no-op when unchanged). It is **not** safe for `POST /accounts` or `POST /contacts` — a replay creates a **duplicate record**.

**[I] Recommendation:** mark create requests as **non-replayable**; on a 401 during a create, refresh, then surface a **"retry"** button so the user re-confirms. The catalogue's blanket replay must not be reused here.

### 14.6 `400 VALIDATION_ERROR`

**[C]** `message` carries only the **first** failing rule; the full list is in `error.details.validationErrors` **in development only**.
**[I]** So server-side messages cannot drive field-level highlighting in production. **Mirror §12 client-side** and treat a server 400 as a fallback banner.

### 14.7 `429`

**[C]** 30 / 60 s shared with the catalogue. **[I]** Debounce both search boxes (≥ 300 ms), cancel in-flight requests, and never fire account search and contact search simultaneously on the same keystroke.

---

## 15. Local state & offline

### 15.1 What to persist

| Item | Why | **[I]** Notes |
| --- | --- | --- |
| `createdAccountIds` | There is **no `GET /accounts/{id}`** and no ownership flag in the payload | Lets you offer "edit" without a 403 round trip |
| `createdContactIds` | Same, plus unfiled contacts have no listable queue (§7.3) | The only way to build a "people I recorded" screen |
| Last account search results | The account "detail" screen is assembled from a **list row** | Cache the row itself, not just its id |
| Recent searches | Reps re-search the same names | Device-local only |

### 15.2 ⛔ Offline write queue — do not build one naively

⚠️ **[I]** This surface is **write-heavy and not idempotent**:

- `POST /accounts` / `POST /contacts` have **no idempotency key** — `X-Idempotency-Key` is CORS-accepted but **[C]** *"not consumed by these modules"*.
- Replaying a queued create after a reconnect **creates a duplicate**.
- Almost every write depends on an id returned by a previous write (`accountId` → link → `contactId` → decision maker), so a queue must preserve **ordering and id substitution**.

**[I] Recommendation:** keep the directory **online-only** for writes in v1. Save an unsent form as a **local draft** the user explicitly re-submits, rather than an automatic queue. If offline creation is a hard requirement, raise §16-Q6 with the backend first.

---

## 16. Backend questions / missing information

### Q1 — A rep cannot tell which records are theirs
**REQUIRES BACKEND CONFIRMATION.**
`createdBy` is redacted for reps, and there is no `isMine` / `canEdit` flag on any view. A rep therefore cannot know whether "edit" is permitted **until they try and get a 403** — and since `GET /accounts` returns everyone's accounts, most rows in a search result are not editable.
**Ask:** can a boolean (`canEdit` / `isOwnRecord`) be added to `AccountListItemView` and `ContactView` for representatives? It leaks nothing — the rep already learns it by attempting.
**Impact:** high. Without it the edit affordance is a coin flip.

### Q2 — `ACCOUNT_ALREADY_MERGED` hides the survivor id in prose
**REQUIRES BACKEND CONFIRMATION.**
The class carries `survivingAccountId`, but the filter serialises only `code`/`statusCode`/`message`. The id survives only inside the sentence *"This account was merged into {uuid}"*. Extracting it means parsing a message, which contradicts the API's own rule.
**Ask:** can the filter pass through a structured field for this error (or can `error.details` carry it in production for this one case)?
**Impact:** medium — currently the rep just has to re-search.

### Q3 — `PATCH /accounts/{id}` cannot show the classification it just added
**REQUIRES BACKEND CONFIRMATION.**
The route accepts `classification` (add-only) but returns `AccountWithCountsView`, which has **no `classifications` array**. A rep cannot see the result of their own write without re-running the list search — and reps cannot call `GET /accounts/{id}`.
**Ask:** should the PATCH response return `AccountListItemView` (which carries open classifications) instead?
**Impact:** medium — affects an optimistic-update path directly.

### Q4 — A rep cannot list their unfiled contacts
**REQUIRES BACKEND CONFIRMATION.**
`?unassigned=true` is documented as *"back office's who-have-we-picked-up-that-nobody-has-placed queue"*, but it does **not** satisfy the rep's mandatory `search` term — only `search` does. So a rep who recorded five people at a gate cannot list them; they must remember a name.
Note the `POST /contacts` description says *"there is no route that reads them back"*, which is **stale** now that `GET /contacts/{id}` exists — but the practical gap remains.
**Ask:** should `unassigned=true` satisfy the search requirement for reps, the way `classification` does on `GET /accounts`?
**Impact:** high for the "met at the gate" flow, which is the reason this controller exists.

### Q5 — `CONTACT_IS_DECISION_MAKER` does not name the project
**REQUIRES BACKEND CONFIRMATION.**
The error blocks archiving and re-filing but carries only `contactId`, and the message is generic. The mobile app cannot tell the rep **which project** to go and fix.
**Ask:** can the message (or a structured field) name the project id(s)?
**Impact:** medium — currently a dead end for a rep with several projects.

### Q6 — No idempotency on creates
**REQUIRES BACKEND CONFIRMATION.**
`X-Idempotency-Key` is accepted by CORS but not consumed. A retried `POST /accounts` on a flaky field connection creates a second account — which then lands in the duplicate queue.
**Ask:** is idempotency-key support planned for the directory writes? It would also unblock a safe offline queue (§15.2).
**Impact:** high for field reliability — this is precisely the population SH6 already expects to generate duplicates.

### Q7 — Project inaccessibility: 403 or 404?
**REQUIRES BACKEND CONFIRMATION.** See §5.3. Both `STAKEHOLDER_PROJECT_NOT_FOUND` (404) and `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE` (403) exist and the controller comment says 404 is what actually happens.
**Ask:** confirm which the adapter emits, so the client handles one path.
**Impact:** low — handling both is cheap.

### Q8 — `contactCount` vs the roster a rep can see
**Observation.** `AccountListItemView.contactCount` counts **all** contacts; `GET /accounts/{id}/contacts` returns **only the rep's own**. A UI that shows both looks broken.
**Ask:** should the count be narrowed for reps too, or should the field be documented as directory-wide?
**Impact:** low, but it is a visible inconsistency.

---

## 17. Flutter implementation checklist

**Permissions**
- [ ] Never call the nine manager-only routes (§2.2) — especially **`GET /accounts/{id}`** ⚠️
- [ ] Build account "detail" from a cached **list row** + `GET /accounts/{id}/contacts`
- [ ] Handle `403 ACCOUNT_NOT_OWNER` as read-only, not as an error ⚠️
- [ ] Track `createdAccountIds` / `createdContactIds` locally (§16-Q1)

**Parsing**
- [ ] `data` + sibling `pagination` — **not** the catalogue's nested shape ⚠️
- [ ] `POST /accounts` → `data.account`; `PATCH` → `data` ⚠️
- [ ] Treat `classification`, `contacts`, `duplicateCandidates` as **conditionally present keys**
- [ ] Make every `…By` / `…ByUser` field optional (redacted for reps)
- [ ] `account == null` ⟺ `accountId == null` on a contact

**Forms**
- [ ] Enforce every rule in §12 client-side
- [ ] **Transliterate Arabic-Indic digits → Western before sending** phone / registration ⚠️
- [ ] Send **only dirty fields** on PATCH — `""` clears server data ⚠️
- [ ] Reason fields: min 10 chars, block `< > ; ' "`, live counter
- [ ] `contacts[]` capped at 20; last `isPrimary` wins
- [ ] `isPrimary` disabled unless an account is selected

**Accounts**
- [ ] Search-first screen; empty state before the first query is correct
- [ ] `limit ≤ 25`; `search` **or** `classification` always present
- [ ] Show `isVerified: false` as *"pending review"*, never as an error ⚠️
- [ ] Show `isAuthorized: false` neutrally — an unappointed outlet is normal
- [ ] Disable classifications the account already carries (POST 409s, PATCH no-ops)

**Contacts**
- [ ] `accountId` optional on create; `company` free-text and **create-only**
- [ ] Persist the returned id for unfiled contacts ⚠️
- [ ] Render company as `account?.name ?? company`
- [ ] Roster empty state: *"you haven't added anyone here"*, not *"no contacts"* ⚠️

**Project linkage**
- [ ] Role picker: 9 values, `OTHER` last, require a note when chosen
- [ ] Role is **static** on the edit screen — no dropdown ⚠️
- [ ] Allow two accounts in one role, and a second `OWNER`
- [ ] Pre-check the decision-maker flag before offering close vs replace
- [ ] `newPrimaryContactId` required when the outgoing account holds the flag
- [ ] `reason` on set-decision-maker: **omit for the first, require on change** ⚠️
- [ ] Hide "remove decision maker" at Engagement+
- [ ] Re-fetch the project after a decision-maker change (SH3 side effects) ⚠️
- [ ] Decision maker requires: contact filed **and** account live-linked

**Errors & reliability**
- [ ] Branch on `error.code`, never on `message`
- [ ] Do **not** parse the survivor uuid out of `ACCOUNT_ALREADY_MERGED`
- [ ] Mark `POST /accounts` and `POST /contacts` **non-replayable** on 401 ⚠️
- [ ] No automatic offline write queue (§15.2) — local drafts instead ⚠️
- [ ] Debounce both searches; log `correlationId` on every error
