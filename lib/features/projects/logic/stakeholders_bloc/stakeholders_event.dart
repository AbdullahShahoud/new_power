import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_contact_request.dart';
import '../../data/models/add_stakeholder_link_request.dart';
import '../../data/models/enums.dart';
import '../../data/models/register_account_request.dart';
import '../../data/models/close_stakeholder_link_request.dart';
import '../../data/models/patch_stakeholder_link_request.dart';
import '../../data/models/reason_request.dart';
import '../../data/models/replace_stakeholder_link_request.dart';
import '../../data/models/set_decision_maker_request.dart';

part 'stakeholders_event.freezed.dart';

/// Backs the project-detail screen's stakeholder/decision-maker sections.
/// Phase 6 — projects-implementation-map.md §10.
@freezed
sealed class StakeholdersEvent with _$StakeholdersEvent {
  const factory StakeholdersEvent.linksListRequested({
    required String projectId,
    @Default(false) bool includeClosed,
  }) = StakeholderLinksListRequested;

  const factory StakeholdersEvent.linkAddSubmitted({
    required String projectId,
    required AddStakeholderLinkRequest request,
  }) = StakeholderLinkAddSubmitted;

  /// Add flow, **new company**: the person and their company are both new,
  /// so `POST /accounts` creates them together (contact inlined) and the
  /// link follows.
  const factory StakeholdersEvent.stakeholderPersonAdded({
    required String projectId,
    required RegisterAccountRequest account,
    required StakeholderRole role,
    String? note,
  }) = StakeholderPersonAdded;

  /// Add flow, **company already on this project**: the second person a rep
  /// meets usually works for a company already linked here, so this files
  /// them under that account instead of creating a near-duplicate.
  const factory StakeholdersEvent.stakeholderPersonAddedToCompany({
    required String projectId,
    required String accountId,
    required AddContactRequest contact,
    required StakeholderRole role,
    String? note,
  }) = StakeholderPersonAddedToCompany;

  const factory StakeholdersEvent.linkPatchSubmitted({
    required String projectId,
    required String linkId,
    required PatchStakeholderLinkRequest request,
  }) = StakeholderLinkPatchSubmitted;

  const factory StakeholdersEvent.linkCloseSubmitted({
    required String projectId,
    required String linkId,
    required CloseStakeholderLinkRequest request,
  }) = StakeholderLinkCloseSubmitted;

  const factory StakeholdersEvent.linkReplaceSubmitted({
    required String projectId,
    required String linkId,
    required ReplaceStakeholderLinkRequest request,
  }) = StakeholderLinkReplaceSubmitted;

  const factory StakeholdersEvent.decisionMakerRequested(String projectId) =
      DecisionMakerRequested;

  const factory StakeholdersEvent.decisionMakerSetSubmitted({
    required String projectId,
    required SetDecisionMakerRequest request,
  }) = DecisionMakerSetSubmitted;

  const factory StakeholdersEvent.decisionMakerRemoveSubmitted({
    required String projectId,
    required ReasonRequest request,
  }) = DecisionMakerRemoveSubmitted;

  const factory StakeholdersEvent.decisionMakerHistoryRequested(
    String projectId,
  ) = DecisionMakerHistoryRequested;
}
