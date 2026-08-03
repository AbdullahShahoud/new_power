# Stakeholder module — `/accounts`, `/projects/{id}/stakeholders`, `/account-merges`

Read [README.md](README.md) first: the response envelope, the mandatory `X-Device-Id`
header, the role hierarchy and the error format are defined there.

Subsystem 03 owns the shared directory of the companies and people around projects, the
per-project role links, the single decision-maker flag, and reversible back-office merges.
Source spec: [../subsystems/03-stakeholder.md](../subsystems/03-stakeholder.md).

## The one thing to understand first

**Stakeholders are shared master data; exclusivity is per project.** Two representatives may
both deal with the same contractor — one on a tower, one on a school — and neither can see
the other's project through the account. A contractor with five buildings is five separate
opportunities, possibly for five different reps. This is rule SH1, and it is why
[`GET /accounts/{id}/projects`](#get-accountsidprojects) is a supervisory read that no
representative can reach, while the rest of the directory is searchable by everyone.

## The second thing: what a representative can do here

> **A rep contributes records and manages what they contributed, but reads nothing about
> the account itself.**

| | |
| --- | --- |
| [`POST /accounts`](#post-accounts) | Record a company they just met (SH6) |
| [`GET /accounts`](#get-accounts) | Find one, by search term |
| [`POST /accounts/{id}/contacts`](#post-accountsidcontacts) | Record a person at that company |
| [`GET /accounts/{id}/contacts`](#get-accountsidcontacts) | The people **they** added there |
| [`GET`](#get-accountsidcontactscontactid) · [`PATCH`](#patch-accountsidcontactscontactid) · [`DELETE`](#delete-accountsidcontactscontactid) `/accounts/{id}/contacts/{contactId}` | Manage those people |

They never open an account, correct one, verify one, archive one, or see its project
involvements — that is rule A3, and it is why an account a rep creates arrives
**unverified** and waits for `SALES_MANAGER`+ to confirm it.

**Contacts are the exception, and the reason is the funnel.** A rep names a
`primaryContactId` on a stakeholder link and a `contactId` when flagging the decision maker
(S3/SH2). A rep who cannot record the purchasing manager they just met cannot complete
either — SH6's argument about accounts applies unchanged to people. So the contact routes
open at the route and then narrow per record: a rep manages the people **they** entered and
never sees the account's roster.

The per-project endpoints under [`/projects/{projectId}`](#projectsprojectid--links-and-the-decision-maker)
are a different matter again: reps work deals, so all nine are open to them.

---

## Endpoint index

### `/accounts` — the shared directory

The controller is gated at `SALES_MANAGER`, and exactly two routes are opened downward to
representatives. A route added here later is closed to reps by default — the direction a
mistake should fall.

| Method | Path | Role |
| --- | --- | --- |
| GET | [`/accounts/duplicates`](#get-accountsduplicates) | `SALES_MANAGER`+ |
| GET | [`/accounts/quality-signals`](#get-accountsquality-signals) | `SALES_MANAGER`+ |
| POST | [`/accounts`](#post-accounts) | **`REPRESENTATIVE`+** |
| GET | [`/accounts`](#get-accounts) | **`REPRESENTATIVE`+** (below `SALES_ADMIN`, `search` required) |
| GET | [`/accounts/{id}`](#get-accountsid) | `SALES_MANAGER`+ |
| PATCH | [`/accounts/{id}`](#patch-accountsid) | `SALES_MANAGER`+, and then creator or `SALES_ADMIN`+ |
| POST | [`/accounts/{id}/verify`](#post-accountsidverify) | `SALES_MANAGER`+ |
| DELETE | [`/accounts/{id}`](#delete-accountsid) | `SALES_ADMIN`+ |
| GET | [`/accounts/{id}/projects`](#get-accountsidprojects) | `SALES_MANAGER`+ (**scoped**) |
| POST | [`/accounts/{id}/contacts`](#post-accountsidcontacts) | **`REPRESENTATIVE`+** |
| GET | [`/accounts/{id}/contacts`](#get-accountsidcontacts) | **`REPRESENTATIVE`+** (**own only**) |
| GET | [`/accounts/{id}/contacts/{contactId}`](#get-accountsidcontactscontactid) | **`REPRESENTATIVE`+** (**own only**) |
| PATCH | [`/accounts/{id}/contacts/{contactId}`](#patch-accountsidcontactscontactid) | **`REPRESENTATIVE`+**, and then creator or `SALES_ADMIN`+ |
| DELETE | [`/accounts/{id}/contacts/{contactId}`](#delete-accountsidcontactscontactid) | **`REPRESENTATIVE`+**, and then creator or `SALES_ADMIN`+ |

### `/projects/{projectId}` — per-project stakeholder data

| Method | Path | Role |
| --- | --- | --- |
| POST | [`/projects/{projectId}/stakeholders`](#post-projectsprojectidstakeholders) | `REPRESENTATIVE`+ |
| GET | [`/projects/{projectId}/stakeholders`](#get-projectsprojectidstakeholders) | `REPRESENTATIVE`+ |
| PATCH | [`/projects/{projectId}/stakeholders/{linkId}`](#patch-projectsprojectidstakeholderslinkid) | `REPRESENTATIVE`+ |
| DELETE | [`/projects/{projectId}/stakeholders/{linkId}`](#delete-projectsprojectidstakeholderslinkid) | `REPRESENTATIVE`+ |
| POST | [`/projects/{projectId}/stakeholders/{linkId}/replace`](#post-projectsprojectidstakeholderslinkidreplace) | `REPRESENTATIVE`+ |
| PUT | [`/projects/{projectId}/decision-maker`](#put-projectsprojectiddecision-maker) | `REPRESENTATIVE`+ |
| GET | [`/projects/{projectId}/decision-maker`](#get-projectsprojectiddecision-maker) | `REPRESENTATIVE`+ |
| DELETE | [`/projects/{projectId}/decision-maker`](#delete-projectsprojectiddecision-maker) | `REPRESENTATIVE`+ |
| GET | [`/projects/{projectId}/decision-maker/history`](#get-projectsprojectiddecision-makerhistory) | `REPRESENTATIVE`+ |

Subsystem 04 will own the `/projects` resource itself; these sub-resources are stakeholder
data and live in this module.

### `/account-merges` — back office duplicate cleanup

| Method | Path | Role |
| --- | --- | --- |
| GET | [`/account-merges/preview`](#get-account-mergespreview) | `SALES_MANAGER`+ |
| POST | [`/account-merges`](#post-account-merges) | **`SALES_ADMIN` (exact)** |
| GET | [`/account-merges`](#get-account-merges) | `SALES_MANAGER`+ |
| GET | [`/account-merges/{mergeId}`](#get-account-mergesmergeid) | `SALES_MANAGER`+ |
| POST | [`/account-merges/{mergeId}/revert`](#post-account-mergesmergeidrevert) | **`SALES_ADMIN` (exact)** |

Not `/accounts/merges`: with two controllers under one prefix, whether `merges` or `:id`
matches first would depend on module registration order, and losing that race means
`ParseUUIDPipe` rejecting the literal `"merges"` with a 400.

---

## Permissions, and why they are split this way

The spec pulls in two directions. Rule A3 says representatives do not edit master data;
rule SH6 says reps create accounts, because in the field they meet people before back office
has heard of them. Both hold under one split:

> **Contribute records, search, and manage your own contributions** is a rep capability.
> **Curating the directory** — reading an account in full, correcting it, confirming it,
> retiring it, seeing its whole roster — belongs to management and back office.

A rep's contribution is therefore accepted but marked: an account they create arrives
`isVerified: false` and stays that way until a manager or back office
[confirms it](#post-accountsidverify). That is what lets A3 hold without blocking the rep at
the moment they are standing in front of the customer.

Three gates layer on top of the `SALES_MANAGER` class floor:

- **`POST /accounts`, `GET /accounts` and the five contact routes drop to `REPRESENTATIVE`.**
  The routes that make the directory usable from the field. The contact ones are then
  narrowed per record by creator, so the drop grants a rep their own people and nobody
  else's.
- **`DELETE /accounts/{id}` needs `SALES_ADMIN`+.** Retiring an account affects every rep who
  might reach for it, which makes it master-data curation rather than field work.
- **Merge and revert use exact-match `SALES_ADMIN`.** The permission matrix gives merge
  *execution* to back office (R3), managers *approval* only, and the General Manager nothing
  — the GM is read-only over operations (A6). A rank floor would hand a GM the merge button.
  This is the second place in the codebase where `@Roles` beats `@MinRole` on purpose (the
  first is territory assignments); it is not an oversight.

### The route gate and the per-record gate answer different questions

A route gate says *which endpoints you may call*; the per-record check says *which rows they
act on*. Both run, and they do not agree by accident:

| Actor | May correct an **account** | May correct a **contact** | May read a contact |
| --- | --- | --- | --- |
| `REPRESENTATIVE` | Nothing — the route refuses first | Only ones they added | Only ones they added |
| `SALES_MANAGER` | Only ones they added | Only ones they added | **All of them** |
| `SALES_ADMIN`+ | Anyone's | Anyone's | All of them |

Note the deliberate asymmetry in the last two columns: reading across reps starts at
`SALES_MANAGER` (supervising means seeing your people's work), while *correcting* someone
else's record starts at `SALES_ADMIN` (that is master-data curation). A manager can see every
contact under an account and still only edit the ones they entered.

Verification deliberately has **no** creator check. Confirming a record is a higher tier
vouching for somebody else's entry, so an ownership test would refuse the very case the
endpoint exists for.

### SH7 — contact data is readable, but not exportable

Every role can look a company up, including its phone and email: rule A1 lists the directory as
shared master data, and someone who cannot look up a customer cannot do their job. Per-person
details are narrower — a rep reads the individuals they entered, not an account's whole roster
(see [Contacts](#contacts)).

What SH7 forbids on top of that is *bulk* access, enforced three ways:

1. there is **no export route**;
2. below `SALES_ADMIN`, `GET /accounts` must carry `search` — the directory can be searched,
   not walked;
3. below `SALES_ADMIN`, page size is capped at **25** regardless of the `limit` asked for.

Note the threshold: rules 2 and 3 bind `SALES_MANAGER` as well as `REPRESENTATIVE`. Only
`SALES_ADMIN`+ curate the directory and legitimately need all of it at once.

---

## Shared shapes

### `role` — the closed stakeholder list (S2)

```
OWNER
MAIN_CONTRACTOR
ELECTRICAL_MEP_SUBCONTRACTOR
CONSULTANT_ENGINEERING_OFFICE
PURCHASING_MANAGER
OTHER
```

The role belongs to the **link**, never to the account: the same company is the main
contractor on one project and the owner of another. An unrecognised value becomes `OTHER`
rather than an error — the closed list will always miss a real case, and refusing would leave
the rep unable to record what they found. Overuse of `OTHER` surfaces in
[`/accounts/quality-signals`](#get-accountsquality-signals) instead.

What the uniqueness rule does and does not constrain:

| Situation | Allowed? |
| --- | --- |
| Same account, same role, twice on one project | ✖ `409 STAKEHOLDER_ALREADY_LINKED` |
| Same account holding two different roles | ✔ a contractor who also owns the building |
| Two accounts sharing one role | ✔ two consultants on a tower is normal |
| A second `OWNER` | ✔ more likely joint ownership than an error — monitored, not blocked |
| The same triple again after the first link closed | ✔ closed rows are exempt |

### `reason` — the mandatory explanation

Required on: archiving an account or contact, closing or replacing a link, moving or clearing
the decision-maker flag, merging, and reverting.

| Rule | Value |
| --- | --- |
| Minimum length | 10 characters |
| Maximum length | 500 characters |
| Forbidden characters | `<` `>` `;` `"` `'` |

The 10-character floor is the same one `TerritoryReasonDto` uses, for the same reason: `n/a`
and `-` are what a mandatory-reason field collects when it accepts anything.

### Name matching — how duplicates are found (SH6)

Every account stores a derived comparison key alongside the name a rep typed. The stored name
is never altered; the key is never shown. It folds away everything a human varies without
meaning a different company:

| Folded | Example |
| --- | --- |
| Case and punctuation | `AL-AMAL CO.` → `al amal` |
| Legal forms and trade boilerplate | `Al Amal Contracting Co. Ltd` → `al amal` |
| Arabic orthography (`أإآٱ→ا`, `ى→ي`, `ة→ه`, `ؤ→و`, tashkeel, tatweel) | `الأمل` ≡ `الامل` |
| Arabic-Indic digits | `المزة ٨٦` ≡ `المزه 86` |

Whole-word matching only, so `Incoming Contractors` keeps its `Inc`-prefixed word. A name that
folds to nothing (`"..."`, a bare `شركة`) is rejected — it could never participate in matching.

Similarity is scored by PostgreSQL `pg_trgm` over that key. Three match kinds:

| `matchKind` | `score` | Meaning |
| --- | --- | --- |
| `REGISTRATION_NUMBER` | `1` | Same commercial registration — the same company, not a guess |
| `EXACT_NAME` | `1` | Keys are identical |
| `SIMILAR_NAME` | `0.45`–`1` | Similar enough for a human to look |

**Nothing is ever blocked on this.** A rep in front of a customer has to be able to record
them; a system that refuses because a name resembles an existing one earns `Al Amal 2`.

> **Phone numbers and registration numbers accept western digits (`0-9`) only.** Both are
> identifiers that get dialled, read back to a registry, or pasted into other systems, so an
> Arabic-Indic value is refused rather than transliterated into something that no longer
> matches the card or the certificate. Account *names* do fold `٠-٩` onto `0-9`, because that
> is a fuzzy comparison key nobody dials.

---

## `/accounts`

### POST `/accounts`

Adds a company or individual to the shared directory. `REPRESENTATIVE`+.

```json
{
  "name": "Al-Amal Contracting Co.",
  "type": "COMPANY",
  "registrationNumber": "1234-56/A",
  "phone": "0991234567",
  "email": "info@al-amal.com",
  "city": "Damascus",
  "addressLine": "Mazzeh highway, building 12",
  "notes": "Deals only through their Aleppo office."
}
```

Only `name` is required. `type` is `COMPANY` (default) or `INDIVIDUAL`.

**The response differs by role.** For `SALES_MANAGER`+:

```http
201 Created
```
```json
{
  "success": true,
  "message": "Account created successfully",
  "data": {
    "account": { "id": "…", "name": "Al-Amal Contracting Co.", "isVerified": true,
                 "verifiedAt": "…", "verifiedBy": "…", "contactCount": 0, "activeLinkCount": 0, "…": "…" },
    "duplicateCandidates": [
      { "accountId": "…", "name": "Alamal Contracting", "score": 0.62, "matchKind": "SIMILAR_NAME", "archivedAt": null }
    ]
  }
}
```

For a `REPRESENTATIVE` — no `duplicateCandidates` key at all, and the account is unverified:

```json
{
  "success": true,
  "message": "Account created successfully",
  "data": {
    "account": { "id": "…", "name": "Al-Amal Contracting Co.", "isVerified": false,
                 "verifiedAt": null, "verifiedBy": null, "…": "…" }
  }
}
```

**`data` has up to two keys here, unlike every other endpoint in this module.** The account is
under `data.account`, not `data`.

#### `isVerified` — who vouches for the record

| Creator | Result |
| --- | --- |
| `REPRESENTATIVE` | `isVerified: false` — waits for [`POST /accounts/{id}/verify`](#post-accountsidverify) |
| `SALES_MANAGER`+ | `isVerified: true`, `verifiedBy` set to the creator |

A manager creating an account *is* the confirmation, so making them verify their own entry
afterwards would be ceremony. The column defaults to `false`, so any future insert path that
forgets it produces an unverified record — the safe direction to be wrong in.

#### `duplicateCandidates` — withheld from representatives

The key is **absent** for a rep, not empty. Those are two different statements: an empty array
means the directory holds nothing similar, while a missing key means "not shown to you". A
near-duplicate names an account the rep did not search for and may be on another rep's patch,
and reconciling duplicates is back office's job (SH6) — the same reason
[`/accounts/duplicates`](#get-accountsduplicates) starts at `SALES_MANAGER`.

**Withholding the list does not switch the detection off.** For a rep's creation the check still
runs, `ProbableDuplicateDetected` still fires, the audit entry still names the candidates, and
back office still gets the account on its merge queue. Whether back office finds out must not
depend on who typed the name.

| Status | Code | When |
| --- | --- | --- |
| 400 | `ACCOUNT_INVALID_NAME` | Blank, under 2 chars, over 200, control characters, or folds to nothing |
| 400 | `ACCOUNT_INVALID_REGISTRATION_NUMBER` | Non-western digits, or not letters/digits once separators are stripped |
| 400 | `CONTACT_INVALID_PHONE` / `CONTACT_INVALID_EMAIL` | See the note on digits above |

### GET `/accounts`

Searches the directory. `REPRESENTATIVE`+ — a rep's only read here.

| Query | Notes |
| --- | --- |
| `search` | Name, city, phone, email or registration number. **Required below `SALES_ADMIN`** |
| `type` | `COMPANY` \| `INDIVIDUAL` |
| `city` | Exact, case-insensitive |
| `includeArchived` | Default `false` |
| `includeMerged` | Default `false` — merged-away records would be a wrong click |
| `page`, `limit` | `limit` capped at **25** below `SALES_ADMIN` |

Omitting `search` returns an **empty page, not a 403**: the list is not forbidden, there is
simply nothing to return until you say what you are looking for.

Rows carry `isVerified`, so a caller can tell a confirmed account from a representative's
pending entry without a second request.

### GET `/accounts/{id}`

One account with its contacts and counts. `SALES_MANAGER`+ — a rep who needs to identify an
account uses [`GET /accounts`](#get-accounts) with a search term.

**Merged accounts resolve to the survivor.** If `{id}` was merged away, the surviving account is
returned with `resolvedFrom` set to the id you asked for (`null` on a direct hit) — so a stale
bookmark shows live data and the client can tell it happened. That is rule SH5: rep-facing views
show the surviving account immediately.

### PATCH `/accounts/{id}`

`SALES_MANAGER`+ at the route, then creator or `SALES_ADMIN`+ per record. Every field optional.

**Omitted leaves alone; explicit `null` clears.** A PATCH without `phone` keeps the number a rep
collected. Sending `""` also clears, since that is what an emptied form field means.

A PATCH that resends the current values is a **no-op**: no write, no audit entry, no event. The
trail records changes, not requests.

| Status | Code | When |
| --- | --- | --- |
| 403 | `ACCOUNT_NOT_OWNER` | Not the creator and below `SALES_ADMIN` |
| 400 | `ACCOUNT_ARCHIVED` | Archived records are frozen |
| 409 | `ACCOUNT_ALREADY_MERGED` | Merged away; the error carries `survivingAccountId` to follow |

Correcting an account does **not** change `isVerified`. A verified record stays verified through
an edit; the flag records that someone checked the entry, and reps cannot reach this route to
alter it afterwards.

### POST `/accounts/{id}/verify`

Confirms an account a representative added. `SALES_MANAGER`+. **No body.**

```http
200 OK
```
```json
{
  "message": "Account verified successfully",
  "data": { "id": "…", "name": "Al-Amal Contracting Co.", "isVerified": true,
            "verifiedAt": "2026-07-30T09:14:00.000Z", "verifiedBy": "…",
            "verifiedByUser": { "id": "…", "firstName": "Layla", "…": "…" }, "…": "…" }
}
```

This is the other half of the SH6 trade. Creation stays open to reps so they can record someone
they just met, which means the directory accepts unchecked master data; this is how a record
stops being unchecked.

- **Not confined to the creator**, unlike `PATCH`. The whole point is confirming somebody else's
  work, so an ownership check would refuse exactly the intended case.
- **No `reason` required.** The operations in this module that demand one are undoing or
  rewriting something and the trail has to explain it. Confirming a record undoes nothing, and
  `verifiedBy`/`verifiedAt` plus the audit entry already answer who and when.
- **Verifying twice is a no-op** returning `200` with the account unchanged — the original
  `verifiedBy` and `verifiedAt` are not overwritten. No write, no audit entry, no event.
- **There is no un-verify.** Verification records that someone checked the record, which is not
  a state you take back. A record that turns out to be wrong is corrected or archived.

The audit entry pairs `createdBy` with the verifying actor, which is what makes a
self-verification visible in a review trail.

| Status | Code | When |
| --- | --- | --- |
| 404 | `ACCOUNT_NOT_FOUND` | No such account |
| 400 | `ACCOUNT_ARCHIVED` | Archived records cannot be confirmed |
| 409 | `ACCOUNT_ALREADY_MERGED` | Confirming a row every read redirects away from would mean nothing. Carries `survivingAccountId`, so a stale review list can retry against the survivor |

### DELETE `/accounts/{id}`

Archives (soft-deletes). `SALES_ADMIN`+. Body: `{ "reason": "…" }`.

Nothing is ever hard-deleted (rule A4). Refused while the account still has live project links:
those belong to deals in progress, and closing them is a decision made per project.

| Status | Code |
| --- | --- |
| 409 | `ACCOUNT_HAS_ACTIVE_LINKS` — the error carries `activeLinkCount` |

### GET `/accounts/{id}/projects`

Which projects this account is involved in. **Scoped — this is the SH1 endpoint.**
`SALES_MANAGER`+.

| Caller | Sees |
| --- | --- |
| `REPRESENTATIVE` | Nothing — the route refuses. A rep has no cross-project view of an account |
| `SALES_MANAGER`+ | Every involvement on a project they may see |

That is how SH1 holds for a rep, and it is stronger than filtering: rather than being shown a
narrowed list, they cannot ask the question. The supervisory tiers get the read because seeing
across their people is the job.

One row per **involvement**, not per project, since an account can hold two roles on one
project. Closed involvements are included — the history is the point.

```json
{
  "data": [
    { "linkId": "…", "projectId": "…", "role": "MAIN_CONTRACTOR",
      "startedAt": "…", "endedAt": null, "isActive": true,
      "linkedBy": "…", "linkedByUser": { "id": "…", "firstName": "Layla", "…": "…" } }
  ],
  "pagination": { "total": 1, "page": 1, "limit": 20, "totalPages": 1 }
}
```

> **Wins, losses and total won value are not here.** Account history (S5) is computed from
> confirmed outcomes, and subsystem 09 owns what "confirmed" means. It will define that
> contract when it is built.

> **Interim scoping, while subsystem 04 is unbuilt.** The application layer still carries a
> rep-only narrowing (links they created themselves, a proxy for project ownership rather than a
> synonym). No rep currently reaches it, since the route now starts at `SALES_MANAGER` — it
> stays as defence in depth for the day this route is reopened or another caller appears. When 04
> lands it is replaced by real ownership and support.

### Contacts

**All five contact routes are open to `REPRESENTATIVE`**, unlike everything else under
`/accounts`. This is the one place a rep manages directory data, and it is scoped by
authorship rather than by tier:

| | `REPRESENTATIVE` | `SALES_MANAGER` | `SALES_ADMIN`+ |
| --- | --- | --- | --- |
| Add a person | ✔ any account | ✔ | ✔ |
| Read | Only ones they added | All | All |
| Correct / archive | Only ones they added | Only ones they added | Any |

The reason reps get this at all is the funnel: they name a `primaryContactId` when linking a
stakeholder and a `contactId` when flagging the decision maker (S3/SH2), and a rep who cannot
record the purchasing manager they just met cannot complete either. SH6's argument about
accounts applies unchanged to people.

The reason it is scoped: a rep has no access to the account page these people hang off, so
returning the account's whole roster would hand back through the side door exactly what
closing the account routes withheld.

`POST /accounts/{id}/contacts` — `REPRESENTATIVE`+.

```json
{ "firstName": "Ahmad", "lastName": "Al Sayed", "position": "Purchasing Manager",
  "phone": "0991234567", "email": "ahmad@al-amal.com", "isPrimary": true }
```

Both name parts are required: a directory entry with only a first name is not findable six
months later. The contact is stamped with its creator, and that stamp is what the rep may later
read back, correct and retire.

> **`isPrimary` is an account-level attribute, not a personal one.** Setting it steps the
> incumbent down in the same transaction — at most one primary per live account — and that
> incumbent may be a contact another rep added. It is the one way a rep's write reaches a row
> they do not own. Left as-is because "who to ask for at this company" is a fact about the
> company that whoever is standing there knows best; restrict it if that turns out to be
> abused.

**One physical person gets one row per account** however many projects they appear on and in
whatever roles (S-E4). The `(project, role)` pair lives on the link, so the same person can be
the decision maker on one project and an ordinary contact on another.

`GET` returns them primary-first then alphabetical; `?includeArchived=true` includes people who
have left, which is useful when reading an old visit that named one. **For a representative both
reads are narrowed to contacts they added.** Asking for someone else's by id returns **404, not
403** — the same as the list, which simply omits them. A 403 would confirm that this id names a
real person at a company the rep cannot otherwise read, which is the one bit the account gating
exists to withhold; "not yours" and "not there" should be indistinguishable from outside.

The narrowing applies to the HTTP path only. `STAKEHOLDER_FACADE.findContact` passes no actor
context and sees every contact, because subsystem 06 validating the "persons met" on a visit has
already established who may act — re-deciding it here would deny a read belonging to a different
question.

`PATCH` follows the same omitted/`null` rules as accounts. The account a contact belongs to
**cannot** be changed: a person changing employer is a new contact under the new account. The one
exception is a merge, which moves contacts wholesale.

`DELETE` archives, with a reason.

| Status | Code | When |
| --- | --- | --- |
| 409 | `CONTACT_IS_DECISION_MAKER` | They hold the flag somewhere. Carries `projectCount` |
| 400 | `CONTACT_NOT_ON_ACCOUNT` | The contact belongs to a different account than the route says |
| 403 | `ACCOUNT_NOT_OWNER` | `PATCH`/`DELETE` on someone else's contact, below `SALES_ADMIN` |
| 404 | `CONTACT_NOT_FOUND` | No such contact — **or** one this caller may not see (see above) |

Archiving a flagged decision maker is refused rather than cascaded: S3 says every project has
exactly one at any time, so retiring them would either break that or silently pick a successor —
and that choice belongs to whoever owns the project.

---

## `/projects/{projectId}` — links and the decision maker

### POST `/projects/{projectId}/stakeholders`

```json
{ "accountId": "…", "role": "MAIN_CONTRACTOR", "primaryContactId": "…",
  "note": "Handles the electrical package.", "startedAt": "2026-05-15T00:00:00.000Z" }
```

`primaryContactId` is optional — a rep often knows the company before they know who to ask for —
and must be a contact of the account being linked. `startedAt` back-dates an involvement being
recorded after the fact.

### GET `/projects/{projectId}/stakeholders`

Active first, then newest. `?includeClosed=true` adds the ones that have ended — how "who was the
main contractor before this one" is answered. Closed links are never deleted (S-E2).

### PATCH `/projects/{projectId}/stakeholders/{linkId}`

`primaryContactId` and `note` only.

**The role cannot be changed.** It is part of the link's identity, so moving an account from
Consultant to Main Contractor closes one link and opens another rather than rewriting history to
claim they were always the contractor. Use `replace`, or close and link again.

### DELETE `/projects/{projectId}/stakeholders/{linkId}`

Closes the link with an end date — never deletes it. Every visit and quote stays attached to the
project, and past involvement stays answerable (S-E2). Body takes `reason` and an optional
`endedAt` for a departure noticed late.

| Status | Code | When |
| --- | --- | --- |
| 400 | `STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED` | This link holds the decision-maker flag |

The flag points at this link, so closing it would orphan the flag. Use `replace`, which moves the
flag and closes the link as one decision, or name a different decision maker first.

### POST `/projects/{projectId}/stakeholders/{linkId}/replace`

Rule SH4 — one business event, one transaction.

```json
{ "newAccountId": "…", "newPrimaryContactId": "…", "note": "Took over in July.",
  "reason": "the owner replaced the main contractor mid-project" }
```

In a single transaction: the outgoing link is closed with an end date, the incoming account opens
in the **same role**, and the closed link records its successor in `replacedByLinkId` — so "who
replaced whom" reads off the chain rather than off adjacent timestamps. All prior visits, quotes
and history stay attached to the project.

**If the outgoing account holds the decision-maker flag**, the flag moves across in the same
transaction and `newPrimaryContactId` becomes **required** — leaving the project flagless is
forbidden by S3, and the replacement reason doubles as the flag-move reason. `DecisionMakerChanged`
still fires, so subsystems 04 and 08 react exactly as they would to any other move.

| Status | Code | When |
| --- | --- | --- |
| 400 | `STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED` | The flag rides this link and no successor contact was named |
| 409 | `STAKEHOLDER_ALREADY_LINKED` | The incoming account already holds that role here |
| 400 | `STAKEHOLDER_LINK_CLOSED` | Already closed |

### PUT `/projects/{projectId}/decision-maker`

Sets **or moves** the flag — the difference is whether the project already has one, which the
server discovers rather than the caller declaring.

```json
{ "contactId": "…", "reason": "purchasing moved from the contractor to the owner" }
```

| | `reason` |
| --- | --- |
| First decision maker on a project | omitted — naming someone for the first time is not a change to explain |
| Every subsequent move | **required** (SH2) |

The named contact's account must have a live link on this project: a quote is an offer *to*
someone, so the decision maker has to be someone the project actually deals with.

The move is **atomic** — the old period closes and the new one opens in one transaction, so the
project is never left with zero and never with two (S3). A partial unique index on
`(project_id) WHERE ended_at IS NULL` is the backstop if two reps try at once.

Re-flagging the same contact is a **no-op** returning `200`: a double-tap in the field should not
demand a reason for a change that is not one.

On a change, subsystem 04 is notified and *offers* the rep a stage regression, and 08 flags an
active quote as "approved by previous decision maker" (SH3). Neither is forced; the log keeps
both facts.

| Status | Code | When |
| --- | --- | --- |
| 400 | `DECISION_MAKER_REASON_REQUIRED` | Moving the flag without a reason |
| 400 | `CONTACT_NOT_ON_PROJECT` | The contact's account has no live link here |
| 400 | `CONTACT_ARCHIVED` | The contact has left |

### GET `/projects/{projectId}/decision-maker`

Returns `data: null` when none is flagged — an ordinary state for a project at Lead, not an error.
This is the read behind 04's Engagement gate and 08's quote prerequisite, which is why the
contact and the account are joined in: a blocking message should name who is missing, not just
report that someone is.

### DELETE `/projects/{projectId}/decision-maker`

Removes the flag without a successor, for the honest case where the wrong person was flagged
early. **Refused from `ENGAGEMENT` onwards** (SH2): the flag is the gate for entering Engagement,
so emptying it afterwards would leave the project in a stage it no longer qualifies for.

Naming a replacement is always allowed at any stage — that is a change, not a removal.

| Status | Code |
| --- | --- |
| 400 | `DECISION_MAKER_REQUIRED_AT_STAGE` — carries the `stage` |
| 404 | `DECISION_MAKER_NOT_SET` |

> While subsystem 04 is unbuilt this gate cannot fire: every project reports as `LEAD`. The rule
> is implemented and unit-tested against a mocked project directory, and starts working the day a
> real adapter reports a real stage.

### GET `/projects/{projectId}/decision-maker/history`

Every decision maker the project has had, newest first, each closed period carrying who ended it
and why — the audit answer to "who was making the call when that quote was approved". Paginated,
because the table is append-only and a project that changes hands often accumulates rows
indefinitely.

---

## `/account-merges`

The workflow is **preview → execute → 30-day revert window → permanent**.

### GET `/account-merges/preview`

`?survivingAccountId=…&mergedAccountId=…`. `SALES_MANAGER`+, since a manager approves merges.

```json
{
  "data": {
    "survivingAccount": { "id": "…", "name": "Al-Amal Contracting Co.", "type": "COMPANY" },
    "mergedAccount": { "id": "…", "name": "Alamal Contracting", "type": "COMPANY" },
    "contacts": [ "…everything that moves…" ],
    "links": [ "…everything that moves…" ],
    "collisions": [ { "linkId": "…", "projectId": "…", "role": "MAIN_CONTRACTOR" } ],
    "decisionMakerPeriodCount": 1,
    "revertWindowDays": 30
  }
}
```

**Read `collisions` carefully.** Those are links the survivor already holds in the same role on
the same project, so they will be **closed** rather than moved — the one-active-link-per-(project,
account, role) rule leaves no alternative. That overlap is common on exactly the pairs worth
merging, since two records of one company tend to be linked to the same building. A revert reopens
them.

### POST `/account-merges`

**Exact `SALES_ADMIN`.**

```json
{ "survivingAccountId": "…", "mergedAccountId": "…",
  "reason": "same company, two spellings of the name from two reps" }
```

One transaction: contacts move (archived ones too, so the survivor's history is complete), links
move open and closed alike, colliding links are closed, decision-maker periods repoint, and the
merged account is stamped with a pointer to the survivor. All or nothing.

The merged account **keeps its row** — that is what lets reads redirect immediately and a revert
restore. Response carries `revertDeadline` and `isRevertable`.

| Status | Code | When |
| --- | --- | --- |
| 400 | `ACCOUNT_CANNOT_MERGE_INTO_SELF` | Same id both sides |
| 409 | `ACCOUNT_ALREADY_MERGED` | Either side was already merged away |
| 400 | `ACCOUNT_ARCHIVED` | Merging into an archived account would bury both |

### GET `/account-merges` · GET `/account-merges/{mergeId}`

The merge log, newest first. `isRevertable` is evaluated at read time, so the list doubles as the
"what can still be undone" worklist. A reverted merge stays in the log forever — it is still
evidence that it happened (AU2).

### POST `/account-merges/{mergeId}/revert`

**Exact `SALES_ADMIN`.** Body: `{ "reason": "…" }`.

Restores exactly what the merge moved, from its snapshot: contacts and links go back, links the
merge had to close reopen, decision-maker periods repoint, and the resurrected account stops
pointing at the survivor. **Whatever the survivor has accumulated since is left alone** — that is
the difference between a revert and "move everything back".

| Status | Code | When |
| --- | --- | --- |
| 409 | `ACCOUNT_MERGE_ALREADY_REVERTED` | Duplicate request |
| 400 | `ACCOUNT_MERGE_WINDOW_EXPIRED` | Past the deadline. Carries `revertDeadline` |

Two distinct errors on purpose: a duplicate request is the caller's mistake, an expired window is
a permanent state **no rank can escalate past**. That is what "after the window, merges are
permanent" means.

---

## Data-quality reports

### GET `/accounts/duplicates`

`SALES_MANAGER`+. Probable-duplicate **pairs**, strongest first, each pair appearing once — a
report listing "A resembles B" and "B resembles A" would double back office's work for nothing.
Archived and merged-away accounts are excluded.

`?threshold=0.6` overrides the default `0.45`. The threshold in force is echoed in the `message`,
so a report's sensitivity is never invisible.

### GET `/accounts/quality-signals`

`SALES_MANAGER`+. This subsystem's feed into the data-quality report (subsystem 15):

```json
{
  "data": {
    "probableDuplicates": [ { "left": "…", "right": "…", "score": 0.62, "matchKind": "SIMILAR_NAME" } ],
    "otherRoleOveruse": [ { "repId": "…", "rep": "…", "otherLinkCount": 4, "totalLinkCount": 9, "ratio": 0.44 } ]
  }
}
```

`otherRoleOveruse` lists reps filing at least 5 links with 30%+ under `OTHER`. **No signal
triggers any automatic sanction** — patterns surface to the right manager and stop there (AQ5).

> One signal this subsystem owes 15 is **absent rather than empty**: "projects at Engagement or
> beyond whose flagged decision maker has no logged meeting" needs the visit log from subsystem
> 06, which is not built. Reporting it as zero would read as "everyone has been met".

---

## Error codes

| Code | Status |
| --- | --- |
| `ACCOUNT_NOT_FOUND`, `CONTACT_NOT_FOUND`, `STAKEHOLDER_LINK_NOT_FOUND`, `DECISION_MAKER_NOT_SET`, `ACCOUNT_MERGE_NOT_FOUND`, `STAKEHOLDER_PROJECT_NOT_FOUND` | 404 |
| `ACCOUNT_NOT_OWNER`, `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE` | 403 |
| `STAKEHOLDER_ALREADY_LINKED`, `ACCOUNT_ALREADY_MERGED`, `ACCOUNT_HAS_ACTIVE_LINKS`, `CONTACT_IS_DECISION_MAKER`, `ACCOUNT_MERGE_ALREADY_REVERTED`, `DECISION_MAKER_PERIOD_CLOSED` | 409 |
| `ACCOUNT_INVALID_NAME`, `CONTACT_INVALID_NAME`, `CONTACT_INVALID_PHONE`, `CONTACT_INVALID_EMAIL`, `ACCOUNT_INVALID_REGISTRATION_NUMBER`, `STAKEHOLDER_INVALID_REASON` | 400 |
| `ACCOUNT_ARCHIVED`, `CONTACT_ARCHIVED`, `STAKEHOLDER_LINK_CLOSED`, `CONTACT_NOT_ON_ACCOUNT`, `CONTACT_NOT_ON_PROJECT`, `DECISION_MAKER_REQUIRED_AT_STAGE`, `DECISION_MAKER_REASON_REQUIRED`, `STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED`, `ACCOUNT_CANNOT_MERGE_INTO_SELF`, `ACCOUNT_MERGE_WINDOW_EXPIRED` | 400 |

---

## For the subsystems still to come

This module publishes an inbound facade (`STAKEHOLDER_FACADE`) so other modules never reach for
the command or query buses:

| Consumer | Needs |
| --- | --- |
| **04** Project & Funnel | `countActiveStakeholders` for the Qualified gate; `getDecisionMaker` for the Engagement gate. Consumes `DecisionMakerChanged` and *offers* a stage regression (PF7) |
| **08** Quotation | `getDecisionMaker` for Q1 — a quote is an offer *to* someone. Consumes `DecisionMakerChanged` to flag a quote as approved by the previous decision maker (Q9) |
| **06** Field Activity | `findContact` / `listProjectContacts` to validate "persons met" on a visit |
| **05** Ownership & Duplicates | `moveProjectLinks` for the `ProjectsMerged` cascade |

**`projectId` carries no foreign key.** Projects belong to subsystem 04, which does not exist yet,
so this is a cross-context reference — the same shape as `users.approved_by` naming an account it
cannot join. Project existence, ownership and stage all sit behind one outbound port with a
temporary permissive adapter that logs a warning at startup. When 04 lands: bind a real adapter,
add the foreign keys, drop the interim rep-scoping clause, and delete the placeholder. Nothing
else changes.
