import 'package:json_annotation/json_annotation.dart';

/// Funnel order is exactly this order (projects-client-reference.md §3).
/// `WON`/`LOST` are terminal and only ever arrive from a confirmed outcome —
/// never offered directly in the stage-change UI.
enum ProjectStage {
  @JsonValue('LEAD')
  lead,
  @JsonValue('QUALIFIED')
  qualified,
  @JsonValue('ENGAGEMENT')
  engagement,
  @JsonValue('APPROVAL')
  approval,
  @JsonValue('BOQ_RECEIVED')
  boqReceived,
  @JsonValue('QUOTE_ISSUED')
  quoteIssued,
  @JsonValue('COMMITTED')
  committed,
  @JsonValue('WON')
  won,
  @JsonValue('LOST')
  lost,
}

/// Wire string for a hand-built query param or request body (`ProjectsRepository.list`'s
/// `stage`/`status`/`constructionPhase`/`buildingType` filters, `ChangeStageRequest`-style
/// bodies serialized outside json_serializable) — see `BuildingTypeWire` above for why this
/// can't just reuse the generated `_$…EnumMap`.
extension ProjectStageWire on ProjectStage {
  String get wireValue => switch (this) {
    ProjectStage.lead => 'LEAD',
    ProjectStage.qualified => 'QUALIFIED',
    ProjectStage.engagement => 'ENGAGEMENT',
    ProjectStage.approval => 'APPROVAL',
    ProjectStage.boqReceived => 'BOQ_RECEIVED',
    ProjectStage.quoteIssued => 'QUOTE_ISSUED',
    ProjectStage.committed => 'COMMITTED',
    ProjectStage.won => 'WON',
    ProjectStage.lost => 'LOST',
  };
}

/// The seven open stages a rep may freely pick from a plain dropdown, no
/// gating, per Workflow 7. `WON`/`LOST` are excluded on purpose.
const openProjectStages = [
  ProjectStage.lead,
  ProjectStage.qualified,
  ProjectStage.engagement,
  ProjectStage.approval,
  ProjectStage.boqReceived,
  ProjectStage.quoteIssued,
  ProjectStage.committed,
];

/// Orthogonal to stage. `CANCELLED` means nobody won and is excluded from
/// win rate — it is not a loss (§3).
enum ProjectStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('DORMANT')
  dormant,
  @JsonValue('CANCELLED')
  cancelled,
}

extension ProjectStatusWire on ProjectStatus {
  String get wireValue => switch (this) {
    ProjectStatus.active => 'ACTIVE',
    ProjectStatus.dormant => 'DORMANT',
    ProjectStatus.cancelled => 'CANCELLED',
  };
}

enum BuildingType {
  @JsonValue('APARTMENT_BUILDING')
  apartmentBuilding,
  @JsonValue('VILLA')
  villa,
  @JsonValue('RESIDENTIAL_COMPLEX')
  residentialComplex,
  @JsonValue('COMMERCIAL')
  commercial,
  @JsonValue('MIXED_USE')
  mixedUse,
  @JsonValue('INDUSTRIAL')
  industrial,
  @JsonValue('HOSPITALITY')
  hospitality,
  @JsonValue('HEALTHCARE')
  healthcare,
  @JsonValue('EDUCATIONAL')
  educational,
  @JsonValue('GOVERNMENT')
  government,
  @JsonValue('RELIGIOUS')
  religious,
  @JsonValue('INFRASTRUCTURE')
  infrastructure,
  @JsonValue('OTHER')
  other,
}

/// The wire string for contexts that can't use json_serializable's generated
/// `_$BuildingTypeEnumMap` — that map is generated `part`-private per model
/// file, so a hand-built request body (`PatchProjectRequest`) or a raw query
/// param (`ProjectsRepository.list`'s filters) needs its own copy of the
/// `@JsonValue` strings above.
extension BuildingTypeWire on BuildingType {
  String get wireValue => switch (this) {
    BuildingType.apartmentBuilding => 'APARTMENT_BUILDING',
    BuildingType.villa => 'VILLA',
    BuildingType.residentialComplex => 'RESIDENTIAL_COMPLEX',
    BuildingType.commercial => 'COMMERCIAL',
    BuildingType.mixedUse => 'MIXED_USE',
    BuildingType.industrial => 'INDUSTRIAL',
    BuildingType.hospitality => 'HOSPITALITY',
    BuildingType.healthcare => 'HEALTHCARE',
    BuildingType.educational => 'EDUCATIONAL',
    BuildingType.government => 'GOVERNMENT',
    BuildingType.religious => 'RELIGIOUS',
    BuildingType.infrastructure => 'INFRASTRUCTURE',
    BuildingType.other => 'OTHER',
  };
}

