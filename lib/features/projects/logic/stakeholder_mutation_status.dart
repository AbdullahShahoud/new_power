import '../../../core/networking/api_error_model.dart';

/// stakeholders.md's error-code table, collapsed onto the states the UI
/// branches on — shared by `AccountsBloc` and `StakeholdersBloc` since both
/// mutate resources from the same module and the code space is disjoint
/// enough not to collide. Merge-only codes (`ACCOUNT_ALREADY_MERGED`,
/// `ACCOUNT_MERGE_WINDOW_EXPIRED`, ...) are intentionally absent — a rep
/// can never reach `/account-merges` or an account old enough to have been
/// merged away through a route this client calls.
enum StakeholderMutationStatus {
  idle,
  inProgress,
  success,

  /// `ACCOUNT_INVALID_NAME` · `CONTACT_INVALID_NAME` · `CONTACT_INVALID_PHONE`
  /// · `CONTACT_INVALID_EMAIL` · `ACCOUNT_INVALID_REGISTRATION_NUMBER` ·
  /// `STAKEHOLDER_INVALID_REASON` · `VALIDATION_ERROR`
  validationError,

  /// `ACCOUNT_NOT_FOUND` · `CONTACT_NOT_FOUND` · `STAKEHOLDER_LINK_NOT_FOUND`
  /// · `STAKEHOLDER_PROJECT_NOT_FOUND` · `DECISION_MAKER_NOT_SET`
  notFound,

  /// `ACCOUNT_NOT_OWNER` (PATCH/archive on someone else's record) ·
  /// `STAKEHOLDER_PROJECT_NOT_ACCESSIBLE`
  permissionDenied,

  /// `STAKEHOLDER_ALREADY_LINKED` — same account/role/project pair already
  /// has a live link (or the incoming account on a replace).
  alreadyLinked,

  /// `CONTACT_IS_DECISION_MAKER` — archiving is refused rather than
  /// cascading; carries `projectCount` in the doc, not surfaced beyond the
  /// message here.
  isDecisionMaker,

  /// `ACCOUNT_ARCHIVED` · `CONTACT_ARCHIVED` · `STAKEHOLDER_LINK_CLOSED` ·
  /// `DECISION_MAKER_PERIOD_CLOSED`
  archived,

  /// `CONTACT_NOT_ON_ACCOUNT` — the contact belongs to a different account
  /// than the route says.
  contactNotOnAccount,

  /// `CONTACT_NOT_ON_PROJECT` — the decision-maker contact's account has no
  /// live link on this project.
  contactNotOnProject,

  /// `DECISION_MAKER_REQUIRED_AT_STAGE` — refused from `ENGAGEMENT`
  /// onwards; carries the `stage` in the doc.
  decisionMakerRequiredAtStage,

  /// `DECISION_MAKER_REASON_REQUIRED` — moving the flag without a reason.
  decisionMakerReasonRequired,

  /// `STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED` — the flag rides this link
  /// and no successor contact was named.
  replacementContactRequired,

  networkError,
}

StakeholderMutationStatus stakeholderMutationStatusFor(ApiErrorModel error) {
  switch (error.code) {
    case 'ACCOUNT_INVALID_NAME':
    case 'CONTACT_INVALID_NAME':
    case 'CONTACT_INVALID_PHONE':
    case 'CONTACT_INVALID_EMAIL':
    case 'ACCOUNT_INVALID_REGISTRATION_NUMBER':
    case 'STAKEHOLDER_INVALID_REASON':
    case 'VALIDATION_ERROR':
      return StakeholderMutationStatus.validationError;
    case 'ACCOUNT_NOT_FOUND':
    case 'CONTACT_NOT_FOUND':
    case 'STAKEHOLDER_LINK_NOT_FOUND':
    case 'STAKEHOLDER_PROJECT_NOT_FOUND':
    case 'DECISION_MAKER_NOT_SET':
      return StakeholderMutationStatus.notFound;
    case 'ACCOUNT_NOT_OWNER':
    case 'STAKEHOLDER_PROJECT_NOT_ACCESSIBLE':
      return StakeholderMutationStatus.permissionDenied;
    case 'STAKEHOLDER_ALREADY_LINKED':
      return StakeholderMutationStatus.alreadyLinked;
    case 'CONTACT_IS_DECISION_MAKER':
      return StakeholderMutationStatus.isDecisionMaker;
    case 'ACCOUNT_ARCHIVED':
    case 'CONTACT_ARCHIVED':
    case 'STAKEHOLDER_LINK_CLOSED':
    case 'DECISION_MAKER_PERIOD_CLOSED':
      return StakeholderMutationStatus.archived;
    case 'CONTACT_NOT_ON_ACCOUNT':
      return StakeholderMutationStatus.contactNotOnAccount;
    case 'CONTACT_NOT_ON_PROJECT':
      return StakeholderMutationStatus.contactNotOnProject;
    case 'DECISION_MAKER_REQUIRED_AT_STAGE':
      return StakeholderMutationStatus.decisionMakerRequiredAtStage;
    case 'DECISION_MAKER_REASON_REQUIRED':
      return StakeholderMutationStatus.decisionMakerReasonRequired;
    case 'STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED':
      return StakeholderMutationStatus.replacementContactRequired;
    default:
      return StakeholderMutationStatus.networkError;
  }
}
