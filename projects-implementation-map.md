# Projects module — Phase 0 business analysis & implementation map

Reference document for every phase of the Sales-Representative business-logic
build (`projects-client-reference.md` + `stakeholders.md`). Written before any
production code; kept up to date as later phases land. Nothing here invents a
rule the source docs don't state — where a decision was still needed, it's
called out explicitly in §10.

---

## 1. Module inventory (every endpoint, phase-tagged)

| Resource | Endpoint | Phase |
| --- | --- | --- |
| **Files** | `POST /files` | 1 |
| | `POST /files/resolve` | 1 |
| **Projects** | `POST /projects` | 1 |
| | `GET /projects` | 1 |
| | `GET /projects/nearby` | 1 |
| | `GET /projects/{id}` | 1 |
| | `PATCH /projects/{id}` | 1 |
| | `PUT /projects/{id}/stage` | 1 |
| | `PUT /projects/{id}/status` | 1 |
| | `PUT /projects/{id}/location` | 1 |
| | `GET /projects/{id}/history` | 1 |
| | `POST /projects/{id}/images` | 1 |
| | `DELETE /projects/{id}/images/{imageId}` | 1 |
| **Activities** | `GET /projects/needs-attention` | 2 (server-broken, see §10) |
| | `POST /projects/{projectId}/activities` | 2 |
| | `GET /projects/{projectId}/activities` | 2 |
| | `POST /activities/sync` | 2 (bloc lands in 2, orchestration lands in 4) |
| | `GET /activities` | 2 |
| | `GET /activities/{id}` | 2 |
| | `PATCH /activities/{id}` | 2 |
| **Outcomes** | `POST /projects/{projectId}/won` | 3 |
| | `POST /projects/{projectId}/lost` | 3 |
| | `GET /outcomes` | 3 |
| | `GET /outcomes/{id}` | 3 |
| | `POST /outcomes/{id}/confirm` | 3 |
| | `POST /outcomes/{id}/reject` | 3 |
| **Reports** | `GET /reports/pipeline` | 5 |
| | `GET /reports/rep-activity` | 5 |
| | `GET /reports/win-loss` | 5 |
| | `GET /reports/sales-by-outlet` | 5 |
| | `GET /reports/loss-analysis` | 5 |
| **Accounts** (stakeholders.md) | `POST /accounts` | 6 |
| | `GET /accounts` | 6 |
| | `GET /accounts/{id}` | 6 (mgr+) |
| | `PATCH /accounts/{id}` | 6 (mgr+) |
| | `POST /accounts/{id}/verify` | 6 (mgr+) |
| | `DELETE /accounts/{id}` | 6 (admin+) |
| | `GET /accounts/{id}/projects` | 6 (mgr+, scoped) |
| | `POST/GET /accounts/{id}/contacts` | 6 |
| | `GET/PATCH/DELETE /accounts/{id}/contacts/{contactId}` | 6 |
| **Project stakeholders** (stakeholders.md) | `POST/GET /projects/{projectId}/stakeholders` | 6 |
| | `PATCH/DELETE /projects/{projectId}/stakeholders/{linkId}` | 6 |
| | `POST /projects/{projectId}/stakeholders/{linkId}/replace` | 6 |
| | `PUT/GET/DELETE /projects/{projectId}/decision-maker` | 6 |
| | `GET /projects/{projectId}/decision-maker/history` | 6 |
| **Account merges / quality** (stakeholders.md) | `GET/POST /account-merges*` | out of scope — back-office (`SALES_ADMIN` exact), not Sales-Rep |
| | `GET /accounts/duplicates`, `/quality-signals` | out of scope — `SALES_MANAGER`+ back-office reporting, not Sales-Rep |

`OfflineSyncBloc` (Phase 4) owns **no endpoints of its own** — it's a local
queue that replays through `ProjectsRepository`/`ActivitiesRepository`
(`POST /activities/sync`, `GET /projects?updatedSince=`). Its dependency
graph entry in §5 reflects that.

---

## 2. Endpoint → Repository → Bloc → Screen mapping

### Phase 1 — Files & Projects

| Endpoint | Repository method | Bloc event | Screen(s) |
| --- | --- | --- | --- |
| `POST /files` | `FileRepository.uploadFile` | `FileUploadRequested` | Register-project photo picker, (later) activity attachment picker |
| `POST /files/resolve` | `FileRepository.resolveFile` | `FileResolveRequested` | Anywhere a `StoredFileView.url` has expired |
| `POST /projects` | `ProjectsRepository.register` | `ProjectRegisterSubmitted` | `register_project_screen.dart` |
| `GET /projects` | `ProjectsRepository.list` | `ProjectsListRequested`, `ProjectsListRefreshed`, `ProjectsNextPageRequested`, `ProjectsFilterChanged`, `ProjectsSearchChanged` | `projects_list_screen.dart` |
| `GET /projects/nearby` | `ProjectsRepository.nearby` | `ProjectsNearbyRequested` | Register-project duplicate-candidate view (reuses the same `nearbyProjects` shape returned inline by `POST /projects`, so this endpoint itself is mainly for the free-standing "what's around me" scouting view — included in Phase 1 since it shares 100% of the model/repo work) |
| `GET /projects/{id}` | `ProjectsRepository.getById` | `ProjectDetailRequested` | `project_detail_screen.dart` |
| `PATCH /projects/{id}` | `ProjectsRepository.patch` | `ProjectPatchSubmitted` | `project_detail_screen.dart` (edit sheet) |
| `PUT /projects/{id}/stage` | `ProjectsRepository.changeStage` | `ProjectStageChangeSubmitted` | `project_detail_screen.dart` (stage dropdown) |
| `PUT /projects/{id}/status` | `ProjectsRepository.changeStatus` | `ProjectStatusChangeSubmitted` | `project_detail_screen.dart` (status control) |
| `PUT /projects/{id}/location` | `ProjectsRepository.changeLocation` | `ProjectLocationChangeSubmitted` | `project_detail_screen.dart` (manager-only control) |
| `GET /projects/{id}/history` | `ProjectsRepository.history` | `ProjectHistoryRequested` | `project_detail_screen.dart` (history section) |
| `POST /projects/{id}/images` | `ProjectsRepository.addImages` | `ProjectImagesAddSubmitted` | `project_detail_screen.dart` (gallery) |
| `DELETE /projects/{id}/images/{imageId}` | `ProjectsRepository.removeImage` | `ProjectImageRemoveSubmitted` | `project_detail_screen.dart` (gallery) |

