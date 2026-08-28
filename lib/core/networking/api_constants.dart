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
  static const String accountClassifications =
      "/accounts/{id}/classifications";

  /// The rep's own roster under one account (A5) — narrowed server-side to
  /// contacts this rep added, so it legitimately disagrees with the account
  /// row's `contactCount` (which counts everyone).
  static const String accountContacts = "/accounts/{id}/contacts";

  /// Contacts are a **top-level resource** now, not nested under an
  /// account — `accountId` is optional so an unfiled person is expressible
  /// (directory-mobile-integration.md §7.1).
  static const String contacts = "/contacts";
  static const String contactById = "/contacts/{id}";
  static const String contactAccount = "/contacts/{id}/account";
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

  // ========================= Catalogue =========================
  // catalog-mobile-integration.md §7. Nine GET endpoints, all
  // `REPRESENTATIVE`+ — there is no role branch on this surface, and no
  // write surface at all. `/catalog/sync` is deliberately absent: offline
  // is out of scope for this build.

  /// §7.1 — the attribute dictionary. No query parameters; binds no DTO, so
  /// extras are ignored rather than rejected.
  static const String catalogAttributes = "/catalog/attributes";

  /// §7.2 — the cheap staleness probe.
  static const String catalogVersion = "/catalog/version";

  /// §7.4 — the taxonomy.
  static const String categories = "/categories";

  /// §7.5 — the filter rail. ⚠️ Declared **before** `:idOrSlug`
  /// server-side and the category travels as a **query parameter**;
  /// `/categories/{id}/filters` does not exist and would parse as a slug.
  static const String categoryFilters = "/categories/filters";

  static const String categoryById = "/categories/{idOrSlug}";

  /// §7.7 — list/filter/search. ⚠️ Its envelope nests the payload one level
  /// deeper than every other endpoint in this app (§5.2).
  static const String products = "/products";

  /// §7.8 — typeahead. Declared before `:idOrSlug`; do not reorder.
  static const String productSuggest = "/products/suggest";

  static const String productById = "/products/{idOrSlug}";

  // ========================== Attainment ==========================
  // attainment-me.md. ⚠️ `REPRESENTATIVE` **only** — an exact `@Roles(...)`
  // match, not a rank floor, so every other role gets a 403 here and reads
  // the same numbers through `GET /attainment` instead. That team route and
  // the manager drill-down are deliberately absent: this client has no role
  // above REPRESENTATIVE to serve.
  //
  // Two optional query keys and no others — the global ValidationPipe runs
  // with `forbidNonWhitelisted`, so an unknown key is a 400. There is no
  // `page`/`limit` to send: `targets` is a complete list.
  static const String attainmentMe = "/attainment/me";

  // ======================== Notifications ========================
  // notifications-mobile-integration.md §2.1. The controller carries no
  // @MinRole and no @Roles, and RolesGuard lets every authenticated role
  // through when there is no role metadata — so all of these are open to
  // a representative.
  static const String notifications = "/notifications";
  static const String notificationUnreadCount =
      "/notifications/unread-count";

  /// Read **and** write. The earlier contract had no update route at all;
  /// this one governs the four mute switches and the notification language.
  static const String notificationPreferences = "/notifications/preferences";
  static const String notificationRead = "/notifications/{id}/read";
  static const String notificationReadAll = "/notifications/read-all";
  static const String notificationById = "/notifications/{id}";

  /// ⚠️ **Singular** — the controller is @Controller('device'), not
  /// 'devices'.
  static const String deviceFcmToken = "/device/fcm-token";
}
