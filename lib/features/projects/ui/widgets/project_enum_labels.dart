import '../../data/models/enums.dart';

/// Localization-key mapping for every Projects-module enum rendered as
/// user-facing text — one place instead of a repeated switch in every
/// screen that shows a stage/status/building-type/construction-phase label
/// (list card, detail card, register form, stage-change sheet).
extension ProjectStageLabel on ProjectStage {
  String get labelKey => switch (this) {
    ProjectStage.lead => 'project_stage_lead',
    ProjectStage.qualified => 'project_stage_qualified',
    ProjectStage.engagement => 'project_stage_engagement',
    ProjectStage.approval => 'project_stage_approval',
    ProjectStage.boqReceived => 'project_stage_boq_received',
    ProjectStage.quoteIssued => 'project_stage_quote_issued',
    ProjectStage.committed => 'project_stage_committed',
    ProjectStage.won => 'project_stage_won',
    ProjectStage.lost => 'project_stage_lost',
  };
}

extension ProjectStatusLabel on ProjectStatus {
  String get labelKey => switch (this) {
    ProjectStatus.active => 'project_status_active',
    ProjectStatus.dormant => 'project_status_dormant',
    ProjectStatus.cancelled => 'project_status_cancelled',
  };
}

extension BuildingTypeLabel on BuildingType {
  String get labelKey => switch (this) {
    BuildingType.apartmentBuilding => 'building_type_apartment_building',
    BuildingType.villa => 'building_type_villa',
    BuildingType.residentialComplex => 'building_type_residential_complex',
    BuildingType.commercial => 'building_type_commercial',
    BuildingType.mixedUse => 'building_type_mixed_use',
    BuildingType.industrial => 'building_type_industrial',
    BuildingType.hospitality => 'building_type_hospitality',
    BuildingType.healthcare => 'building_type_healthcare',
    BuildingType.educational => 'building_type_educational',
    BuildingType.government => 'building_type_government',
    BuildingType.religious => 'building_type_religious',
    BuildingType.infrastructure => 'building_type_infrastructure',
    BuildingType.other => 'building_type_other',
  };
}

/// Read-only in Phase 1 — rendered inside `ProjectDetailView.stakeholders`
/// (the linking/editing UI is Phase 6), but the label still needs to be a
/// real string, not the enum's `toString()`.
extension StakeholderRoleLabel on StakeholderRole {
  String get labelKey => switch (this) {
    StakeholderRole.owner => 'stakeholder_role_owner',
    StakeholderRole.mainContractor => 'stakeholder_role_main_contractor',
    StakeholderRole.electricalMepSubcontractor =>
      'stakeholder_role_electrical_mep_subcontractor',
    StakeholderRole.consultantEngineeringOffice =>
      'stakeholder_role_consultant_engineering_office',
    StakeholderRole.purchasingManager => 'stakeholder_role_purchasing_manager',
    StakeholderRole.siteElectrician => 'stakeholder_role_site_electrician',
    StakeholderRole.electricalEngineer =>
      'stakeholder_role_electrical_engineer',
    StakeholderRole.siteSupervisor => 'stakeholder_role_site_supervisor',
    StakeholderRole.other => 'stakeholder_role_other',
  };
}

extension ConstructionPhaseLabel on ConstructionPhase {
  String get labelKey => switch (this) {
    ConstructionPhase.planning => 'construction_phase_planning',
    ConstructionPhase.excavation => 'construction_phase_excavation',
    ConstructionPhase.foundation => 'construction_phase_foundation',
    ConstructionPhase.structure => 'construction_phase_structure',
    ConstructionPhase.blockwork => 'construction_phase_blockwork',
    ConstructionPhase.electricalRoughIn =>
      'construction_phase_electrical_rough_in',
    ConstructionPhase.plastering => 'construction_phase_plastering',
    ConstructionPhase.finishing => 'construction_phase_finishing',
    ConstructionPhase.electricalFitOut =>
      'construction_phase_electrical_fit_out',
    ConstructionPhase.handover => 'construction_phase_handover',
    ConstructionPhase.completed => 'construction_phase_completed',
  };
}

extension ActivityKindLabel on ActivityKind {
  String get labelKey => switch (this) {
    ActivityKind.visit => 'activity_kind_visit',
    ActivityKind.communication => 'activity_kind_communication',
  };
}

extension ActivityChannelLabel on ActivityChannel {
  String get labelKey => switch (this) {
    ActivityChannel.phoneCall => 'activity_channel_phone_call',
    ActivityChannel.whatsapp => 'activity_channel_whatsapp',
    ActivityChannel.email => 'activity_channel_email',
    ActivityChannel.sms => 'activity_channel_sms',
    ActivityChannel.other => 'activity_channel_other',
  };
}