### Phase 2 — Activities

| Endpoint | Repository method | Bloc event | Screen(s) |
| --- | --- | --- | --- |
| `GET /projects/needs-attention` | `ActivitiesRepository.needsAttention` | `AttentionListRequested` | Home tab (replacing the current dashboard placeholder) |
| `POST /projects/{projectId}/activities` | `ActivitiesRepository.log` | `ActivityLogSubmitted` | `log_activity_screen.dart` |
| `GET /projects/{projectId}/activities`, `GET /activities` | `ActivitiesRepository.list` | `ActivitiesListRequested` (project-scoped or global via a `projectId?` param) | `project_detail_screen.dart` feed, a future "my activities" screen |
| `GET /activities/{id}` | `ActivitiesRepository.getById` | `ActivityDetailRequested` | `activity_detail_screen.dart` |
| `PATCH /activities/{id}` | `ActivitiesRepository.edit` | `ActivityEditSubmitted` | `activity_detail_screen.dart` (author-only edit sheet) |
| `POST /activities/sync` | `ActivitiesRepository.syncBatch` | consumed by `OfflineSyncBloc` in Phase 4, but the repository method and its response typing land in Phase 2 alongside the rest of the Activities contract | — (no direct screen; background) |

### Phase 3 — Outcomes

| Endpoint | Repository method | Bloc event | Screen(s) |
| --- | --- | --- | --- |
| `POST /projects/{projectId}/won` | `OutcomesRepository.submitWon` | `OutcomeWonSubmitted` | none yet — deferred to Phase 6 (decision 11); model/repo/Bloc wiring is complete and ready |
| `POST /projects/{projectId}/lost` | `OutcomesRepository.submitLost` | `OutcomeLostSubmitted` | `submit_outcome_screen.dart` |
| `GET /outcomes` | `OutcomesRepository.list` | `OutcomesListRequested` (incl. `status=PENDING`, doubling as the manager queue when a manager's own scoped results are filtered to it) | `outcomes_list_screen.dart` |
| `GET /outcomes/{id}` | `OutcomesRepository.getById` | `OutcomeDetailRequested` | `outcome_detail_screen.dart` |
| `POST /outcomes/{id}/confirm` | `OutcomesRepository.confirm` | `OutcomeConfirmSubmitted` | none — never rendered in Phase 3 UI (decision 12); repository/Bloc plumbing complete and ready |
| `POST /outcomes/{id}/reject` | `OutcomesRepository.reject` | `OutcomeRejectSubmitted` | `outcome_detail_screen.dart`, always labeled "Withdraw" (decision 12) |

### Phase 4 — Offline sync (composition, no new endpoints)

| Local concern | Bloc event | Backed by |
| --- | --- | --- |
| Queue a captured activity | `OfflineActivityQueued` | local store (Hive — see §10) |
| Attempt to flush the queue | `OfflineSyncTriggered` (manual pull-to-sync, and automatic on connectivity-restored) | `ActivitiesRepository.syncBatch` |
| Per-item result applied | `OfflineSyncItemResolved` (internal, drives `CREATED`/`DUPLICATE`/`REJECTED` handling) | response of `syncBatch` |
| Delta pull after a successful sync | `OfflineDeltaPullRequested` | `ProjectsRepository.list(updatedSince: lastSyncAt)` |

### Phase 5 — Reports

| Endpoint | Repository method | Bloc event | Screen(s) |
| --- | --- | --- | --- |
| `GET /reports/pipeline` | `ReportsRepository.pipeline` | `PipelineReportRequested` | `reports_screen.dart` (tab 1) |
| `GET /reports/rep-activity` | `ReportsRepository.repActivity` | `RepActivityReportRequested` | tab 2 |
| `GET /reports/win-loss` | `ReportsRepository.winLoss` | `WinLossReportRequested` | tab 3 |
| `GET /reports/sales-by-outlet` | `ReportsRepository.salesByOutlet` | `OutletSalesReportRequested` | tab 4 |
| `GET /reports/loss-analysis` | `ReportsRepository.lossAnalysis` | `LossAnalysisReportRequested` | tab 5 |

### Phase 6 — Stakeholders/Accounts (lighter treatment — full map deferred to Phase 6's own pass)

Owns `StakeholdersRepository`/`AccountsRepository` feeding a `StakeholdersBloc`;
consumed by the register-project screen (stakeholder picker), the activity
form (`personsMet` picker — though note `GET /projects/{id}` already returns
`stakeholders[].primaryContact`, so the *common* case needs no Accounts call
at all, only the *directory search* case for adding a stakeholder not yet on
the project does), and the outcome forms (distributor/competitor account
picker).

---

## 3. Shared models — reuse analysis

| Model | Defined in phase | Reused by |
| --- | --- | --- |
| `PaginationMeta` (`total,page,limit,totalPages`) | 1 | Every paginated list response in every phase (`GET /projects`, `/activities`, `/outcomes`) |
| `ActorView` (`id,firstName,lastName,email`) | 1 | Every `…ByUser` field across Projects/Activities/Outcomes/History |
| `TerritoryRefView` | 1 | `ProjectView.territory`, report filters (`territoryId`) |
| `StoredFileView` (the one file shape) | 1 | `ProjectImageView` (extends it), `ActivityAttachmentView` (Phase 2, extends it), `GET /projects/nearby` images, `POST /files` result |
| `LocationDto` (`lat,lng`) | 1 | `POST /projects`, `PUT /projects/{id}/location` |
| `ActivityLocationDto` (`lat,lng,accuracyM`) | 2 | Extends `LocationDto` with `accuracyM` — modeled as its own small class rather than forcing `LocationDto` to carry an unused field everywhere else |
| `ProjectFileRefDto` (extends the upload key+name, adds caption+EXIF) | 1 | `POST /projects`, `POST /projects/{id}/images` |
| `UploadedFileDto` (key+name only) | 2 | Activity `files[]` — **not** the same type as `ProjectFileRefDto` (no caption/EXIF), modeled separately per the doc's own distinction |
| `CounterpartyView` (`accountId,name,city,isAuthorized`) | 3 | `OutcomeView.distributor` / `.competitor` |
| Enums (`ProjectStage`, `ProjectStatus`, `BuildingType`, `ConstructionPhase`) | 1 | Filters in `GET /projects`, reports (`byStage`), history entries |
| Enums (`ActivityKind/Channel/Purpose/Outcome`, `AttentionReason`) | 2 | Activity log/edit/list, needs-attention |
| Enums (`OutcomeType/Status`, `LossReason`, `ProductCategory`) | 3 | Outcomes, `sales-by-outlet`/`loss-analysis` reports |
| `StakeholderRole` enum | defined in 1 (it appears on `ProjectStakeholderRefDto`, which Phase 1 doesn't send) — **actually deferred to Phase 6** to avoid an unused enum sitting dead in Phase 1 | Phase 6 |

No model is duplicated across phases — later phases either reuse a Phase-1
model as-is or extend it (`extends`/composition), matching the doc's own
"`ProjectImageView extends StoredFileView`" style.

---

## 4. Shared validators — reuse analysis

| Rule | Appears on | Implementation |
| --- | --- | --- |
| `10–500 chars, trimmed, forbidden < > ; " '` | `stage.note`, `status.reason`, `location.reason`, `outcome.reject.reason` (this doc) **and** `reason` in `stakeholders.md` | **New**: `AppValidators.validateReason` (one implementation, both modules) |
| `notes`, `20–4000 chars, trimmed` | Activity `notes` (create + edit) | `AppValidators.validateActivityNotes` (Phase 2) — distinct floor (20/4000) from the reason rule (10/500), so a separate method, not a parameterized reuse that obscures two different domain rules |
| Coordinate range (`lat -90…90`, `lng -180…180`) | `LocationDto`, `ActivityLocationDto` | **New**: `AppValidators.validateLatitude` / `validateLongitude` — reused by both location DTOs and by any future map-picker widget |
| UUID v4 | `personsMet[]`, `competitorAccountId`, `distributorAccountId`, path params | Reuse Dart's own `Uuid.isValidUUID` from the already-present `uuid` package (pubspec) rather than hand-rolling a regex |
| Money (`amount ≥ 0, max 2dp`) + `currency required when amount present` | `estimatedValue`/`currency` (Projects), `value`/`currency` (Won), `competitorPrice`/`currency` (Lost) | **New**: `AppValidators.validateMoney(amount, currency)` — one paired-field rule reused three times |
| Name `3–200`, Description `10–2000` | Project register/patch | Project-specific — not shared elsewhere, kept local to `ProjectRequestValidation` extensions, following the auth module's per-model `.validate()` extension pattern |
| Enum validity | Every enum field | Dart's enum type system + `json_serializable`'s `unknownEnumValue` fallback is the validation — no separate runtime check needed, consistent with how `verificationType` was handled in the auth module |

`AppValidators` already lives at `lib/core/helpers/validators.dart` (auth's
`emailRegex`/`passwordSpecialCharRegex`/etc. constants) — the new methods are
added there, not a parallel validators file, per "keep validators" in the
user's instructions.

---

## 5. Feature dependency graph

```
Files (Phase 1)
   │  every photo/attachment in every later phase is a `key` from here
   ▼
Projects (Phase 1)
   │  every Activity/Outcome hangs off a projectId
   ▼
Activities (Phase 2) ───────────────┐
   │  an Outcome is submitted        │  OfflineSync replays queued
   │  against a project's current    │  Activities through the same
   │  stage; needs-attention reads   │  repository contract
   │  activity recency                │
   ▼                                  │
Outcomes (Phase 3)                    │
   │  Reports aggregate only          │
   │  CONFIRMED outcomes +            │
   │  project stage/status history    │
   ▼                                  ▼
Reports (Phase 5) ◄───────── OfflineSync (Phase 4)
   (read-only, manager+,
    depends on 1+2+3's data
    existing, not on 4 or 6)

Stakeholders/Accounts (Phase 6)
   feeds INTO Projects (registration picker),
   Activities (personsMet picker for a NEW contact
   not yet on the project), Outcomes (distributor/
   competitor picker) — but 1–5 all function correctly
   without it (every field it would supply is optional
   or accepts a raw UUID), so it is safe to build last.
```

Reports (Phase 5) is drawn after Offline Sync (Phase 4) in the numbered
roadmap for pacing reasons (reports are manager-facing, lower urgency than
giving a rep a working offline capture loop), but has **no data dependency**
on Phase 4 — only on 1–3. If priorities change, 4 and 5 can swap without any
rework.

---

## 6. Workflow → Bloc-event mapping

| Workflow (doc §10) | Phase | Bloc event sequence |
| --- | --- | --- |
| 1 — Upload a file | 1 | `FileUploadRequested` → (per file, looped by the UI, never batched) |
| 2 — Register a building | 1 | `FileUploadRequested`×N → `ProjectRegisterSubmitted` → UI branches on `nearbyProjects`/`stakeholderLinkFailures`/`outsideTerritory` in the emitted state, no extra event needed (all three facts ride the success state) |
| 3 — The rep's daily loop | 2 | `AttentionListRequested` → `ProjectDetailRequested` → `ActivityLogSubmitted` → (if `suggestion==="SET_DORMANT"`) `ProjectStatusChangeSubmitted` |
| 4 — Log a visit vs. communication | 2 | Single `ActivityLogSubmitted` event, `kind` field toggles client-side validation branch — matches the doc's own "one form, four things differ" framing |
| 5 — Offline capture and sync | 4 | `OfflineActivityQueued` (repeatable while offline) → `OfflineSyncTriggered` → `OfflineDeltaPullRequested` |
| 6 — Correct an activity | 2 | `ActivityDetailRequested` → `ActivityEditSubmitted` |
| 7 — Move a project through the funnel | 1 | `ProjectStageChangeSubmitted` |
| 8 — Close a deal | 3 | `OutcomeWonSubmitted` / `OutcomeLostSubmitted` → (manager) `OutcomeConfirmSubmitted` / `OutcomeRejectSubmitted` |
| 9 — Handling a version conflict | 1 (pattern reused everywhere) | Any mutating event's failure state carries `PROJECT_VERSION_CONFLICT` → UI dispatches `ProjectDetailRequested` (re-read) → user re-applies → same mutating event again with the new `version` |
| 10 — Reopen a closed project | 1 | `ProjectStageChangeSubmitted` with `note` required client-side when current stage ∈ {WON,LOST}; same event for reviving `CANCELLED` via `ProjectStatusChangeSubmitted` |
| 11 — Reading an expired file URL | 1 | `FileResolveRequested` |
| 12 — Managing project photos | 1 | `ProjectImagesAddSubmitted` / `ProjectImageRemoveSubmitted` |
| 13 — Manager review of late edits | 2 | `ActivitiesListRequested(editedAfterWindowOnly: true)` → `ActivityDetailRequested` |
| 14 — Reading the reports | 5 | One `*ReportRequested` event per report |
| 15 — Territory-gap worklist | out of scope (back-office `SALES_ADMIN`, not a Sales-Rep screen per the confirmed scope) | — |

---

## 7. Error code → Bloc state mapping

Every `ApiErrorModel.code` the Projects/Files domain can return, mapped to
the state it drives. Codes not listed (plain `403` with no code, generic
`VALIDATION_ERROR`) fall through to a generic `ProjectsState.error` /
`FileUploadState.error` carrying the server message.

| Code | Bloc | State |
| --- | --- | --- |
| `PROJECT_VERSION_CONFLICT` | Projects | `MutationFailure.versionConflict` — UI re-reads and offers re-apply, never auto-retries the same body |
| `PROJECT_OUTSIDE_OWN_TERRITORY` | Projects | `MutationFailure.territoryRejected` — hard refusal, shown as-is, not retried |
| `PROJECT_NOT_ACCESSIBLE` | Projects | `MutationFailure.permissionDenied` — surfaced only if a write control wasn't already hidden (defense in depth; the primary control is role-based hiding per §2.6) |
| `PROJECT_NOT_FOUND` | Projects | `DetailFailure.notFound` — rendered identically whether "gone" or "not yours", per the doc's 404-not-403 rule |
| `PROJECT_IMAGE_NOT_UPLOADED` | Projects (register/add-images) | `MutationFailure.imagesNotUploaded(keys)` — UI re-uploads exactly the named keys and resubmits the same form, not a generic retry |
| `PROJECT_IMAGE_REQUIRED` | Projects | `MutationFailure.lastImageRequired` — delete control already disabled at `imageCount===1`; this is the defense-in-depth path |
| `PROJECT_TOO_MANY_IMAGES` | Projects | `MutationFailure.tooManyImages` |
| `PROJECT_REOPEN_REQUIRES_MANAGER` | Projects | `MutationFailure.permissionDenied` (reopen control already hidden below `SALES_MANAGER`) |
| `PROJECT_LOCATION_REQUIRES_MANAGER` | Projects | same — control hidden entirely, both below and at/above manager per §2.6 |
| `PROJECT_STAGE_REQUIRES_OUTCOME` | Projects | `MutationFailure.validation` (WON/LOST never offered in the stage dropdown, so this is defense-in-depth only) |
| `PROJECT_CANCELLED` | Projects | `MutationFailure.projectCancelled` — reopen-first prompt |
| `VALIDATION_ERROR` (+ every `PROJECT_INVALID_*`) | Projects/Files | `MutationFailure.validation(message)` — client-side validation is expected to catch these first; server message is the fallback |
| *(413, oversized file)* | Files | `FileUploadState.tooLarge` |

Activities/Outcomes/Reports error-code tables land with their own phases
(§7 of each phase's own mapping pass), not duplicated here ahead of time —
per §9's "don't create states during implementation unless documented",
the reverse also holds: don't pre-define Phase-2/3 states before Phase 2/3's
own docs section is the thing being implemented.

---

## 8. State machines

### 8.1 `FileUploadBloc` (Phase 1)

**Events:** `FileUploadRequested(File, purpose)`, `FileUploadCancelled(localId)`,
`FileResolveRequested(key)`.

**States** (one `FileUploadState` per in-flight file, keyed by a local id so
the register-project screen can show N independent progress rows):

```
Idle → Uploading(progress 0..1) → Uploaded(StoredFileView)
                                 ↘ Failed(reason: tooLarge | network | rejected)
Idle → Resolving(key) → Resolved(StoredFileView) / ResolveFailed
```

No `VersionConflict`/`TerritoryRejected` states — not applicable to this
Bloc. `Cancelled` is a valid terminal state (user removes a photo from the
picker mid-upload) reachable from `Uploading`.

### 8.2 `ProjectsBloc` (Phase 1)

**Events:**
`ProjectsListRequested`, `ProjectsListRefreshed`, `ProjectsNextPageRequested`,
`ProjectsFilterChanged(stage?, status?, constructionPhase?, buildingType?, territoryId?)`,
`ProjectsSearchChanged(query)`, `ProjectsNearbyRequested(near)`,
`ProjectRegisterSubmitted(RegisterProjectRequest)`,
`ProjectDetailRequested(id)`, `ProjectDetailRefreshed(id)`,
`ProjectPatchSubmitted(id, patch, expectedVersion)`,
`ProjectStageChangeSubmitted(id, stage, note?, expectedVersion)`,
`ProjectStatusChangeSubmitted(id, status, reason, expectedVersion)`,
`ProjectLocationChangeSubmitted(id, location, reason, addressLine?)`,
`ProjectHistoryRequested(id)`, `ProjectHistoryNextPageRequested(id)`,
`ProjectImagesAddSubmitted(id, files)`,
`ProjectImageRemoveSubmitted(id, imageId)`, `ProjectRetryRequested` (generic
"try that again" for a `NetworkError` state).

**States** — one freezed `ProjectsState` grouping three independent
sub-machines (list, detail, mutation), since a rep can have the list loaded
*and* a detail screen open *and* a mutation in flight simultaneously, and
collapsing that into one flat enum would force illegal combinations:

```
list:      Initial → Loading → Loaded(items, pagination) → PaginationLoading → Loaded(more items)
                             ↘ Empty (Loaded with 0 items — distinct from Initial, per required states list)
                             ↘ NetworkError(retry: ProjectRetryRequested)
           Loaded → Refreshing → Loaded (pull-to-refresh keeps old data visible)

detail:    Idle → Loading → Loaded(ProjectDetailView)
                           ↘ NotFound
                           ↘ NetworkError

mutation:  Idle → InProgress → Success(updated ProjectView)
                              ↘ ValidationError(message)
                              ↘ VersionConflict(latestVersion?) — UI re-reads via ProjectDetailRefreshed
                              ↘ TerritoryRejected(message)
                              ↘ PermissionDenied
                              ↘ ImagesNotUploaded(keys)
                              ↘ NetworkError
           (registration only) Success also carries `nearbyProjects` +
           `stakeholderLinkFailures?` + `outsideTerritory` for the UI to
           branch on — modeled as a `DuplicateCandidatesFound`-flavoured
           payload on the same Success state, not a separate state, because
           it is not an error path — Workflow 2 is explicit that "the
           project is already created."
```

### 8.3 `ActivitiesBloc` (Phase 2 — recorded now for consistency, implemented then)

**Events:** `AttentionListRequested`, `ActivityLogSubmitted`,
`ActivitiesListRequested(projectId?, filters)`, `ActivitiesNextPageRequested`,
`ActivityDetailRequested(id)`, `ActivityEditSubmitted(id, patch)`,
`ActivityRetryRequested`.

**States:** `attention: Idle→Loading→Loaded/Empty/NetworkError`;
`list: Initial→Loading→Loaded→PaginationLoading→Loaded/Empty/NetworkError`;
`detail: Idle→Loading→Loaded(ActivityDetailView)→NotFound/NetworkError`;
`mutation: Idle→InProgress→Success→ValidationError/PermissionDenied
(ACTIVITY_NOT_AUTHOR, ACTIVITY_BACKDATING_NEEDS_MANAGER)/NetworkError`. The
log-submission success state carries the `suggestion` field (`"SET_DORMANT"`
or null) for the UI to act on, same non-error-payload pattern as Projects'
registration `nearbyProjects`.

### 8.4 `OutcomesBloc` (Phase 3 — recorded now)

**Events:** `OutcomeWonSubmitted`, `OutcomeLostSubmitted`,
`OutcomesListRequested(status?, type?, projectId?)`,
`OutcomeDetailRequested(id)`, `OutcomeConfirmSubmitted(id)`,
`OutcomeRejectSubmitted(id, reason)`.

**States:** `list`/`detail` follow the same `Initial/Loading/Loaded/Empty/
NetworkError` shape as the other blocs; `mutation` adds outcome-specific
failures: `SelfConfirmation`, `ConfirmationRequiresManager`,
`AlreadySettled`, `AlreadyOpen`, `DistributorNotFound`, `LossRequiresWinner`,
`LossPriceRequired`, `UnitsExceedTotal`.

### 8.5 `OfflineSyncBloc` (Phase 4 — recorded now)

**Events:** `OfflineActivityQueued(LogActivityDraft)`,
`OfflineQueueItemDiscarded(clientRef)` (rep cancels a bad draft before
syncing), `OfflineSyncTriggered`, `OfflineDeltaPullRequested`,
`OfflineConnectivityRestored` (drives an automatic `OfflineSyncTriggered`).

**States:**
```
Idle(queueLength) → Syncing(queueLength) → Synced(created, duplicates, rejected)
                                          ↘ SyncFailed(networkError) — queue untouched, safe to retry whole batch
Synced → DeltaPulling → DeltaApplied(updatedProjectCount)
```
Per-item `REJECTED` results do **not** produce a Bloc-level failure state —
they stay `Idle` with the queue length reduced by however many were
`CREATED`/`DUPLICATE`, and the rejected items remain queued with their
`error.code` attached for the rep to fix, exactly per Workflow 5's "keep
local record, show error.code, let the rep fix and resend."

### 8.6 `ReportsBloc` (Phase 5 — recorded now)

**Events:** one `*ReportRequested(ReportFilters)` event per report (five),
`ReportFiltersChanged`.

**States:** `Idle → Loading → Loaded(reportView) → Empty (zero rows — still
a valid, renderable state per the doc's "keep zero-activity rows" and
"UNKNOWN competitor is a real row" rules — Empty here means literally no
rows at all, not "rows exist but are zero") → NetworkError`. No mutation
sub-machine — every report route is read-only.

### 8.7 `StakeholdersBloc` (Phase 6 — named for the dependency graph only, full design deferred)

---

## 9. Testing strategy per phase

| Layer | What's verified | How |
| --- | --- | --- |
| Repository | Every request body matches the doc's table field-for-field; every response model parses the doc's example JSON verbatim | Unit test per repository method using the doc's own JSON examples as fixtures |
| Bloc | Event → state sequence for the happy path and every documented error code from §7 | `bloc_test` package (added as a dev dependency in Phase 1) — `blocTest` per event |
| Workflow | The multi-step flows in §6 happen end-to-end | Widget/integration test per workflow where feasible; manual walk-through otherwise (noted per phase) |
| API contract | Field names/types/nullability against the doc, re-checked directly from the table, not from memory | Manual cross-check during code review of each new model file |
| Error handling | Every code in §7's table produces the mapped state, not a generic fallback | `blocTest` failure-path cases |
| Version conflict | A conflicting write is re-read and reapplied, never blindly retried | Dedicated `blocTest` for `ProjectStageChangeSubmitted` → `409` → `VersionConflict` → `ProjectDetailRefreshed` |
| Offline (Phase 4) | Queue survives app restart; replaying a batch after a dropped response produces `DUPLICATE`, not a duplicate write; rejected items stay queued | Local-storage-backed Bloc test with a faked repository that simulates a dropped-then-replayed response |

---

## 10. Documented ambiguities & decisions

1. **`PATCH /projects/{id}`'s omitted-vs-null semantics.** Freezed's
   generated `copyWith`/constructors don't natively distinguish "field not
   sent" from "field sent as null" the way the JSON wire format needs to.
   Decision, as actually built: a single `omit` sentinel constant
   (`lib/features/projects/data/models/omit.dart`), used as the default
   value of `Object?`-typed fields — simpler than the value-provider
   function pattern originally sketched here, same effect. `addressLine`,
   `unitCount`, `estimatedValue`, `currency`, `notes` on
   `PatchProjectRequest`, and `addressLine` on `ChangeLocationRequest` (same
   "Nullable … null clears it" wording in the doc) use it. Both requests are
   plain classes with a hand-written `toJson()` rather than `@freezed`,
   since the generated `toJson` can't express "omit this key."
2. **`GET /projects/needs-attention` is documented as currently
   server-broken** (§12 — shadowed by `ProjectController`'s `:id` route).
   Decision: implement the client contract in Phase 2 exactly as documented
   (so no rework is needed once the backend fixes controller ordering), but
   flag it in the Phase-2 summary as non-functional against the current
   backend, with the Home tab falling back to its existing placeholder
   content until it works.
3. **Offline queue persistence** — no local DB exists in this project today.
   Decision (Phase 4, not needed until then): Hive. Bounded queue (≤100
   items/batch, and realistically a rep's whole offline day), no relational
   querying needed, avoids pulling in a full SQL engine (`sqflite`/`drift`)
   for what's structurally a list of DTOs.
4. **Stage/status badge colors** are a UI color-coding choice, not a
   business rule from either doc — noted here so it's traceable as an
   interpretation, not silently invented. As actually built
   (`project_badges.dart`): WON→`statusWon`, LOST→`statusLost`, every open
   funnel stage (LEAD..COMMITTED)→`statusVisit` ("in motion, not yet
   decided" — the doc's status palette has no per-stage hue, only a
   won/lost/in-progress distinction makes sense for a stage); ACTIVE→
   `statusNew`, DORMANT→`statusFollowUp`, CANCELLED→`statusClosed`.
5. **`GET /projects/nearby` vs. registration's inline `nearbyProjects`** use
   the *same* `NearbyProjectCardView` shape. Decision: one model, one
   repository parse path, reused by both — not two near-duplicate types.
6. **`ProjectDetailView.activities`/`.stakeholders[].role` forced three
   Phase-2/6 enums and one read-only model into Phase 1.** `GET
   /projects/{id}` (Phase 1) returns `activities: ActivityView[]` and
   `stakeholders[].role: StakeholderRole` as real, non-optional response
   fields (§9) — parsing the Phase-1 response correctly requires
   `ActivityKind`/`ActivityChannel`/`ActivityPurpose`/`ActivityOutcome` and
   `StakeholderRole`, originally catalogued as Phase 2/6-only in §3. Built
   early, in `enums.dart`, with a comment explaining why; only the read-only
   `ActivityView` model and enum values were added — the log/edit forms,
   `ActivitiesBloc`, and stakeholder-editing UI are still Phase 2/6 as
   planned. The detail screen renders `activities`/`stakeholders` read-only.
7. **File-upload progress needed a real Dio call, not a Retrofit method.**
   Retrofit's annotation API (`retrofit: 4.9.0`) has no way to expose Dio's
   `onSendProgress` callback per request, and `FileUploadBloc`'s documented
   state machine (§8.1) needs a real `Uploading(progress 0..1)`, not a
   faked one. `POST /files` was pulled out of `ApiService` — `FileRepository`
   calls `DioFactory.getAppDio()` directly for that one request, reusing the
   same interceptor-wired instance `ApiService` uses everywhere else.
8. **Role-gated controls not wired in Phase 1 UI, hidden rather than shown
   disabled.** The register/detail screens don't have the caller's role
   available yet (no `GET /auth/me` role plumbed into this module this
   phase), so three controls the doc gates above `REPRESENTATIVE` are simply
   absent from Phase 1's UI rather than shown-and-failing: reopening a
   WON/LOST project (stage picker only offers `openProjectStages`), reviving
   a `CANCELLED` project (status control shows an informational note
   instead), and `PUT /projects/{id}/location` (no location-edit affordance
   at all). All three remain fully implemented in `ProjectsBloc`/
   `ProjectsRepository`/`ApiService` — only the entry points are missing,
   consistent with §2.6 "hide, don't rely on the error." Wiring the real
   role in is a small follow-up once a later phase threads it through.
9. **Activity edit button always shown (Phase 2), unlike Phase 1's
   location-edit.** `PATCH /projects/{id}/activities/{activityId}` is
   gated to the activity's author within a 24h window, or a
   `SALES_MANAGER`+ after — a rule that genuinely depends on "am I the
   author," which the client cannot evaluate (`§1.7` strips `createdBy` for
   a `REPRESENTATIVE`). Unlike the location-edit control (safe to hide
   outright, since `SALES_MANAGER`+ can never be the only role this app
   serves), hiding here isn't safe: a rep legitimately edits their own
   recent activity constantly. Decision: always show Edit, let
   `ACTIVITY_EDIT_WINDOW_EXPIRED`/`ACTIVITY_NOT_OWNER`-class server errors
   surface as a normal mutation-error snackbar.
10. **`GET /projects/needs-attention` built as documented despite the
    server bug (§10.2) — still true as of Phase 2/3, not yet independently
    re-verified.** No change from the original decision; noting here only
    that Phase 3 did not re-check backend status.
11. **Won-outcome UI deferred to Phase 6 (explicit user decision, not an
    inference).** `POST /projects/{id}/won` requires a
    `distributorAccountId`, and no account/outlet directory exists before
    Phase 6. Presented to the user as a choice via `AskUserQuestion`; the
    user chose "Lost-only UI now" — full `SubmitWonRequest` model,
    `OutcomesRepository.submitWon`, and the `OutcomesBloc` event/state
    plumbing for WON are built and ready, but no screen calls them yet.
    `SubmitOutcomeScreen` only ever builds `SubmitLostRequest`. When Phase 6
    lands a distributor picker, the missing piece is purely a new screen —
    no repository/Bloc rework.
12. **Outcome Confirm never rendered in Phase 3 UI; Reject always is,
    labeled "Withdraw."** Same class of problem as decision 9: confirming
    an outcome requires `SALES_MANAGER`+ *and* "not the submitter"
    (four-eyes rule, Workflow 8) — both unknowable client-side for a
    `REPRESENTATIVE`-only app with no role plumbing. Unlike Edit, hiding
    Confirm outright *is* safe here, because a plain rep can never
    legitimately be shown a Confirm button (it always requires a higher
    role than the only one this client build ever needs to serve) —
    `OutcomesRepository.confirm()` exists, unused, documented as
    ready-for-later. Reject/withdraw is different: a rep can always
    withdraw their own `PENDING` submission, so it's always shown, labeled
    "Withdraw" in the UI to match what a rep is actually doing with it
    (their own submission, not someone else's).
13. **No competitor/distributor picker anywhere in Phase 2/3 UI — always the
    "honest unknown" branch.** `ActivityOutcome.COMPETITOR_ON_SITE`
    (Workflow 4) documents offering a competitor picker with an explicit "I
    couldn't tell" fallback, and `SubmitLostRequest.competitorAccountId` is
    similarly pickable. Both need an account/competitor directory search,
    which is Phase 6 territory (`stakeholders.md`) — identical constraint to
    decision 11's distributor picker, just not surfaced to the user as a
    separate question since it's the same missing infrastructure already
    confirmed deferred. `log_activity_screen.dart` never collects
    `competitorAccountId` (always omitted — a valid, documented "unknown");
    `submit_outcome_screen.dart` likewise never collects it for a LOST
    submission. Both models already accept the field; only the picker UI is
    missing, arriving with Phase 6.
14. **Phase 2/3 review pass (found during the user-requested audit, not
    invented business logic):** `ActivityLocationDto.validate()` incorrectly
    reused `AppValidators.validateCoordinates` (which rejects `(0,0)`) — that
    rule is `PROJECT_INVALID_LOCATION`, specific to a project's own location
    and never documented for activity GPS fixes; narrowed to a plain
    range check. `SyncActivityItem.validate()` was missing two rules the doc
    says apply ("every rule from `POST /projects/{projectId}/activities`...
    plus `projectId`/`clientRef`"): a `projectId` UUID check and the
    5-minute-future clock-skew check on `occurredAt` — both added.
    `outcome_detail_screen.dart` was missing the documented "on rejection,
    offer submit again" affordance (Workflow 8) — added for `LOST` only
    (Won has no resubmission screen yet, decision 11). `activity_detail_screen.dart`'s
    edit dialog was missing the documented "≥24h since capturedAt → warn
    'your manager will see this change'" notice (Workflow 6) and `nextActionAt`
    editability (self-contained — a date picker with a clear action, unlike
    `personsMet`/`competitorAccountId` which need data not currently plumbed
    into this screen, per decision 13's reasoning). `outcomes_list_screen.dart`
    had no pagination trigger at all — `OutcomesNextPageRequested` was wired
    into the Bloc/state but no scroll listener ever dispatched it, making
    page 2+ of a rep's/manager's outcomes permanently unreachable; fixed to
    match `projects_list_screen.dart`'s established scroll-threshold pattern.
    `FileUploadPurpose` (an enum with one value, `projectPhoto`, accepted by
    every upload call including activity attachments) was dead: never stored
    in `FileUploadItem` state, never branched on — removed along with the
    `purpose` parameter, since segregation is already by `localId`.
15. **Phase 4 scope: activity offline capture + sync only, not a general
    offline-queue-of-everything.** The doc's Workflow 5 is endpoint-backed
    for exactly one thing — `POST /activities/sync` — so that's what
    `OfflineSyncBloc` implements: a local Hive-backed queue of
    `SyncActivityItem`s, replayed in ≤100-item chunks, `CREATED`/`DUPLICATE`
    → removed, `REJECTED` → kept with its error so the rep doesn't lose what
    they typed. Deliberately **not** built: an offline queue for project
    edits (`PATCH`/stage/status) — there's no batch/sync endpoint for those,
    only the online-only version-conflict flow (Workflow 9, already handled
    in Phase 1); Workflow 5's "queued writes should carry `expectedVersion`"
    aside is about that class of write, not activities (which have no
    `version` field at all), so it doesn't apply here.
16. **`GET /projects?updatedSince=` (mentioned in Workflow 5 as the delta
    pull once back online) is not wired into `ProjectsBloc`.** The
    `updatedSince` query is built for reconciling a *persistent local
    project cache* against the server — this app has no such cache
    (`ProjectsBloc.projects` is an in-memory list replaced wholesale by
    whatever the last `GET /projects` call returned). Feeding an
    `updatedSince`-scoped response (deltas only) into that same
    replace-the-whole-list code path would silently drop every unchanged
    project from view — worse than not using it. `ProjectsRepository.list()`
    already accepts `updatedSince` (built in Phase 1) for whenever a real
    local project cache exists to reconcile; until then, `OfflineSyncBloc`
    triggers nothing on `ProjectsBloc` — a rep who wants a fresh list
    pulls-to-refresh it themselves, same as any other screen visit.
17. **Auto-sync trigger uses `connectivity_plus`, not a home-grown
    heuristic.** `main.dart` wires `Connectivity().onConnectivityChanged`
    (plus one `checkConnectivity()` at startup) to
    `OfflineSyncBloc.add(syncRequested())` — genuine reconnect detection
    rather than guessing from app-lifecycle resume events or waiting for
    the rep to open the queue screen manually. `syncRequested` is a safe
    no-op when the queue is empty or already syncing, so spurious
    connectivity events cost nothing.
18. **Connectivity-class failures get their own `ActivityMutationStatus.offline`**,
    distinct from the generic `networkError` catch-all — only `NO_INTERNET`/
    `CONNECTION_TIMEOUT`/`SEND_TIMEOUT` (mirroring `FileUploadBloc`'s
    existing classification) trigger the auto-queue fallback in
    `log_activity_screen.dart`. A genuine server-side rejection (validation,
    `PROJECT_CANCELLED`, an unexpected 500) is shown as an error instead of
    silently queued — queuing something the server would reject again on
    replay serves nobody (§10 Workflow 5: "retrying unchanged will not help").
19. **Phase 6 scope: everything in `stakeholders.md` a `REPRESENTATIVE` can
    actually reach, nothing else.** Built: `POST`/`GET /accounts` (create +
    search, no browse — `search` always sent), all five `/accounts/{id}/
    contacts*` routes (own-scoped server-side), all nine
    `/projects/{projectId}/stakeholders*` + `/decision-maker*` routes.
    Deliberately **not wired at all**, not even as unused-but-ready
    repository methods (unlike `OutcomesRepository.confirm()` in Phase 3):
    `GET/PATCH/DELETE /accounts/{id}`, `POST .../verify`,
    `GET .../accounts/{id}/projects`, and all of `/account-merges` and
    `/accounts/duplicates`/`/quality-signals` — every one of these is
    `SALES_MANAGER`+/`SALES_ADMIN`+ at the *route* gate, so unlike the
    Confirm-outcome case (gated by role *and* a fact this client could learn
    later), a rep-only client has no plausible path to ever call them. Two
    Blocs, not one, splitting by UI usage rather than by resource:
    `AccountsBloc` (search/create/contacts — backs the pickers, used from
    multiple flows) and `StakeholdersBloc` (a single project's links +
    decision-maker — backs `project_detail_screen.dart`'s section). Both sit
    on one shared `StakeholdersRepository`.
20. **`StakeholderRole` has two different definitions across the two source
    docs — kept both, scoped to where each applies.**
    `projects-client-reference.md` §3 lists 9 values (includes
    `SITE_ELECTRICIAN`/`ELECTRICAL_ENGINEER`/`SITE_SUPERVISOR`); this was
    already built into the `StakeholderRole` enum in Phase 1, sourced from
    that doc, for parsing `GET /projects/{id}`'s embedded
    `stakeholders[].role`. `stakeholders.md`'s own §S2 — the module that
    actually owns this concept — lists only **6**, and states the write-side
    behavior explicitly: "an unrecognised value becomes `OTHER` rather than
    an error." Decision: keep the 9-value enum unchanged (still needed to
    read data written before this rule, or by a caller outside this app),
    but added a `stakeholderLinkableRoles` const (the 6-value list) and used
    it — not the full enum — for the `AddStakeholderLinkScreen`/
    `ReplaceStakeholderLinkScreen` pickers. Offering the extra 3 there would
    let a rep pick "Site Electrician" and silently get "Other" back, which
    is worse than not offering it.
21. **The Won-outcome distributor picker and the Lost/Activities competitor
    pickers remain unbuilt — not a Phase 6 gap, a documentation gap.**
    `projects-client-reference.md`'s Outcomes section requires
    `distributorAccountId`/`competitorAccountId` to name an account
    "carrying an active `DISTRIBUTOR`/`COMPETITOR` classification," and
    mentions `POST /accounts/{id}/classifications` in passing as how one
    gets proposed — but `stakeholders.md` (the account/contact module's own
    reference) has **no classifications concept anywhere**: no endpoint
    shape, no request/response, no way to search or filter accounts by
    classification. This isn't a "hasn't been built yet" situation like
    decision 11 originally was — Phase 6 is now fully built and the
    classification system still has no specification in either source
    document to build against. Building a guessed endpoint shape here would
    risk shipping something that silently doesn't match the real API.
    `AccountPickerScreen` (built this phase) is classification-agnostic and
    structurally ready to become that picker the moment
    `/accounts/{id}/classifications` is documented — likely just a query
    param addition to `GET /accounts`, no rework — but that endpoint itself
    is out of scope until it's specified.
22. **`GET /accounts/{id}/projects`, `GET/PATCH/DELETE /accounts/{id}`,
    `POST .../verify`, and all of `/account-merges` are absent from
    `StakeholdersRepository`.** This is a deliberate exception to the
    project's general practice of building repository methods even for
    role-gated actions this client can't show yet (e.g. `OutcomesRepository.
    confirm()`). Those methods stay because a future phase could plausibly
    thread a manager's role through the *same* app. These stay unbuilt
    because they're gated at the **route**, not the record — no role this
    rep-only client will ever serve can call them, so a ready-but-unused
    method would be dead code with no realistic path to use, not
    forward-looking infrastructure.
