import 'package:dio/dio.dart';
import 'package:new_power/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/forgot_password_request.dart'
    show ForgotPasswordRequest;
import '../../features/auth/data/models/forgot_password_response.dart'
    show ForgotPasswordResponse;
import '../../features/auth/data/models/login_request.dart';
import '../../features/auth/data/models/login_response.dart';
import '../../features/auth/data/models/logout_request.dart';
import '../../features/auth/data/models/logout_response.dart';
import '../../features/auth/data/models/refresh_token_request.dart';
import '../../features/auth/data/models/refresh_token_response.dart'
    show RefreshTokenResponse;
import '../../features/auth/data/models/register_request.dart';
import '../../features/auth/data/models/register_response.dart';
import '../../features/auth/data/models/request_verification_request.dart';
import '../../features/auth/data/models/resend_verification_response.dart';
import '../../features/auth/data/models/reset_password_request.dart';
import '../../features/auth/data/models/reset_password_response.dart';
import '../../features/auth/data/models/user_response.dart';
import '../../features/auth/data/models/verify_otp_request.dart';
import '../../features/auth/data/models/verify_otp_response.dart';
import '../../features/projects/data/models/accounts_list_response.dart';
import '../../features/projects/data/models/activities_list_response.dart';
import '../../features/projects/data/models/activity_detail_response.dart';
import '../../features/projects/data/models/activity_response.dart';
import '../../features/projects/data/models/add_contact_request.dart';
import '../../features/projects/data/models/add_project_images_request.dart';
import '../../features/projects/data/models/add_stakeholder_link_request.dart';
import '../../features/projects/data/models/attention_items_response.dart';
import '../../features/projects/data/models/change_location_request.dart';
import '../../features/projects/data/models/change_stage_request.dart';
import '../../features/projects/data/models/change_status_request.dart';
import '../../features/projects/data/models/close_stakeholder_link_request.dart';
import '../../features/projects/data/models/contact_response.dart';
import '../../features/projects/data/models/decision_maker_response.dart';
import '../../features/projects/data/models/file_response.dart';
import '../../features/projects/data/models/log_activity_request.dart';
import '../../features/projects/data/models/log_activity_response.dart';
import '../../features/projects/data/models/nested_message_response.dart';
import '../../features/projects/data/models/outcome_response.dart';
import '../../features/projects/data/models/outcomes_list_response.dart';
import '../../features/projects/data/models/patch_activity_request.dart';
import '../../features/projects/data/models/patch_contact_request.dart';
import '../../features/projects/data/models/patch_project_request.dart';
import '../../features/projects/data/models/patch_stakeholder_link_request.dart';
import '../../features/projects/data/models/project_detail_response.dart';
import '../../features/projects/data/models/project_history_response.dart';
import '../../features/projects/data/models/project_images_response.dart';
import '../../features/projects/data/models/project_response.dart';
import '../../features/projects/data/models/projects_list_response.dart';
import '../../features/projects/data/models/reason_request.dart';
import '../../features/projects/data/models/register_account_request.dart';
import '../../features/projects/data/models/register_account_response.dart';
import '../../features/projects/data/models/register_project_request.dart';
import '../../features/projects/data/models/register_project_response.dart';
import '../../features/projects/data/models/reject_outcome_request.dart';
import '../../features/projects/data/models/replace_stakeholder_link_request.dart';
import '../../features/projects/data/models/resolve_file_request.dart';
import '../../features/projects/data/models/set_decision_maker_request.dart';
import '../../features/projects/data/models/stakeholder_link_response.dart';
import '../../features/projects/data/models/submit_lost_request.dart';
import '../../features/projects/data/models/submit_won_request.dart';
import '../../features/projects/data/models/sync_activities_request.dart';
import '../../features/projects/data/models/sync_activities_response.dart';
import '../../features/user/data/models/change_password_request.dart';
import '../../features/user/data/models/change_username_request.dart';
import '../../features/user/data/models/user_message_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ========================== Authentication ==========================
  // Every path here matches auth.md exactly. Device metadata rides inline on
  // register/login bodies; X-Device-Id + Authorization headers are injected
  // by DioFactory's interceptor, not passed as method parameters here.

  @POST(ApiConstants.registerUser)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @POST(ApiConstants.loginUser)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponse> verifyOtp(@Body() VerifyOtpRequest request);

  @POST(ApiConstants.resendVerification)
  Future<ResendVerificationResponse> resendVerification(
    @Body() RequestVerificationRequest request,
  );

  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest refreshTokenRequest,
  );

  @POST(ApiConstants.logoutUser)
  Future<LogoutResponse> logout(@Body() LogoutRequest request);

  @GET(ApiConstants.me)
  Future<UserResponse> getCurrentUser();

  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() ForgotPasswordRequest request,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );

  // ============================== Files ================================
  // §5 Workflow 1: one file per call, multipart/form-data, field name
  // "file". Every photo/attachment in the module is a `key` from here.
  // NOTE: `POST /files` itself is NOT declared here — Retrofit's annotation
  // API has no way to expose Dio's `onSendProgress` callback per request,
  // and the upload state machine (projects-implementation-map.md §8.1)
  // needs a real 0..1 progress value, not a faked one. `FileRepository`
  // calls `DioFactory.getAppDio()` directly for that one request instead,
  // reusing the same interceptor-wired Dio instance this service uses.

  @POST(ApiConstants.resolveFile)
  Future<FileResponse> resolveFile(@Body() ResolveFileRequest request);

  // ========================= User self-service ==========================

  @PUT(ApiConstants.changeMyPassword)
  Future<UserMessageResponse> changeMyPassword(
    @Body() ChangePasswordRequest request,
  );

  @PATCH(ApiConstants.changeMyUsername)
  Future<ChangeUsernameResponse> changeMyUsername(
    @Body() ChangeUsernameRequest request,
  );

  // ============================= Projects ===============================
  // Phase 1 — see projects-implementation-map.md §2. `X-Device-Id` +
  // `Authorization` are injected by DioFactory's interceptor, same as auth.

  @POST(ApiConstants.projects)
  Future<RegisterProjectResponse> registerProject(
    @Body() RegisterProjectRequest request,
  );

  @GET(ApiConstants.projects)
  Future<ProjectsListResponse> getProjects({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('stage') String? stage,
    @Query('status') String? status,
    @Query('constructionPhase') String? constructionPhase,
    @Query('buildingType') String? buildingType,
    @Query('territoryId') String? territoryId,
    @Query('search') String? search,
    @Query('updatedSince') String? updatedSince,
    @Query('near') String? near,
  });

  @GET(ApiConstants.nearbyProjects)
  Future<NearbyProjectsResponse> getNearbyProjects({
    @Query('near') required String near,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiConstants.projectById)
  Future<ProjectDetailResponse> getProjectById(@Path('id') String id);

  @PATCH(ApiConstants.projectById)
  Future<ProjectResponse> patchProject(
    @Path('id') String id,
    @Body() PatchProjectRequest request,
  );

  @PUT(ApiConstants.projectStage)
  Future<ProjectResponse> changeProjectStage(
    @Path('id') String id,
    @Body() ChangeStageRequest request,
  );

  @PUT(ApiConstants.projectStatus)
  Future<ProjectResponse> changeProjectStatus(
    @Path('id') String id,
    @Body() ChangeStatusRequest request,
  );

  @PUT(ApiConstants.projectLocation)
  Future<ProjectResponse> changeProjectLocation(
    @Path('id') String id,
    @Body() ChangeLocationRequest request,
  );

  @GET(ApiConstants.projectHistory)
  Future<ProjectHistoryResponse> getProjectHistory(
    @Path('id') String id, {
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiConstants.projectImages)
  Future<ProjectImagesResponse> addProjectImages(
    @Path('id') String id,
    @Body() AddProjectImagesRequest request,
  );

  @DELETE(ApiConstants.projectImageById)
  Future<NestedMessageResponse> removeProjectImage(
    @Path('id') String id,
    @Path('imageId') String imageId,
  );

  // ============================ Activities ================================
  // Phase 2 — see projects-implementation-map.md §2. `needsAttention` is
  // implemented against the documented contract but not called from the
  // Home tab yet — it's currently shadowed server-side (§12).

  @GET(ApiConstants.needsAttention)
  Future<AttentionItemsResponse> getNeedsAttention({
    @Query('limit') int? limit,
  });

  @POST(ApiConstants.projectActivities)
  Future<LogActivityResponse> logActivity(
    @Path('projectId') String projectId,
    @Body() LogActivityRequest request,
  );

  @GET(ApiConstants.projectActivities)
  Future<ActivitiesListResponse> getProjectActivities(
    @Path('projectId') String projectId, {
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('kind') String? kind,
    @Query('purpose') String? purpose,
    @Query('outcome') String? outcome,
    @Query('createdBy') String? createdBy,
    @Query('occurredFrom') String? occurredFrom,
    @Query('occurredTo') String? occurredTo,
    @Query('editedAfterWindowOnly') bool? editedAfterWindowOnly,
  });

  @GET(ApiConstants.activities)
  Future<ActivitiesListResponse> getActivities({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('kind') String? kind,
    @Query('purpose') String? purpose,
    @Query('outcome') String? outcome,
    @Query('createdBy') String? createdBy,
    @Query('occurredFrom') String? occurredFrom,
    @Query('occurredTo') String? occurredTo,
    @Query('editedAfterWindowOnly') bool? editedAfterWindowOnly,
  });

  @GET(ApiConstants.activityById)
  Future<ActivityDetailResponse> getActivityById(@Path('id') String id);

  @PATCH(ApiConstants.activityById)
  Future<ActivityResponse> patchActivity(
    @Path('id') String id,
    @Body() PatchActivityRequest request,
  );

  @POST(ApiConstants.syncActivities)
  Future<SyncActivitiesResponse> syncActivities(
    @Body() SyncActivitiesRequest request,
  );

  // ============================= Outcomes ==================================
  // Phase 3 — see projects-implementation-map.md §2. The four-eyes rule
  // (whoever submits cannot confirm) is enforced server-side; the client
  // just renders the states it produces.

  @POST(ApiConstants.projectWon)
  Future<OutcomeResponse> submitWon(
    @Path('projectId') String projectId,
    @Body() SubmitWonRequest request,
  );

  @POST(ApiConstants.projectLost)
  Future<OutcomeResponse> submitLost(
    @Path('projectId') String projectId,
    @Body() SubmitLostRequest request,
  );

  @GET(ApiConstants.outcomes)
  Future<OutcomesListResponse> getOutcomes({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('status') String? status,
    @Query('type') String? type,
    @Query('projectId') String? projectId,
    @Query('submittedBy') String? submittedBy,
  });

  @GET(ApiConstants.outcomeById)
  Future<OutcomeResponse> getOutcomeById(@Path('id') String id);

  @POST(ApiConstants.outcomeConfirm)
  Future<OutcomeResponse> confirmOutcome(@Path('id') String id);

  @POST(ApiConstants.outcomeReject)
  Future<OutcomeResponse> rejectOutcome(
    @Path('id') String id,
    @Body() RejectOutcomeRequest request,
  );

  // ========================= Stakeholders (Phase 6) ========================

  @POST(ApiConstants.accounts)
  Future<RegisterAccountResponse> registerAccount(
    @Body() RegisterAccountRequest request,
  );

  @GET(ApiConstants.accounts)
  Future<AccountsListResponse> searchAccounts({
    @Query('search') String? search,
    @Query('type') String? type,
    @Query('city') String? city,
    @Query('includeArchived') bool? includeArchived,
    @Query('includeMerged') bool? includeMerged,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiConstants.accountContacts)
  Future<ContactResponse> addContact(
    @Path('id') String accountId,
    @Body() AddContactRequest request,
  );

  @GET(ApiConstants.accountContacts)
  Future<ContactsListResponse> getContacts(
    @Path('id') String accountId, {
    @Query('includeArchived') bool? includeArchived,
  });

  @GET(ApiConstants.accountContactById)
  Future<ContactResponse> getContactById(
    @Path('id') String accountId,
    @Path('contactId') String contactId,
  );

  @PATCH(ApiConstants.accountContactById)
  Future<ContactResponse> patchContact(
    @Path('id') String accountId,
    @Path('contactId') String contactId,
    @Body() PatchContactRequest request,
  );

  @DELETE(ApiConstants.accountContactById)
  Future<ContactResponse> archiveContact(
    @Path('id') String accountId,
    @Path('contactId') String contactId,
    @Body() ReasonRequest request,
  );

  @POST(ApiConstants.projectStakeholders)
  Future<StakeholderLinkResponse> addStakeholderLink(
    @Path('projectId') String projectId,
    @Body() AddStakeholderLinkRequest request,
  );

  @GET(ApiConstants.projectStakeholders)
  Future<StakeholderLinksListResponse> getStakeholderLinks(
    @Path('projectId') String projectId, {
    @Query('includeClosed') bool? includeClosed,
  });

  @PATCH(ApiConstants.projectStakeholderById)
  Future<StakeholderLinkResponse> patchStakeholderLink(
    @Path('projectId') String projectId,
    @Path('linkId') String linkId,
    @Body() PatchStakeholderLinkRequest request,
  );

  @DELETE(ApiConstants.projectStakeholderById)
  Future<StakeholderLinkResponse> closeStakeholderLink(
    @Path('projectId') String projectId,
    @Path('linkId') String linkId,
    @Body() CloseStakeholderLinkRequest request,
  );

  @POST(ApiConstants.projectStakeholderReplace)
  Future<StakeholderLinkResponse> replaceStakeholderLink(
    @Path('projectId') String projectId,
    @Path('linkId') String linkId,
    @Body() ReplaceStakeholderLinkRequest request,
  );

  @PUT(ApiConstants.projectDecisionMaker)
  Future<DecisionMakerResponse> setDecisionMaker(
    @Path('projectId') String projectId,
    @Body() SetDecisionMakerRequest request,
  );

  @GET(ApiConstants.projectDecisionMaker)
  Future<DecisionMakerResponse> getDecisionMaker(
    @Path('projectId') String projectId,
  );

  @DELETE(ApiConstants.projectDecisionMaker)
  Future<DecisionMakerResponse> removeDecisionMaker(
    @Path('projectId') String projectId,
    @Body() ReasonRequest request,
  );

  @GET(ApiConstants.projectDecisionMakerHistory)
  Future<DecisionMakerHistoryResponse> getDecisionMakerHistory(
    @Path('projectId') String projectId, {
    @Query('page') int? page,
    @Query('limit') int? limit,
  });
}