/// Listed in construction order (§3). Set once at registration, then changed
/// only by `constructionPhaseObserved` on a `VISIT` activity (Phase 2).
enum ConstructionPhase {
  @JsonValue('PLANNING')
  planning,
  @JsonValue('EXCAVATION')
  excavation,
  @JsonValue('FOUNDATION')
  foundation,
  @JsonValue('STRUCTURE')
  structure,
  @JsonValue('BLOCKWORK')
  blockwork,
  @JsonValue('ELECTRICAL_ROUGH_IN')
  electricalRoughIn,
  @JsonValue('PLASTERING')
  plastering,
  @JsonValue('FINISHING')
  finishing,
  @JsonValue('ELECTRICAL_FIT_OUT')
  electricalFitOut,
  @JsonValue('HANDOVER')
  handover,
  @JsonValue('COMPLETED')
  completed,
}

extension ConstructionPhaseWire on ConstructionPhase {
  String get wireValue => switch (this) {
    ConstructionPhase.planning => 'PLANNING',
    ConstructionPhase.excavation => 'EXCAVATION',
    ConstructionPhase.foundation => 'FOUNDATION',
    ConstructionPhase.structure => 'STRUCTURE',
    ConstructionPhase.blockwork => 'BLOCKWORK',
    ConstructionPhase.electricalRoughIn => 'ELECTRICAL_ROUGH_IN',
    ConstructionPhase.plastering => 'PLASTERING',
    ConstructionPhase.finishing => 'FINISHING',
    ConstructionPhase.electricalFitOut => 'ELECTRICAL_FIT_OUT',
    ConstructionPhase.handover => 'HANDOVER',
    ConstructionPhase.completed => 'COMPLETED',
  };
}

/// Read-only — appears on `ProjectHistoryEntryView` entries of `kind: "STAGE"`.
enum StageChangeSource {
  @JsonValue('REP')
  rep,
  @JsonValue('MANAGER')
  manager,
  @JsonValue('OUTCOME_CONFIRMED')
  outcomeConfirmed,
  @JsonValue('OUTCOME_REJECTED')
  outcomeRejected,
}

// The four enums below are catalogued in the implementation map as Phase 2
// (full Activities feature: log/edit/list). They're defined here in Phase 1
// anyway because `GET /projects/{id}` → `ProjectDetailView.activities` is a
// real, non-optional field of the Phase-1 response (§9) — parsing it needs
// these now. Only the read-only `ActivityView` model is built in Phase 1;
// the log/edit forms, `ActivitiesBloc`, and `AttentionReason` still land in
// Phase 2 as planned. See projects-implementation-map.md §10.6.

enum ActivityKind {
  @JsonValue('VISIT')
  visit,
  @JsonValue('COMMUNICATION')
  communication,
}

extension ActivityKindWire on ActivityKind {
  String get wireValue => switch (this) {
    ActivityKind.visit => 'VISIT',
    ActivityKind.communication => 'COMMUNICATION',
  };
}

enum ActivityChannel {
  @JsonValue('PHONE_CALL')
  phoneCall,
  @JsonValue('WHATSAPP')
  whatsapp,
  @JsonValue('EMAIL')
  email,
  @JsonValue('SMS')
  sms,
  @JsonValue('OTHER')
  other,
}

extension ActivityChannelWire on ActivityChannel {
  String get wireValue => switch (this) {
    ActivityChannel.phoneCall => 'PHONE_CALL',
    ActivityChannel.whatsapp => 'WHATSAPP',
    ActivityChannel.email => 'EMAIL',
    ActivityChannel.sms => 'SMS',
    ActivityChannel.other => 'OTHER',
  };
}

enum ActivityPurpose {
  @JsonValue('DISCOVERY')
  discovery,
  @JsonValue('SAMPLES')
  samples,
  @JsonValue('CATALOG')
  catalog,
  @JsonValue('QUANTITIES')
  quantities,
  @JsonValue('PRICE_QUOTE')
  priceQuote,
  @JsonValue('NEGOTIATION')
  negotiation,
  @JsonValue('FOLLOW_UP')
  followUp,
  @JsonValue('GIFT')
  gift,
  @JsonValue('OTHER')
  other,
}

extension ActivityPurposeWire on ActivityPurpose {
  String get wireValue => switch (this) {
    ActivityPurpose.discovery => 'DISCOVERY',
    ActivityPurpose.samples => 'SAMPLES',
    ActivityPurpose.catalog => 'CATALOG',
    ActivityPurpose.quantities => 'QUANTITIES',
    ActivityPurpose.priceQuote => 'PRICE_QUOTE',
    ActivityPurpose.negotiation => 'NEGOTIATION',
    ActivityPurpose.followUp => 'FOLLOW_UP',
    ActivityPurpose.gift => 'GIFT',
    ActivityPurpose.other => 'OTHER',
  };
}

