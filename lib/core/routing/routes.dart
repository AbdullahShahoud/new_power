class Routes {
  // Startup
  static const String startupError = '/startup-error';

  // Onboarding
  static const String onboardingScreen = '/onboarding';

  // Auth Routes
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgotPasswordScreen = '/forgotPassword';
  static const String resetPasswordScreen = '/resetPassword';
  // Single screen for email verification, device verification and 2FA —
  // auth.md: one endpoint (/auth/verify-otp) serves all three flows.
  static const String verifyOtpScreen = '/verifyOtp';

  // Home — tabbed shell (Home, Projects, Products, Profile)
  static const String homeScreen = '/home';

  // Pushed from the Home tab's notification bell (not a bottom-bar tab).
  static const String notificationsScreen = '/notifications';
  static const String notificationSettingsScreen = '/notifications/settings';

  // User self-service (users.md `/users/me/*`), reached from Profile.
  static const String changePasswordScreen = '/profile/change-password';
  // Argument: {'currentUsername': String?}. Pops the new username on success.
  static const String changeUsernameScreen = '/profile/change-username';

  // Projects (Phase 1 — projects-implementation-map.md)
  static const String registerProjectScreen = '/projects/register';
  // Argument: {'projectId': String}
  static const String projectDetailScreen = '/projects/detail';
  // Argument: {'project': ProjectDetailView}. Pops `true` when the caller
  // should refresh (saved, version conflict, or the project vanished).
  static const String editProjectScreen = '/projects/edit';

  // Activities (Phase 2)
  // Arguments: {'projectId': String, 'stakeholders': List<StakeholderRefView>}
  static const String logActivityScreen = '/projects/activities/log';
  // Argument: {'activityId': String}
  static const String activityDetailScreen = '/projects/activities/detail';

  // Outcomes (Phase 3)
  // Argument: {'projectId': String}
  static const String submitOutcomeScreen = '/projects/outcomes/submit';
  // Argument: {'outcomeId': String}
  static const String outcomeDetailScreen = '/projects/outcomes/detail';
  static const String outcomesListScreen = '/projects/outcomes/list';

  // Offline sync (Phase 4)
  static const String offlineQueueScreen = '/projects/offline-queue';

  // Stakeholders (Phase 6) — stakeholders.md
  // Pops with an AccountView, or null.
  static const String accountPickerScreen = '/stakeholders/accounts/pick';
  // Pops with an AccountView, or null.
  static const String registerAccountScreen = '/stakeholders/accounts/register';
  // Argument: {'accountId': String}. Pops with a ContactView, or null.
  static const String contactPickerScreen = '/stakeholders/contacts/pick';
  // Argument: {'accountId': String}. Pops with a ContactView, or null.
  // ========================= Catalogue =========================
  /// The catalogue tab root lives inside `MainScreen`; these are the pushes
  /// above it.
  static const String catalogCategoryScreen = '/catalog/category';
  static const String catalogSearchScreen = '/catalog/search';
  static const String productDetailScreen = '/catalog/product';

  static const String accountContactsScreen = '/stakeholders/contacts/roster';
  static const String addContactScreen = '/stakeholders/contacts/add';
  // Argument: {'projectId': String}
  static const String decisionMakerHistoryScreen =
      '/stakeholders/decision-maker/history';
  // Argument: {'projectId': String}. Pops with true on success.
  static const String addStakeholderLinkScreen = '/stakeholders/links/add';
  // Arguments: {'projectId': String, 'linkId': String, 'accountId': String,
  // 'initialContactName': String?, 'initialNote': String?}. Pops with true
  // on success.
  static const String editStakeholderLinkScreen = '/stakeholders/links/edit';
  // Arguments: {'projectId': String, 'linkId': String, 'outgoingAccountName':
  // String, 'roleLabel': String}. Pops with true on success.
  static const String replaceStakeholderLinkScreen =
      '/stakeholders/links/replace';

  // Map picker (google_maps_flutter) — used by project registration and
  // activity location capture. Arguments: {'initialLatitude': double?,
  // 'initialLongitude': double?, 'showNearbyProjects': bool}. Pops with
  // `({double lat, double lng})`, or null.
  static const String mapPickerScreen = '/map/pick';
}
