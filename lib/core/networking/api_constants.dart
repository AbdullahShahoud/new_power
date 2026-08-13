class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://gyrostack.cloud/api/v1',
  );

  // ========================== Authentication ==========================
  // Source of truth: auth.md. Registration is closed (requires managerCode);
  // device metadata (deviceId/deviceName/deviceType/deviceModel/osVersion/
  // appVersion) travels flat on register/login bodies — there is no separate
  // device-registration endpoint.
  static const String registerUser = "/auth/register";
  static const String loginUser = "/auth/login";
  static const String verifyOtp = "/auth/verify-otp";
  static const String requestVerification = "/auth/request-verification";
  static const String resendVerification = "/auth/resend-verification";
  static const String refreshToken = "/auth/refresh";
  static const String logoutUser = "/auth/logout";
  static const String me = "/auth/me";
  static const String forgotPassword = "/auth/forgot-password";
  static const String resetPassword = "/auth/reset-password";

  // ========================= User self-service ==========================
  // Source of truth: users.md, "Self-service — /users". Any authenticated
  // role may call these. The `/admin/users` and `/representatives` groups
  // in that same doc are `SALES_ADMIN`/`GENERAL_MANAGER`/`SALES_MANAGER`+
  // and deliberately absent — this client only ever serves a rep.
  static const String changeMyPassword = "/users/me/password";
  static const String changeMyUsername = "/users/me/username";

  // ============================== Files ================================
  // Source of truth: projects-client-reference.md §5/§9. Every uploaded
  // file in the app (project photos now, activity attachments in Phase 2)
  // goes through these two routes.
  static const String uploadFile = "/files";
  static const String resolveFile = "/files/resolve";

  // ============================= Projects ===============================
  // Phase 1 of the Sales-Representative business-logic module. See
  // projects-implementation-map.md for the full endpoint→repository→Bloc
  // mapping. Path-templated routes take `{id}`-style placeholders filled in
  // by the caller (Retrofit's @Path substitutes them).
  static const String projects = "/projects";
  static const String nearbyProjects = "/projects/nearby";
  static const String projectById = "/projects/{id}";
  static const String projectStage = "/projects/{id}/stage";
  static const String projectStatus = "/projects/{id}/status";
  static const String projectLocation = "/projects/{id}/location";
  static const String projectHistory = "/projects/{id}/history";
  static const String projectImages = "/projects/{id}/images";
  static const String projectImageById = "/projects/{id}/images/{imageId}";

  // ============================ Activities ================================
  // Phase 2 of the Sales-Representative business-logic module. `needsAttention`
  // is currently shadowed by `GET /projects/{id}` on the backend (§12,
  // confirmed by test) — implemented against the documented contract, not
  // called from the Home tab until the backend fixes controller ordering
  // (projects-implementation-map.md §10.2).
  static const String needsAttention = "/projects/needs-attention";
  static const String projectActivities = "/projects/{projectId}/activities";
  static const String activities = "/activities";
  static const String activityById = "/activities/{id}";
  static const String syncActivities = "/activities/sync";

  // ============================= Outcomes =================================
  // Phase 3. The four-eyes rule: whoever submits (won/lost) cannot confirm.
  static const String projectWon = "/projects/{projectId}/won";
  static const String projectLost = "/projects/{projectId}/lost";
  static const String outcomes = "/outcomes";
  static const String outcomeById = "/outcomes/{id}";
  static const String outcomeConfirm = "/outcomes/{id}/confirm";
  static const String outcomeReject = "/outcomes/{id}/reject";

  // ========================= Stakeholders (Phase 6) ========================
  // Source of truth: stakeholders.md. Only the routes a REPRESENTATIVE can
  // reach are wired — everything else on `/accounts` is `SALES_MANAGER`+/
  // `SALES_ADMIN`+ and this app has no role above REPRESENTATIVE to serve.
  static const String accounts = "/accounts";
  static const String accountContacts = "/accounts/{id}/contacts";
  static const String accountContactById =
      "/accounts/{id}/contacts/{contactId}";
  static const String projectStakeholders =
      "/projects/{projectId}/stakeholders";
  static const String projectStakeholderById =
      "/projects/{projectId}/stakeholders/{linkId}";
  static const String projectStakeholderReplace =
      "/projects/{projectId}/stakeholders/{linkId}/replace";
  static const String projectDecisionMaker =
      "/projects/{projectId}/decision-maker";
  static const String projectDecisionMakerHistory =
      "/projects/{projectId}/decision-maker/history";
}