extension ActivityPurposeLabel on ActivityPurpose {
  String get labelKey => switch (this) {
    ActivityPurpose.discovery => 'activity_purpose_discovery',
    ActivityPurpose.samples => 'activity_purpose_samples',
    ActivityPurpose.catalog => 'activity_purpose_catalog',
    ActivityPurpose.quantities => 'activity_purpose_quantities',
    ActivityPurpose.priceQuote => 'activity_purpose_price_quote',
    ActivityPurpose.negotiation => 'activity_purpose_negotiation',
    ActivityPurpose.followUp => 'activity_purpose_follow_up',
    ActivityPurpose.gift => 'activity_purpose_gift',
    ActivityPurpose.other => 'activity_purpose_other',
  };
}

extension ActivityOutcomeLabel on ActivityOutcome {
  String get labelKey => switch (this) {
    ActivityOutcome.progressing => 'activity_outcome_progressing',
    ActivityOutcome.needsAnotherVisit => 'activity_outcome_needs_another_visit',
    ActivityOutcome.waitingOnThem => 'activity_outcome_waiting_on_them',
    ActivityOutcome.awaitingQuantities =>
      'activity_outcome_awaiting_quantities',
    ActivityOutcome.competitorOnSite => 'activity_outcome_competitor_on_site',
    ActivityOutcome.decisionImminent => 'activity_outcome_decision_imminent',
    ActivityOutcome.noOnePresent => 'activity_outcome_no_one_present',
    ActivityOutcome.workStopped => 'activity_outcome_work_stopped',
    ActivityOutcome.tooEarlyRevisitLater =>
      'activity_outcome_too_early_revisit_later',
  };
}

/// §5 `GET /projects/needs-attention` — machine-readable grouping/icon key.
/// The `message` field itself is server-composed Arabic prose and must be
/// rendered verbatim, never rebuilt from this.
extension AttentionReasonLabel on AttentionReason {
  String get labelKey => switch (this) {
    AttentionReason.followUpDue => 'attention_reason_follow_up_due',
    AttentionReason.awaitingThem => 'attention_reason_awaiting_them',
    AttentionReason.stageWithoutEvidence =>
      'attention_reason_stage_without_evidence',
    AttentionReason.noActivity => 'attention_reason_no_activity',
  };
}

extension OutcomeTypeLabel on OutcomeType {
  String get labelKey => switch (this) {
    OutcomeType.won => 'outcome_type_won',
    OutcomeType.lost => 'outcome_type_lost',
  };
}

extension OutcomeStatusLabel on OutcomeStatus {
  String get labelKey => switch (this) {
    OutcomeStatus.pending => 'outcome_status_pending',
    OutcomeStatus.confirmed => 'outcome_status_confirmed',
    OutcomeStatus.rejected => 'outcome_status_rejected',
  };
}

extension LossReasonLabel on LossReason {
  String get labelKey => switch (this) {
    LossReason.price => 'loss_reason_price',
    LossReason.paymentTerms => 'loss_reason_payment_terms',
    LossReason.availability => 'loss_reason_availability',
    LossReason.specMismatch => 'loss_reason_spec_mismatch',
    LossReason.competitorRelationship =>
      'loss_reason_competitor_relationship',
    LossReason.consultantSpecifiedCompetitor =>
      'loss_reason_consultant_specified_competitor',
    LossReason.lateEngagement => 'loss_reason_late_engagement',
    LossReason.outletDidNotStock => 'loss_reason_outlet_did_not_stock',
    LossReason.other => 'loss_reason_other',
  };
}

extension ProductCategoryLabel on ProductCategory {
  String get labelKey => switch (this) {
    ProductCategory.socketsSwitches => 'product_category_sockets_switches',
    ProductCategory.lighting => 'product_category_lighting',
    ProductCategory.exhaustFans => 'product_category_exhaust_fans',
    ProductCategory.cables => 'product_category_cables',
    ProductCategory.distributionBoards =>
      'product_category_distribution_boards',
    ProductCategory.circuitBreakers => 'product_category_circuit_breakers',
    ProductCategory.conduitTrunking => 'product_category_conduit_trunking',
    ProductCategory.accessories => 'product_category_accessories',
    ProductCategory.other => 'product_category_other',
  };
}

extension AccountTypeLabel on AccountType {
  String get labelKey => switch (this) {
    AccountType.company => 'account_type_company',
    AccountType.individual => 'account_type_individual',
  };
}

extension AccountClassificationLabel on AccountClassification {
  String get labelKey => switch (this) {
    AccountClassification.projectStakeholder =>
      'account_classification_project_stakeholder',
    AccountClassification.distributor => 'account_classification_distributor',
    AccountClassification.competitor => 'account_classification_competitor',
  };
}