enum ActivityOutcome {
  @JsonValue('PROGRESSING')
  progressing,
  @JsonValue('NEEDS_ANOTHER_VISIT')
  needsAnotherVisit,
  @JsonValue('WAITING_ON_THEM')
  waitingOnThem,
  @JsonValue('AWAITING_QUANTITIES')
  awaitingQuantities,
  @JsonValue('COMPETITOR_ON_SITE')
  competitorOnSite,
  @JsonValue('DECISION_IMMINENT')
  decisionImminent,
  @JsonValue('NO_ONE_PRESENT')
  noOnePresent,
  @JsonValue('WORK_STOPPED')
  workStopped,
  @JsonValue('TOO_EARLY_REVISIT_LATER')
  tooEarlyRevisitLater,
}

extension ActivityOutcomeWire on ActivityOutcome {
  String get wireValue => switch (this) {
    ActivityOutcome.progressing => 'PROGRESSING',
    ActivityOutcome.needsAnotherVisit => 'NEEDS_ANOTHER_VISIT',
    ActivityOutcome.waitingOnThem => 'WAITING_ON_THEM',
    ActivityOutcome.awaitingQuantities => 'AWAITING_QUANTITIES',
    ActivityOutcome.competitorOnSite => 'COMPETITOR_ON_SITE',
    ActivityOutcome.decisionImminent => 'DECISION_IMMINENT',
    ActivityOutcome.noOnePresent => 'NO_ONE_PRESENT',
    ActivityOutcome.workStopped => 'WORK_STOPPED',
    ActivityOutcome.tooEarlyRevisitLater => 'TOO_EARLY_REVISIT_LATER',
  };
}

/// Catalogued as Phase 6 in the implementation map (`stakeholders.md`
/// territory), but `ProjectDetailView.stakeholders[].role` (§9) is a Phase-1
/// response field, same reasoning as the Activity enums above — only the
/// enum is needed early, for read-only display; the stakeholder-editing UI
/// stays Phase 6.
enum StakeholderRole {
  @JsonValue('OWNER')
  owner,
  @JsonValue('MAIN_CONTRACTOR')
  mainContractor,
  @JsonValue('ELECTRICAL_MEP_SUBCONTRACTOR')
  electricalMepSubcontractor,
  @JsonValue('CONSULTANT_ENGINEERING_OFFICE')
  consultantEngineeringOffice,
  @JsonValue('PURCHASING_MANAGER')
  purchasingManager,
  @JsonValue('SITE_ELECTRICIAN')
  siteElectrician,
  @JsonValue('ELECTRICAL_ENGINEER')
  electricalEngineer,
  @JsonValue('SITE_SUPERVISOR')
  siteSupervisor,
  @JsonValue('OTHER')
  other,
}

extension StakeholderRoleWire on StakeholderRole {
  String get wireValue => switch (this) {
    StakeholderRole.owner => 'OWNER',
    StakeholderRole.mainContractor => 'MAIN_CONTRACTOR',
    StakeholderRole.electricalMepSubcontractor =>
      'ELECTRICAL_MEP_SUBCONTRACTOR',
    StakeholderRole.consultantEngineeringOffice =>
      'CONSULTANT_ENGINEERING_OFFICE',
    StakeholderRole.purchasingManager => 'PURCHASING_MANAGER',
    StakeholderRole.siteElectrician => 'SITE_ELECTRICIAN',
    StakeholderRole.electricalEngineer => 'ELECTRICAL_ENGINEER',
    StakeholderRole.siteSupervisor => 'SITE_SUPERVISOR',
    StakeholderRole.other => 'OTHER',
  };
}

/// stakeholders.md §S2's closed list — **6 values**, not the 9 above. The
/// extra 3 (`SITE_ELECTRICIAN`/`ELECTRICAL_ENGINEER`/`SITE_SUPERVISOR`) only
/// ever appear in `projects-client-reference.md`'s read-side `StakeholderRole`
/// (kept as-is, unchanged, for parsing `GET /projects/{id}` responses that
/// may carry them). stakeholders.md's own write path (`POST .../stakeholders`,
/// `.../replace`) only recognizes these 6 — "an unrecognised value becomes
/// `OTHER` rather than an error" — so offering the other 3 in a *creation*
/// picker would silently save as `OTHER`, diverging from what the rep
/// thinks they picked. Used to restrict the link-creation/replace pickers
/// only (projects-implementation-map.md §10).
const stakeholderLinkableRoles = [
  StakeholderRole.owner,
  StakeholderRole.mainContractor,
  StakeholderRole.electricalMepSubcontractor,
  StakeholderRole.consultantEngineeringOffice,
  StakeholderRole.purchasingManager,
  StakeholderRole.other,
];

/// stakeholders.md `POST /accounts` — `type` is `COMPANY` (default) or
/// `INDIVIDUAL`.
enum AccountType {
  @JsonValue('COMPANY')
  company,
  @JsonValue('INDIVIDUAL')
  individual,
}

extension AccountTypeWire on AccountType {
  String get wireValue => switch (this) {
    AccountType.company => 'COMPANY',
    AccountType.individual => 'INDIVIDUAL',
  };
}

/// §5 `GET /projects/needs-attention` — returned in urgency order
/// (first-match-wins ranking: `FOLLOW_UP_DUE` > `AWAITING_THEM` >
/// `STAGE_WITHOUT_EVIDENCE` > `NO_ACTIVITY`).
enum AttentionReason {
  @JsonValue('FOLLOW_UP_DUE')
  followUpDue,
  @JsonValue('AWAITING_THEM')
  awaitingThem,
  @JsonValue('STAGE_WITHOUT_EVIDENCE')
  stageWithoutEvidence,
  @JsonValue('NO_ACTIVITY')
  noActivity,
}

/// §6 `POST /activities/sync` per-item result.
enum SyncItemStatus {
  @JsonValue('CREATED')
  created,
  @JsonValue('DUPLICATE')
  duplicate,
  @JsonValue('REJECTED')
  rejected,
}

// ══════════════════════ Phase 3 — Outcomes ══════════════════════════════

enum OutcomeType {
  @JsonValue('WON')
  won,
  @JsonValue('LOST')
  lost,
}

extension OutcomeTypeWire on OutcomeType {
  String get wireValue => switch (this) {
    OutcomeType.won => 'WON',
    OutcomeType.lost => 'LOST',
  };
}

enum OutcomeStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('REJECTED')
  rejected,
}

extension OutcomeStatusWire on OutcomeStatus {
  String get wireValue => switch (this) {
    OutcomeStatus.pending => 'PENDING',
    OutcomeStatus.confirmed => 'CONFIRMED',
    OutcomeStatus.rejected => 'REJECTED',
  };
}

/// `PRICE` makes `competitorPrice` required (§5 `POST /projects/{id}/lost`).
enum LossReason {
  @JsonValue('PRICE')
  price,
  @JsonValue('PAYMENT_TERMS')
  paymentTerms,
  @JsonValue('AVAILABILITY')
  availability,
  @JsonValue('SPEC_MISMATCH')
  specMismatch,
  @JsonValue('COMPETITOR_RELATIONSHIP')
  competitorRelationship,
  @JsonValue('CONSULTANT_SPECIFIED_COMPETITOR')
  consultantSpecifiedCompetitor,
  @JsonValue('LATE_ENGAGEMENT')
  lateEngagement,
  @JsonValue('OUTLET_DID_NOT_STOCK')
  outletDidNotStock,
  @JsonValue('OTHER')
  other,
}

extension LossReasonWire on LossReason {
  String get wireValue => switch (this) {
    LossReason.price => 'PRICE',
    LossReason.paymentTerms => 'PAYMENT_TERMS',
    LossReason.availability => 'AVAILABILITY',
    LossReason.specMismatch => 'SPEC_MISMATCH',
    LossReason.competitorRelationship => 'COMPETITOR_RELATIONSHIP',
    LossReason.consultantSpecifiedCompetitor =>
      'CONSULTANT_SPECIFIED_COMPETITOR',
    LossReason.lateEngagement => 'LATE_ENGAGEMENT',
    LossReason.outletDidNotStock => 'OUTLET_DID_NOT_STOCK',
    LossReason.other => 'OTHER',
  };
}

enum ProductCategory {
  @JsonValue('SOCKETS_SWITCHES')
  socketsSwitches,
  @JsonValue('LIGHTING')
  lighting,
  @JsonValue('EXHAUST_FANS')
  exhaustFans,
  @JsonValue('CABLES')
  cables,
  @JsonValue('DISTRIBUTION_BOARDS')
  distributionBoards,
  @JsonValue('CIRCUIT_BREAKERS')
  circuitBreakers,
  @JsonValue('CONDUIT_TRUNKING')
  conduitTrunking,
  @JsonValue('ACCESSORIES')
  accessories,
  @JsonValue('OTHER')
  other,
}

extension ProductCategoryWire on ProductCategory {
  String get wireValue => switch (this) {
    ProductCategory.socketsSwitches => 'SOCKETS_SWITCHES',
    ProductCategory.lighting => 'LIGHTING',
    ProductCategory.exhaustFans => 'EXHAUST_FANS',
    ProductCategory.cables => 'CABLES',
    ProductCategory.distributionBoards => 'DISTRIBUTION_BOARDS',
    ProductCategory.circuitBreakers => 'CIRCUIT_BREAKERS',
    ProductCategory.conduitTrunking => 'CONDUIT_TRUNKING',
    ProductCategory.accessories => 'ACCESSORIES',
    ProductCategory.other => 'OTHER',
  };
}
