import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Taskerpage Backend Group Code

class TaskerpageBackendGroup {
  static String baseUrl = 'https://taskerpage.com';
  static Map<String, String> headers = {};
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
  static TestAPICall testAPICall = TestAPICall();
  static GetUserCall getUserCall = GetUserCall();
  static UserProfileMeCall userProfileMeCall = UserProfileMeCall();
  static UserProfileBasicInfoCall userProfileBasicInfoCall =
      UserProfileBasicInfoCall();
  static ServiceCategoryListCall serviceCategoryListCall =
      ServiceCategoryListCall();
  static SyncUserServicesCall syncUserServicesCall = SyncUserServicesCall();
  static AddressCreateCall addressCreateCall = AddressCreateCall();
  static UploadCall uploadCall = UploadCall();
  static UserEducationAddCall userEducationAddCall = UserEducationAddCall();
  static MyEducationsCall myEducationsCall = MyEducationsCall();
  static MyAddressesCall myAddressesCall = MyAddressesCall();
  static GetServicesCall getServicesCall = GetServicesCall();
  static CreateUserServiceCall createUserServiceCall = CreateUserServiceCall();
  static EditUserServiceCall editUserServiceCall = EditUserServiceCall();
  static GetUserServiceByIdCall getUserServiceByIdCall =
      GetUserServiceByIdCall();
  static DeleteUserServiceByIdCall deleteUserServiceByIdCall =
      DeleteUserServiceByIdCall();
  static SetAddressMainCall setAddressMainCall = SetAddressMainCall();
  static DeleteAddressCall deleteAddressCall = DeleteAddressCall();
  static CustomerProfileSkillsListCall customerProfileSkillsListCall =
      CustomerProfileSkillsListCall();
  static ChangeMyRoleCall changeMyRoleCall = ChangeMyRoleCall();
  static ChangeProfileDeatelsCall changeProfileDeatelsCall =
      ChangeProfileDeatelsCall();
  static ChangeDescriptionAndProfileImageCall
      changeDescriptionAndProfileImageCall =
      ChangeDescriptionAndProfileImageCall();
  static MyPostsCall myPostsCall = MyPostsCall();
  static CreatePostCall createPostCall = CreatePostCall();
  static UpdatePostCall updatePostCall = UpdatePostCall();
  static InitiatePostCall initiatePostCall = InitiatePostCall();
  static SinglePostReadCall singlePostReadCall = SinglePostReadCall();
  static UserProfileListCall userProfileListCall = UserProfileListCall();
  static UserProfileReadCall userProfileReadCall = UserProfileReadCall();
  static CustomerTaskListCall customerTaskListCall = CustomerTaskListCall();
  static PostReadCall postReadCall = PostReadCall();
  static AppointmentListCall appointmentListCall = AppointmentListCall();
  static AppointmentListCopyCall appointmentListCopyCall =
      AppointmentListCopyCall();
  static AppointmentReadCall appointmentReadCall = AppointmentReadCall();
  static CreateAppointmentCall createAppointmentCall = CreateAppointmentCall();
  static UpdateAppointmentStatusCall updateAppointmentStatusCall =
      UpdateAppointmentStatusCall();
  static UpdateAppointmentCall updateAppointmentCall = UpdateAppointmentCall();
  static MyAppointmentCall myAppointmentCall = MyAppointmentCall();
  static MyBargainsCall myBargainsCall = MyBargainsCall();
  static ServiceCategoryCall serviceCategoryCall = ServiceCategoryCall();
  static MyBargainsPostCall myBargainsPostCall = MyBargainsPostCall();
  static ReviewCreateCall reviewCreateCall = ReviewCreateCall();
  static ReviewsAboutMeCall reviewsAboutMeCall = ReviewsAboutMeCall();
  static SendVerifacationCall sendVerifacationCall = SendVerifacationCall();
  static CheckVerficationCall checkVerficationCall = CheckVerficationCall();
  static UpdateUserProfileCall updateUserProfileCall = UpdateUserProfileCall();
  static StripeCall stripeCall = StripeCall();
  static GetUserServicesCall getUserServicesCall = GetUserServicesCall();
  static EducationPartialUpdateCall educationPartialUpdateCall =
      EducationPartialUpdateCall();
  static UpdateStatusPostCall updateStatusPostCall = UpdateStatusPostCall();
  static CreateBargainCall createBargainCall = CreateBargainCall();
  static GetServiceCategoryByIdCall getServiceCategoryByIdCall =
      GetServiceCategoryByIdCall();
  static UpdatePostCalendarDataCall updatePostCalendarDataCall =
      UpdatePostCalendarDataCall();
  static UpdatePostServiceCategoryCall updatePostServiceCategoryCall =
      UpdatePostServiceCategoryCall();
  static PostTaskUpdateCall postTaskUpdateCall = PostTaskUpdateCall();
  static TaskerAgeUpdateCall taskerAgeUpdateCall = TaskerAgeUpdateCall();
  static MaxDistanceUpdatePostCall maxDistanceUpdatePostCall =
      MaxDistanceUpdatePostCall();
  static UpdateAddressinPostCall updateAddressinPostCall =
      UpdateAddressinPostCall();
  static RandomAdsCall randomAdsCall = RandomAdsCall();
  static AllFielsTestCall allFielsTestCall = AllFielsTestCall();
  static UpdateAllFiekdsTestCall updateAllFiekdsTestCall =
      UpdateAllFiekdsTestCall();
  static CreateAllFiledsTestCall createAllFiledsTestCall =
      CreateAllFiledsTestCall();
  static GenerateKeysCall generateKeysCall = GenerateKeysCall();
  static UpdateProfileDeatelsCall updateProfileDeatelsCall =
      UpdateProfileDeatelsCall();
  static TaskCreationCall taskCreationCall = TaskCreationCall();
  static TaskCreationSkillCategoryCall taskCreationSkillCategoryCall =
      TaskCreationSkillCategoryCall();
  static SearchFilterPostsCall searchFilterPostsCall = SearchFilterPostsCall();
  static GetAddressDetailsCall getAddressDetailsCall = GetAddressDetailsCall();
  static GetSkillCategoryDetailsCall getSkillCategoryDetailsCall =
      GetSkillCategoryDetailsCall();
  static CustomerProfileListCall customerProfileListCall =
      CustomerProfileListCall();
  static CreateBidCall createBidCall = CreateBidCall();
  static BidListCall bidListCall = BidListCall();
  static CustomerProfileDetailsCall customerProfileDetailsCall =
      CustomerProfileDetailsCall();
  static MyBidCall myBidCall = MyBidCall();
  static ServiceDetailCall serviceDetailCall = ServiceDetailCall();
  static UpdateAppintmentStatusCall updateAppintmentStatusCall =
      UpdateAppintmentStatusCall();
  static ReviewReadByIdCall reviewReadByIdCall = ReviewReadByIdCall();
  static CheckVerificationCodeCall checkVerificationCodeCall =
      CheckVerificationCodeCall();
  static SendToVerificationCodeCall sendToVerificationCodeCall =
      SendToVerificationCodeCall();
  static UpdatePhoneVerificationCall updatePhoneVerificationCall =
      UpdatePhoneVerificationCall();
  static UpdateEmailVerivicationCall updateEmailVerivicationCall =
      UpdateEmailVerivicationCall();
  static CheckEmailVerificationCall checkEmailVerificationCall =
      CheckEmailVerificationCall();
  static MyReviewsCall myReviewsCall = MyReviewsCall();
  static PlanListCall planListCall = PlanListCall();
  static PlanReadCall planReadCall = PlanReadCall();
  static PayCall payCall = PayCall();
  static GetCustomerAdCall getCustomerAdCall = GetCustomerAdCall();
  static ChangeMainAddressCall changeMainAddressCall = ChangeMainAddressCall();
  static UpdateNameAndLastNameCall updateNameAndLastNameCall =
      UpdateNameAndLastNameCall();
  static UpdateEmailAddressCall updateEmailAddressCall =
      UpdateEmailAddressCall();
  static UpdatePasswordCall updatePasswordCall = UpdatePasswordCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static UpdateBannerCall updateBannerCall = UpdateBannerCall();
  static SkillDetailsCall skillDetailsCall = SkillDetailsCall();
  static UpdateSkillCategoryInTaskCall updateSkillCategoryInTaskCall =
      UpdateSkillCategoryInTaskCall();
  static UpdateTaskDetailsCall updateTaskDetailsCall = UpdateTaskDetailsCall();
  static UpdateTaskOptionsCall updateTaskOptionsCall = UpdateTaskOptionsCall();
  static UpdateTaskAddressCall updateTaskAddressCall = UpdateTaskAddressCall();
  static UpdateTaskScheduleCall updateTaskScheduleCall =
      UpdateTaskScheduleCall();
  static UpdateTaskerTypeCall updateTaskerTypeCall = UpdateTaskerTypeCall();
  static UpdateTaskerTypeTwoCall updateTaskerTypeTwoCall =
      UpdateTaskerTypeTwoCall();
  static UpdateTaskerTypeThreeCall updateTaskerTypeThreeCall =
      UpdateTaskerTypeThreeCall();
  static InitSubCall initSubCall = InitSubCall();
  static GetSubscriptionUpdateCall getSubscriptionUpdateCall =
      GetSubscriptionUpdateCall();
  static AplyCoponCall aplyCoponCall = AplyCoponCall();
  static GetPaymentUrlCall getPaymentUrlCall = GetPaymentUrlCall();
  static UpdateSubscriptionCall updateSubscriptionCall =
      UpdateSubscriptionCall();
  static PaymentsHistoryCall paymentsHistoryCall = PaymentsHistoryCall();
  static DeatelsPaymentsHistoryReadCall deatelsPaymentsHistoryReadCall =
      DeatelsPaymentsHistoryReadCall();
  static LanguagesListCall languagesListCall = LanguagesListCall();
  static CountryListCall countryListCall = CountryListCall();
  static GetSubscriptionDetalsCall getSubscriptionDetalsCall =
      GetSubscriptionDetalsCall();
  static IssueListCall issueListCall = IssueListCall();
  static NotificationLogCall notificationLogCall = NotificationLogCall();
  static NotificationReadCall notificationReadCall = NotificationReadCall();
  static EducationDeletCall educationDeletCall = EducationDeletCall();
  static SkillDeletCall skillDeletCall = SkillDeletCall();
  static UpdateIdentificationCall updateIdentificationCall =
      UpdateIdentificationCall();
  static ChatListCall chatListCall = ChatListCall();
  static ChatRoomMessagesCall chatRoomMessagesCall = ChatRoomMessagesCall();
  static ChatsRoomCopyCall chatsRoomCopyCall = ChatsRoomCopyCall();
  static MarkAsReadCall markAsReadCall = MarkAsReadCall();
  static SendMessageCall sendMessageCall = SendMessageCall();
  static CreateChatCall createChatCall = CreateChatCall();
  static CreateChatTestCall createChatTestCall = CreateChatTestCall();
  static GetMyTasksCall getMyTasksCall = GetMyTasksCall();
  static JoinTaskCall joinTaskCall = JoinTaskCall();
  static GetMyTasksGroupByCall getMyTasksGroupByCall = GetMyTasksGroupByCall();
  static ReadByEmailCall readByEmailCall = ReadByEmailCall();
  static UpdateTasksTimeCall updateTasksTimeCall = UpdateTasksTimeCall();
  static FollowReqCall followReqCall = FollowReqCall();
  static AnswerToFollowReqCall answerToFollowReqCall = AnswerToFollowReqCall();
  static GetAppRolesCall getAppRolesCall = GetAppRolesCall();
  static UpdateUserRoleCall updateUserRoleCall = UpdateUserRoleCall();
  static ReadAppRoleCall readAppRoleCall = ReadAppRoleCall();
  static ConnectionListCall connectionListCall = ConnectionListCall();
  static UpdateTaskRateCall updateTaskRateCall = UpdateTaskRateCall();
  static UpdateCustomerProfileCall updateCustomerProfileCall =
      UpdateCustomerProfileCall();
  static SetUserPasswordCall setUserPasswordCall = SetUserPasswordCall();
  static GetMySkillCategoriesCall getMySkillCategoriesCall =
      GetMySkillCategoriesCall();
  static SyncSkillCategoriesCall syncSkillCategoriesCall =
      SyncSkillCategoriesCall();
  static UpdateSkillsCall updateSkillsCall = UpdateSkillsCall();
  static DeleteSkillsCall deleteSkillsCall = DeleteSkillsCall();
  static UpdateCustomerProfileSkillLevelCall
      updateCustomerProfileSkillLevelCall =
      UpdateCustomerProfileSkillLevelCall();
  static GetCustomerProfileSkillsDetailsCall
      getCustomerProfileSkillsDetailsCall =
      GetCustomerProfileSkillsDetailsCall();
  static UpdateIdentificationDetailsCall updateIdentificationDetailsCall =
      UpdateIdentificationDetailsCall();
  static CreateIdentificationCall createIdentificationCall =
      CreateIdentificationCall();
  static GetIdentificationDetailsCall getIdentificationDetailsCall =
      GetIdentificationDetailsCall();
  static ListUserIdentificationCall listUserIdentificationCall =
      ListUserIdentificationCall();
  static GetUserRateDetailsCall getUserRateDetailsCall =
      GetUserRateDetailsCall();
  static CreateUserRateCall createUserRateCall = CreateUserRateCall();
  static UpdateUserRateCall updateUserRateCall = UpdateUserRateCall();
  static UpdateRoleCall updateRoleCall = UpdateRoleCall();
  static GetUserRateListCall getUserRateListCall = GetUserRateListCall();
  static UserBadgesCall userBadgesCall = UserBadgesCall();
  static GetChatRoomDetailsCall getChatRoomDetailsCall =
      GetChatRoomDetailsCall();
  static GetPossibleTransitionsCall getPossibleTransitionsCall =
      GetPossibleTransitionsCall();
  static ProcessActionCall processActionCall = ProcessActionCall();
  static UpdateCustomerProfileBadgesCall updateCustomerProfileBadgesCall =
      UpdateCustomerProfileBadgesCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
    String? username = '',
    String? newPassword = '',
    String? roleProfileName = 'End User',
    int? sendWelcomeEmail = 0,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "first_name": "${firstName}",
  "username": "${username}",
  "role_profile_name": "${roleProfileName}",
  "send_welcome_email": ${sendWelcomeEmail}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic password(dynamic response) => getJsonField(
        response,
        r'''$.password''',
      );
  dynamic isSupserUser(dynamic response) => getJsonField(
        response,
        r'''$.is_superuser''',
      );
  dynamic username(dynamic response) => getJsonField(
        response,
        r'''$.username''',
      );
  dynamic isStaff(dynamic response) => getJsonField(
        response,
        r'''$.is_staff''',
      );
  dynamic isActive(dynamic response) => getJsonField(
        response,
        r'''$.is_active''',
      );
  dynamic dateJoined(dynamic response) => getJsonField(
        response,
        r'''$.date_joined''',
      );
  dynamic groups(dynamic response) => getJsonField(
        response,
        r'''$.groups''',
        true,
      );
  dynamic userPermissions(dynamic response) => getJsonField(
        response,
        r'''$.user_permissions''',
        true,
      );
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    int? useJwt = 1,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "usr": "${username}",
  "pwd": "${password}",
  "use_jwt": ${useJwt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic refreshKey(dynamic response) => getJsonField(
        response,
        r'''$.refresh''',
      );
  dynamic apiKey(dynamic response) => getJsonField(
        response,
        r'''$.access''',
      );
}

class TestAPICall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "<email>",
  "first_name": "<first_name>",
  "username": "<user_name>",
  "new_password": "<new_password>"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'test API',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic refreshKey(dynamic response) => getJsonField(
        response,
        r'''$.refresh''',
      );
  dynamic apiKey(dynamic response) => getJsonField(
        response,
        r'''$.access''',
      );
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User/${username}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic refreshKey(dynamic response) => getJsonField(
        response,
        r'''$.refresh''',
      );
  dynamic apiKey(dynamic response) => getJsonField(
        response,
        r'''$.data.api_key''',
      );
}

class UserProfileMeCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileMe',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/customer_profile_me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic userServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services''',
        true,
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
  dynamic relatedUserId(dynamic response) => getJsonField(
        response,
        r'''$.related_user.id''',
      );
  dynamic relatedUserPassword(dynamic response) => getJsonField(
        response,
        r'''$.related_user.password''',
      );
  dynamic relatedUserLogin(dynamic response) => getJsonField(
        response,
        r'''$.related_user.last_login''',
      );
  dynamic relatedUserIsSuperUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_superuser''',
      );
  dynamic relatedUserUserName(dynamic response) => getJsonField(
        response,
        r'''$.related_user.username''',
      );
  dynamic relatedUserIsStaff(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_staff''',
      );
  dynamic relatedUserIsActive(dynamic response) => getJsonField(
        response,
        r'''$.related_user.is_active''',
      );
  dynamic relatedUserEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$.related_user.email''',
      );
  dynamic relatedUserDateJoined(dynamic response) => getJsonField(
        response,
        r'''$.related_user.date_joined''',
      );
  dynamic relatedUserGroups(dynamic response) => getJsonField(
        response,
        r'''$.related_user.groups''',
        true,
      );
  dynamic relatedUserUserpermissions(dynamic response) => getJsonField(
        response,
        r'''$.related_user.user_permissions''',
        true,
      );
  dynamic userProfileEducation(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_educations''',
        true,
      );
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic addresses(dynamic response) => getJsonField(
        response,
        r'''$.addresses''',
        true,
      );
  dynamic reviews(dynamic response) => getJsonField(
        response,
        r'''$.reviews''',
        true,
      );
  dynamic myReviews(dynamic response) => getJsonField(
        response,
        r'''$.my_reviews''',
        true,
      );
  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      );
  dynamic myBargains(dynamic response) => getJsonField(
        response,
        r'''$.my_bargains''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic myAppointments(dynamic response) => getJsonField(
        response,
        r'''$.my_appointments''',
        true,
      );
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userProfileVisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic userTitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userRole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverLicnese(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasInsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.related_user.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.related_user.last_name''',
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$.review_average''',
      );
  dynamic avatar(dynamic response) => getJsonField(
        response,
        r'''$.avatar''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic selectedServicesCategory(dynamic response) => getJsonField(
        response,
        r'''$.user_services[:].service_category.id''',
        true,
      );
  dynamic selectedServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services[:].service.id''',
        true,
      );
  dynamic customerSkills(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_skills''',
        true,
      );
}

class UserProfileBasicInfoCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? accountType = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? dateOfBirth = '',
    String? id = '',
    String? companyName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "account_type": "${accountType}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "company_name": "${companyName}",
  "phone_number": "${phoneNumber}",
  "date_of_birth": "${dateOfBirth}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileBasicInfo',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ServiceCategoryListCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'serviceCategoryList',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Skill Category',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic serviceCategoryList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class SyncUserServicesCall {
  Future<ApiCallResponse> call({
    dynamic? userServicesListJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final userServicesList = _serializeJson(userServicesListJson);
    final ffApiRequestBody = '''
${userServicesList}''';
    return ApiManager.instance.makeApiCall(
      callName: 'syncUserServices',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/user-service-bulk-sync/sync_services/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddressCreateCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? city = '',
    String? country = '',
    String? postalCode = '',
    String? state = '',
    String? streetAddress = '',
    String? aptNo = '',
    String? latitude = '',
    String? longitude = '',
    int? isMainAddress = 0,
    String? customerProfile = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "address": "${address}",
  "city": "${city}",
  "country": "${country}",
  "postal_code": "${postalCode}",
  "state": "${state}",
  "street_address": "${streetAddress}",
  "apt_no": "${aptNo}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "is_main_address": ${isMainAddress},
  "customer_profile": ${customerProfile}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addressCreate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.city''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.country''',
      );
  dynamic postalcode(dynamic response) => getJsonField(
        response,
        r'''$.postal_code''',
      );
  dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
  dynamic streetaddress(dynamic response) => getJsonField(
        response,
        r'''$.street_address''',
      );
  dynamic aptno(dynamic response) => getJsonField(
        response,
        r'''$.apt_no''',
      );
  dynamic locationlat(dynamic response) => getJsonField(
        response,
        r'''$.location_lat''',
      );
  dynamic locationlng(dynamic response) => getJsonField(
        response,
        r'''$.location_lng''',
      );
  dynamic mainAddress(dynamic response) => getJsonField(
        response,
        r'''$.is_main_address''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class UploadCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? doctype = '',
    String? docname = '',
    String? folder = 'Home/Attachments',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'upload',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/upload_file',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'file': file,
        'file_name': "hi",
        'doctype': doctype,
        'docname': docname,
        'folder': folder,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic fileUrl(dynamic response) => getJsonField(
        response,
        r'''$.message.file_url''',
      );
}

class UserEducationAddCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? educationType = '',
    String? schoolTitle = '',
    String? certificate = '',
    String? customerProfile = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "education_type": "${educationType}",
  "school_title": "${schoolTitle}",
  "certificate": "${certificate}",
  "customer_profile": "${customerProfile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userEducationAdd',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Education',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic educationLevel(dynamic response) => getJsonField(
        response,
        r'''$.education_level''',
      );
  dynamic schoolTitle(dynamic response) => getJsonField(
        response,
        r'''$.school_title''',
      );
  dynamic certificateURL(dynamic response) => getJsonField(
        response,
        r'''$.certificate_url''',
      );
  dynamic relatedUserProfile(dynamic response) => getJsonField(
        response,
        r'''$.related_user_profile''',
      );
}

class MyEducationsCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myEducations',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Education',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MyAddressesCall {
  Future<ApiCallResponse> call({
    String? fields = '',
    String? filters = '',
    String? orderBy = 'is_main_address desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myAddresses',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'fields': fields,
        'filters': filters,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic myAddressList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetServicesCall {
  Future<ApiCallResponse> call({
    String? category = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getServices',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Skill?filters=${category}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic servicesList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class CreateUserServiceCall {
  Future<ApiCallResponse> call({
    String? serviceCategory = '',
    String? service = '',
    String? userProfile = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "skill_category_name": "${serviceCategory}",
  "skill_name": "${service}",
  "customer_profile": "${userProfile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserService',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic nameID(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class EditUserServiceCall {
  Future<ApiCallResponse> call({
    String? serviceSkillLevel = '',
    String? id = '',
    dynamic? skillOptionsJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final skillOptions = _serializeJson(skillOptionsJson, true);
    final ffApiRequestBody = '''
{
  "skill_level": "${serviceSkillLevel}",
  "customer_skill_options": ${skillOptions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editUserService',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic createAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class GetUserServiceByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserServiceById',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic serviceOptions(dynamic response) => getJsonField(
        response,
        r'''$.service_options''',
        true,
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class DeleteUserServiceByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUserServiceById',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.service_category''',
      );
  dynamic service(dynamic response) => getJsonField(
        response,
        r'''$.service''',
      );
  dynamic serviceSkillLevel(dynamic response) => getJsonField(
        response,
        r'''$.service_skill_level''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic serviceOptions(dynamic response) => getJsonField(
        response,
        r'''$.service_options''',
        true,
      );
  dynamic userProfile(dynamic response) => getJsonField(
        response,
        r'''$.user_profile''',
      );
}

class SetAddressMainCall {
  Future<ApiCallResponse> call({
    String? id = '',
    bool? isMainAddress,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"is_main_address":${isMainAddress}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setAddressMain',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic errors(dynamic response) => getJsonField(
        response,
        r'''$.errors''',
        true,
      );
}

class DeleteAddressCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAddress',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CustomerProfileSkillsListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Profile Skills List',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic myServices(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic myServicesIds(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  dynamic myServicesSkils(dynamic response) => getJsonField(
        response,
        r'''$.data[:].skill_name''',
        true,
      );
  dynamic myServicesCategories(dynamic response) => getJsonField(
        response,
        r'''$.data[:].skill_category_name''',
        true,
      );
  dynamic customerProfileList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].customer_profile''',
        true,
      );
}

class ChangeMyRoleCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userRole = '',
    String? roleProfileName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "role": "${userRole}",
  "role_profile_name": "${roleProfileName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeMyRole',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userProfileVisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic userTitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userRole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverlicense(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasInsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class ChangeProfileDeatelsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    bool? hasInsurance,
    int? yearsOfExperience,
    String? driverLicense = '',
    List<String>? userLanguagesList,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final userLanguages = _serializeList(userLanguagesList);

    final ffApiRequestBody = '''
{
  "user_languages": 
    ${userLanguages}
  ,
  "driver_license": "${driverLicense}",
  "years_of_experience": ${yearsOfExperience},
  "has_insurance": ${hasInsurance}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeProfileDeatels',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userProfileVisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic userTitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userRole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverlicense(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasInsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class ChangeDescriptionAndProfileImageCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? description = '',
    String? avatar = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "description": "${description}",
  "avatar_url": "${avatar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeDescriptionAndProfileImage',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/user-profile/${id}/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userLanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userProfileVisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic userTitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userRole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverlicense(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasInsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic relatedUser(dynamic response) => getJsonField(
        response,
        r'''$.related_user''',
      );
}

class MyPostsCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myPosts',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreatePostCall {
  Future<ApiCallResponse> call({
    List<String>? taskerLanguagesList,
    String? description = '',
    int? radiusOfWork,
    bool? isVerified,
    String? postOpenCloseStatus = '',
    String? skillLevel = '',
    String? startDate = '',
    String? startTime = '',
    String? customStartTime = '',
    String? endDatetime = '',
    bool? isPeriodic,
    int? numSessions,
    String? sessionDuration = '',
    bool? repeatDate,
    String? repeatType = '',
    String? repeatEvery = '',
    String? preferredDays = '',
    String? monthlyRepeatType = '',
    String? endDateType = '',
    int? session,
    int? poster,
    int? address,
    int? postStatus,
    int? relatedService,
    int? relatedServiceCategory,
    int? taskerAge,
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    bool? travelCosts,
    String? payPerHour = '',
    bool? cancellationPenalty,
    String? payCancellationPerHour = '',
    String? cancellationBeforeAppointment = '',
    int? daysOfWeek,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final taskerLanguages = _serializeList(taskerLanguagesList);

    final ffApiRequestBody = '''
{
  "tasker_languages": [
    ${taskerLanguages}
  ],
  "description": "${description}",
  "radius_of_work": ${radiusOfWork},
  "is_verified": ${isVerified},
  "post_open_close_status": "${postOpenCloseStatus}",
  "skill_level": "${skillLevel}",
  "start_date": "${startDate}",
  "start_time": "${startTime}",
  "custom_start_time": "${customStartTime}",
  "end_datetime": "${endDatetime}",
  "is_periodic": ${isPeriodic},
  "days_of_week": ${daysOfWeek},
  "num_sessions": ${numSessions},
  "session_duration": "${sessionDuration}",
  "repeat_date": ${repeatDate},
  "repeat_type": "${repeatType}",
  "repeat_every": "${repeatEvery}",
  "preferred_days": "${preferredDays}",
  "monthly_repeat_type": "${monthlyRepeatType}",
  "end_date_type": "${endDateType}",
  "session": ${session},
  "tasker_age": ${taskerAge},
  "identified": ${identified},
  "years_of_experience": ${yearsOfExperience},
  "insurance": ${insurance},
  "driver_license": "${driverLicense}",
  "travel_costs": ${travelCosts},
  "pay_per_hour": "${payPerHour}",
  "cancellation_penalty": ${cancellationPenalty},
  "pay_cancellation_per_hour": "${payCancellationPerHour}",
  "cancellation_before_appointment": "${cancellationBeforeAppointment}",
  "poster": ${poster},
  "address": ${address},
  "post_status": ${postStatus},
  "related_service": ${relatedService},
  "related_service_category": ${relatedServiceCategory}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class UpdatePostCall {
  Future<ApiCallResponse> call({
    List<String>? taskerLanguagesList,
    String? description = '',
    int? radiusOfWork,
    bool? isVerified,
    String? postOpenCloseStatus = '',
    List<String>? skillLevelList,
    String? startDate = '',
    String? startTime = '',
    String? customStartTime = '',
    String? endDatetime = '',
    bool? isPeriodic,
    int? numSessions,
    String? sessionDuration = '',
    bool? repeatDate,
    String? repeatType = '',
    String? repeatEvery = '',
    String? preferredDays = '',
    String? monthlyRepeatType = '',
    String? endDateType = '',
    int? session,
    int? poster,
    int? address,
    int? postStatus,
    int? relatedService,
    int? relatedServiceCategory,
    String? id = '',
    String? taskerAge = '',
    bool? identified,
    String? taskerGender = '',
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    bool? travelCosts,
    String? payPerHour = '',
    bool? cancellationPenalty,
    String? payCancellationPerHour = '',
    String? cancellationBeforeAppointment = '',
    List<String>? daysOfWeekList,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final taskerLanguages = _serializeList(taskerLanguagesList);
    final skillLevel = _serializeList(skillLevelList);
    final daysOfWeek = _serializeList(daysOfWeekList);

    final ffApiRequestBody = '''
{
  "tasker_languages": ${taskerLanguages},
  "description": "${description}",
  "radius_of_work": ${radiusOfWork},
  "is_verified": ${isVerified},
  "post_open_close_status": "${postOpenCloseStatus}",
  "skill_level": ${skillLevel},
  "start_date": "${startDate}",
  "start_time": "${startTime}",
  "custom_start_time": "${customStartTime}",
  "end_datetime": "${endDatetime}",
  "is_periodic": ${isPeriodic},
  "num_sessions": ${numSessions},
  "session_duration": "${sessionDuration}",
  "repeat_date": "${repeatDate}",
  "repeat_type": "${repeatType}",
  "repeat_every": "${repeatEvery}",
  "days_of_week": ${daysOfWeek},
  "monthly_repeat_type": "${monthlyRepeatType}",
  "end_date_type": "${endDateType}",
  "session": ${session},
  "poster": ${poster},
  "address": ${address},
  "post_status": ${postStatus},
  "related_service": ${relatedService},
  "related_service_category": ${relatedServiceCategory},
  "tasker_age": "${taskerAge}",
  "identified": ${identified},
  "tasker_gender": "${taskerGender}",
  "years_of_experience": ${yearsOfExperience},
  "insurance": ${insurance},
  "driver_license": "${driverLicense}",
  "travel_costs": ${travelCosts},
  "pay_per_hour": "${payPerHour}",
  "cancellation_penalty": ${cancellationPenalty},
  "pay_cancellation_per_hour": "${payCancellationPerHour}",
  "cancellation_before_appointment": "${cancellationBeforeAppointment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatePost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class InitiatePostCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'initiatePost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseState(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargianCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStatTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeatEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class SinglePostReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'singlePostRead',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic taskerLangauges(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic radiusOfWork(dynamic response) => getJsonField(
        response,
        r'''$.radius_of_work''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postOpenCloseStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skillLevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
      );
  dynamic appointmentCount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargainCount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic startTime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic customStartTime(dynamic response) => getJsonField(
        response,
        r'''$.custom_start_time''',
      );
  dynamic endDateTime(dynamic response) => getJsonField(
        response,
        r'''$.end_datetime''',
      );
  dynamic isPeriodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic numSessions(dynamic response) => getJsonField(
        response,
        r'''$.num_sessions''',
      );
  dynamic sessionDuration(dynamic response) => getJsonField(
        response,
        r'''$.session_duration''',
      );
  dynamic repeatDate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic repeatType(dynamic response) => getJsonField(
        response,
        r'''$.repeat_type''',
      );
  dynamic repeaetEvery(dynamic response) => getJsonField(
        response,
        r'''$.repeat_every''',
      );
  dynamic preferredDays(dynamic response) => getJsonField(
        response,
        r'''$.preferred_days''',
      );
  dynamic monthlyRepeatType(dynamic response) => getJsonField(
        response,
        r'''$.monthly_repeat_type''',
      );
  dynamic endDateType(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  dynamic postStatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic relatedService(dynamic response) => getJsonField(
        response,
        r'''$.related_service''',
      );
  dynamic relatedServiceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
}

class UserProfileListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileList',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserProfileReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userProfileRead',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic appointment(dynamic response) => getJsonField(
        response,
        r'''$.my_appointments''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic userprofilevisibility(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_visibility''',
      );
  dynamic usertitle(dynamic response) => getJsonField(
        response,
        r'''$.user_title''',
      );
  dynamic userrole(dynamic response) => getJsonField(
        response,
        r'''$.user_role''',
      );
  dynamic driverlicense(dynamic response) => getJsonField(
        response,
        r'''$.driver_license''',
      );
  dynamic userCountry(dynamic response) => getJsonField(
        response,
        r'''$.user_country''',
      );
  dynamic isSubscribed(dynamic response) => getJsonField(
        response,
        r'''$.is_subscribed''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic hasinsurance(dynamic response) => getJsonField(
        response,
        r'''$.has_insurance''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account_type''',
      );
  dynamic userServices(dynamic response) => getJsonField(
        response,
        r'''$.user_services''',
        true,
      );
  dynamic userProfileEducations(dynamic response) => getJsonField(
        response,
        r'''$.user_profile_educations''',
        true,
      );
  dynamic relateduseruserpermissions(dynamic response) => getJsonField(
        response,
        r'''$.related_user.user_permissions''',
        true,
      );
  dynamic userlanguages(dynamic response) => getJsonField(
        response,
        r'''$.user_languages''',
        true,
      );
  dynamic addresses(dynamic response) => getJsonField(
        response,
        r'''$.addresses''',
        true,
      );
  dynamic reviews(dynamic response) => getJsonField(
        response,
        r'''$.reviews''',
        true,
      );
  dynamic myreviews(dynamic response) => getJsonField(
        response,
        r'''$.my_reviews''',
        true,
      );
  dynamic posts(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      );
  dynamic myBargains(dynamic response) => getJsonField(
        response,
        r'''$.my_bargains''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.last_name''',
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$.review_average''',
      );
  dynamic post(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      );
  dynamic myReviews(dynamic response) => getJsonField(
        response,
        r'''$.my_reviews''',
        true,
      );
  dynamic avatar(dynamic response) => getJsonField(
        response,
        r'''$.avatar''',
      );
  dynamic customerSkills(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_skills''',
        true,
      );
}

class CustomerTaskListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Task List',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postRead',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.poster''',
      );
  dynamic posterid(dynamic response) => getJsonField(
        response,
        r'''$.poster.id''',
      );
  dynamic postercreatedat(dynamic response) => getJsonField(
        response,
        r'''$.poster.created_at''',
      );
  dynamic postermodifiedat(dynamic response) => getJsonField(
        response,
        r'''$.poster.modified_at''',
      );
  dynamic posteruserprofilevisibility(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_profile_visibility''',
      );
  dynamic posterusertitle(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_title''',
      );
  dynamic posteruserrole(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_role''',
      );
  dynamic posterdriverlicense(dynamic response) => getJsonField(
        response,
        r'''$.poster.driver_license''',
      );
  dynamic posteruserlanguages(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_languages''',
        true,
      );
  dynamic posterusercountry(dynamic response) => getJsonField(
        response,
        r'''$.poster.user_country''',
      );
  dynamic posterissubscribed(dynamic response) => getJsonField(
        response,
        r'''$.poster.is_subscribed''',
      );
  dynamic posterisverified(dynamic response) => getJsonField(
        response,
        r'''$.poster.is_verified''',
      );
  dynamic posterhasinsurance(dynamic response) => getJsonField(
        response,
        r'''$.poster.has_insurance''',
      );
  dynamic posterreviewcount(dynamic response) => getJsonField(
        response,
        r'''$.poster.review_count''',
      );
  dynamic posteraccounttype(dynamic response) => getJsonField(
        response,
        r'''$.poster.account_type''',
      );
  dynamic taskerlanguages(dynamic response) => getJsonField(
        response,
        r'''$.tasker_languages''',
        true,
      );
  dynamic bargains(dynamic response) => getJsonField(
        response,
        r'''$.bargains''',
        true,
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic isverified(dynamic response) => getJsonField(
        response,
        r'''$.is_verified''',
      );
  dynamic postopenclosestatus(dynamic response) => getJsonField(
        response,
        r'''$.post_open_close_status''',
      );
  dynamic skilllevel(dynamic response) => getJsonField(
        response,
        r'''$.skill_level''',
        true,
      );
  dynamic appointmentcount(dynamic response) => getJsonField(
        response,
        r'''$.appointment_count''',
      );
  dynamic bargaincount(dynamic response) => getJsonField(
        response,
        r'''$.bargain_count''',
      );
  dynamic reviewcount(dynamic response) => getJsonField(
        response,
        r'''$.review_count''',
      );
  dynamic starttime(dynamic response) => getJsonField(
        response,
        r'''$.start_time''',
      );
  dynamic isperiodic(dynamic response) => getJsonField(
        response,
        r'''$.is_periodic''',
      );
  dynamic repeatdate(dynamic response) => getJsonField(
        response,
        r'''$.repeat_date''',
      );
  dynamic enddatetype(dynamic response) => getJsonField(
        response,
        r'''$.end_date_type''',
      );
  dynamic session(dynamic response) => getJsonField(
        response,
        r'''$.session''',
      );
  dynamic identified(dynamic response) => getJsonField(
        response,
        r'''$.identified''',
      );
  dynamic insurance(dynamic response) => getJsonField(
        response,
        r'''$.insurance''',
      );
  dynamic travelcosts(dynamic response) => getJsonField(
        response,
        r'''$.travel_costs''',
      );
  dynamic cancellationpenalty(dynamic response) => getJsonField(
        response,
        r'''$.cancellation_penalty''',
      );
  dynamic poststatus(dynamic response) => getJsonField(
        response,
        r'''$.post_status''',
      );
  dynamic serviceCategory(dynamic response) => getJsonField(
        response,
        r'''$.related_service_category''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.address.city''',
      );
  dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.poster.first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.poster.last_name''',
      );
}

class AppointmentListCall {
  Future<ApiCallResponse> call({
    String? filters = '[]',
    String? fields = '[\"name\"]',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'appointmentList',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$[:].modified_at''',
      );
  dynamic appointmentstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_status''',
      );
  dynamic appointmenttime(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_time''',
      );
  dynamic appointmenttype(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_type''',
      );
  dynamic appointmentgoal(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_goal''',
      );
  dynamic appointmentlocationlat(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lat''',
      );
  dynamic appointmentlocationlng(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lng''',
      );
  dynamic reviewcount(dynamic response) => getJsonField(
        response,
        r'''$[:].review_count''',
      );
  dynamic interviewee(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee''',
      );
  dynamic interviewer(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewer''',
      );
  dynamic relatedpost(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post''',
      );
}

class AppointmentListCopyCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'appointmentList Copy',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authroization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  dynamic modifiedat(dynamic response) => getJsonField(
        response,
        r'''$[:].modified_at''',
      );
  dynamic appointmentstatus(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_status''',
      );
  dynamic appointmenttime(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_time''',
      );
  dynamic appointmenttype(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_type''',
      );
  dynamic appointmentgoal(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_goal''',
      );
  dynamic appointmentlocationlat(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lat''',
      );
  dynamic appointmentlocationlng(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lng''',
      );
  dynamic reviewcount(dynamic response) => getJsonField(
        response,
        r'''$[:].review_count''',
      );
  dynamic interviewee(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee''',
      );
  dynamic interviewer(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewer''',
      );
  dynamic relatedpost(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post''',
      );
}

class AppointmentReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'appointmentRead',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateAppointmentCall {
  Future<ApiCallResponse> call({
    String? appointmentType = '',
    String? meetingLink = '',
    String? appointmentLocationLat = '',
    String? appointmentLocationLng = '',
    String? isTaskerAccepted = '',
    String? isPosterAccepted = '',
    String? appointmentTime = '',
    String? tasker = '',
    String? poster = '',
    String? post = '',
    String? appointmentEndTime = '',
    String? appointmentStartTime = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "appointment_type": "${appointmentType}",
  "meeting_link": "${meetingLink}",
  "appointment_location_lat": "${appointmentLocationLat}",
  "appointment_location_lng": "${appointmentLocationLng}",
  "is_tasker_accepted": "${isTaskerAccepted}",
  "is_poster_accepted": "${isPosterAccepted}",
  "appointment_time": "${appointmentTime}",
  "tasker": "${tasker}",
  "poster": "${poster}",
  "post": "${post}",
  "appointment_start_time": "${appointmentStartTime}",
  "appointment_end_time": "${appointmentEndTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create appointment',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateAppointmentStatusCall {
  Future<ApiCallResponse> call({
    String? name = '',
    dynamic? bodyJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
${body}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateAppointmentStatus',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateAppointmentCall {
  Future<ApiCallResponse> call({
    int? name,
    int? isPosterAccepted,
    int? isTaskerAccepted,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"is_tasker_accepted":"${isTaskerAccepted}",
"is_poster_accepted":"${isPosterAccepted}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update appointment',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MyAppointmentCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'My appointment',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic posterName(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.first_name''',
      );
  dynamic posterFamily(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.last_name''',
      );
  dynamic relatedPost(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post''',
        true,
      );
  dynamic relatedPostId(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.id''',
      );
  dynamic relatedpostposterrelateduser(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user''',
      );
  dynamic relatedpostposterrelateduserissuperuser(dynamic response) =>
      getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.is_superuser''',
      );
  dynamic relatedpostposterrelateduserusername(dynamic response) =>
      getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.username''',
      );
  dynamic posterEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].related_post.poster.related_user.email''',
      );
  dynamic crateAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$[:].modified_at''',
        true,
      );
  dynamic appointmentStatus(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_status''',
        true,
      );
  dynamic appointmentTime(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_time''',
        true,
      );
  dynamic appointmentType(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_type''',
        true,
      );
  dynamic appointmentGoal(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_goal''',
        true,
      );
  dynamic appointmentMeta(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_meta''',
        true,
      );
  dynamic meetinglink(dynamic response) => getJsonField(
        response,
        r'''$[:].meeting_link''',
        true,
      );
  dynamic appointmentLat(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lat''',
        true,
      );
  dynamic appointmentLng(dynamic response) => getJsonField(
        response,
        r'''$[:].appointment_location_lng''',
        true,
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$[:].review_count''',
        true,
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$[:].review_average''',
        true,
      );
  dynamic interVieweeName(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.first_name''',
        true,
      );
  dynamic interVieweeFamily(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.last_name''',
        true,
      );
  dynamic interVieweeEmailAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].interviewee.related_user.email''',
        true,
      );
}

class MyBargainsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'my bargains',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/bargain/my_bargains/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ServiceCategoryCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'serviceCategory',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/service-category/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic icon(dynamic response) => getJsonField(
        response,
        r'''$[:].icon_url''',
        true,
      );
}

class MyBargainsPostCall {
  Future<ApiCallResponse> call({
    int? bargainee,
    int? bargainer,
    int? postId,
    int? appointmentId,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'My bargains post',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/bargain/my_bargains/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'bargainee': bargainee,
        'bargainer': bargainer,
        'post_id': postId,
        'appointment_id': appointmentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic postId(dynamic response) => getJsonField(
        response,
        r'''$[:].post_id''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic bargainer(dynamic response) => getJsonField(
        response,
        r'''$[:].bargainer''',
      );
  dynamic bargainee(dynamic response) => getJsonField(
        response,
        r'''$[:].bargainee''',
      );
}

class ReviewCreateCall {
  Future<ApiCallResponse> call({
    String? reviewedOn = '',
    String? appointment = '',
    String? reviewedBy = '',
    double? reviewRate,
    String? comment = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "reviewed_on": "${reviewedOn}",
  "appointment": "${appointment}",
  "reviewed_by": "${reviewedBy}",
  "review_rate": "${reviewRate}",
  "comment":"${comment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Review Create',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Review',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReviewsAboutMeCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Reviews about me',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/user-profile/reviews_about_me/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendVerifacationCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "${to}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendVerifacation',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/verfiy/send/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckVerficationCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? code = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "${to}",
  "code": "${code}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkVerfication',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/verify/check/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateUserProfileCall {
  Future<ApiCallResponse> call({
    int? id,
    String? userTitle = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? dateOfBirth = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "user_title": "${userTitle}",
  "date_of_birth": "${dateOfBirth}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update user profile',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/customer profie',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StripeCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? image = '',
    int? price,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "string",
  "image": "string",
  "price": 0,
  "success_url": "string",
  "cancel_url": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stripe',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/stripe/create_checkout_session/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserServicesCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user services',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills?filters=${filter}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EducationPartialUpdateCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? schoolTitle = '',
    String? title = '',
    String? certificateUrl = '',
    String? educationLevel = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "school_title": "${schoolTitle}",
  "certificate": "${certificateUrl}",
  "education_type": "${educationLevel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'educationPartialUpdate',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Education/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateStatusPostCall {
  Future<ApiCallResponse> call({
    int? draft,
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "docstatus": ${draft}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStatusPost',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateBargainCall {
  Future<ApiCallResponse> call({
    int? price,
    int? bargainee,
    int? bargainer,
    int? postId,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "price": ${price},
  "bargainee": ${bargainee},
  "bargainer": ${bargainer},
  "post_id": ${postId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateBargain',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/bargain/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetServiceCategoryByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getServiceCategoryById',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/service-category/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic translations(dynamic response) => getJsonField(
        response,
        r'''$.translations''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic modifiedAt(dynamic response) => getJsonField(
        response,
        r'''$.modified_at''',
      );
  dynamic iconUrl(dynamic response) => getJsonField(
        response,
        r'''$.icon_url''',
      );
  dynamic isActive(dynamic response) => getJsonField(
        response,
        r'''$.is_active''',
      );
  dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.state''',
      );
}

class UpdatePostCalendarDataCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
${data}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatePostCalendarData',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdatePostServiceCategoryCall {
  Future<ApiCallResponse> call({
    int? relatedServiceCategory,
    int? id,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "related_service_category": ${relatedServiceCategory}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatePostServiceCategory',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostTaskUpdateCall {
  Future<ApiCallResponse> call({
    int? relatedService,
    int? id,
    String? skillLevel = '',
    List<String>? taskerLanguagesList,
    String? description = '',
    String? fileDescription = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final taskerLanguages = _serializeList(taskerLanguagesList);

    final ffApiRequestBody = '''
{
  "related_service": ${relatedService},
  "skill_level": "${skillLevel}",
  "tasker_languages": ${taskerLanguages},
  "description": "${description}",
  "description_file": "${fileDescription}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTaskUpdate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskerAgeUpdateCall {
  Future<ApiCallResponse> call({
    int? id,
    String? taskerAge = '',
    String? taskerGender = '',
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "tasker_age":"${taskerAge}" ,
  "tasker_gender":"${taskerGender}" ,
  "identified":${identified} ,
  "years_of_experience":${yearsOfExperience} ,
  "insurance":${insurance} ,
  "driver_license":"${driverLicense}" 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'taskerAgeUpdate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MaxDistanceUpdatePostCall {
  Future<ApiCallResponse> call({
    int? id,
    int? radiusOfWork,
    bool? travelCosts,
    String? payPerHour = '',
    bool? cancellationPenalty,
    String? payCancellationPerHour = '',
    String? cancellationBeforeAppointment = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "travel_costs": ${travelCosts},
  "pay_per_hour": "${payPerHour}",
  "radius_of_work": ${radiusOfWork},
  "cancellation_penalty": ${cancellationPenalty},
  "pay_cancellation_per_hour": "${payCancellationPerHour}",
  "cancellation_before_appointment": "${cancellationBeforeAppointment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'maxDistanceUpdatePost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateAddressinPostCall {
  Future<ApiCallResponse> call({
    int? id,
    int? address,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "address": ${address}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAddressinPost',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/post/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RandomAdsCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RandomAds',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/ad/my_ads/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic translations(dynamic response) => getJsonField(
        response,
        r'''$.translations''',
      );
  dynamic img(dynamic response) => getJsonField(
        response,
        r'''$.image_url''',
      );
  dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.weight''',
      );
  dynamic placement(dynamic response) => getJsonField(
        response,
        r'''$.ad_placement''',
      );
  dynamic relatedCompony(dynamic response) => getJsonField(
        response,
        r'''$.related_campaign''',
      );
  dynamic targetURL(dynamic response) => getJsonField(
        response,
        r'''$.target_url''',
      );
}

class AllFielsTestCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'all fiels test',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/All Fields Test/b25f38e083/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateAllFiekdsTestCall {
  Future<ApiCallResponse> call({
    double? rating,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "rating": ${rating}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update all fiekds test',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/All Fields Test/b25f38e083/',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'token e43f8c08d8cd6b2:fb1e85c72d341b4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateAllFiledsTestCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "rating" : 0.1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create all fileds test',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/All Fields Test/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'token e43f8c08d8cd6b2:fb1e85c72d341b4',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenerateKeysCall {
  Future<ApiCallResponse> call({
    String? user = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Generate keys',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/frappe.core.doctype.user.user.generate_keys',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'user': user,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic apiSecret(dynamic response) => getJsonField(
        response,
        r'''$.message.api_secret''',
      );
  dynamic apiKey(dynamic response) => getJsonField(
        response,
        r'''$.message.api_key''',
      );
}

class UpdateProfileDeatelsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? yearsOfExperience,
    bool? insurance,
    String? driversLicense = '',
    String? describtion = '',
    String? language = '',
    String? avatar = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "years_of_experience": ${yearsOfExperience},
  "insurance": ${insurance},
  "drivers_license": "${driversLicense}",
  "describtion": "${describtion}",
  "language": "${language}",
  "avatar": "${avatar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile Deatels',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskCreationCall {
  Future<ApiCallResponse> call({
    String? skillName = '',
    String? language = '',
    String? description = '',
    String? skillCategoryName = '',
    String? address = '',
    double? latitude,
    double? longitude,
    String? startDate = '',
    String? startTime = '',
    String? startRangeTime = '',
    bool? isExactStartTime,
    int? numberOfHoursPerSession,
    bool? isRepeatable,
    String? repeatType = '',
    String? endDateType = '',
    String? endOn = '',
    int? endAfterNumberOfSessions,
    String? repeatEvery = '',
    String? preferredDays = '',
    String? monthlyRepeatType = '',
    String? taskerGender = '',
    String? taskerAgeRange = '',
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense = '',
    String? maxDistance = '',
    String? poster = '',
    String? skillLevel = '',
    String? file = '',
    String? fullAddress = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "skill_name": "${skillName}",
  "language": "${language}",
  "description": "${description}",
  "skill_category_name": "${skillCategoryName}",
  "address": "${address}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "start_date": "${startDate}",
  "start_time": "${startTime}",
  "start_range_time": "${startRangeTime}",
  "is_exact_start_time": ${isExactStartTime},
  "number_of_hours_per_session": "${numberOfHoursPerSession}",
  "is_repeatable": ${isRepeatable},
  "repeat_type": "${repeatType}",
  "end_date_type": "${endDateType}",
  "end_on": "${endOn}",
  "end_after_number_of_sessions": "${endAfterNumberOfSessions}",
  "repeat_every": "${repeatEvery}",
  "preferred_days": "${preferredDays}",
  "monthly_repeat_type": "${monthlyRepeatType}",
  "tasker_gender": "${taskerGender}",
  "tasker_age_range": "${taskerAgeRange}",
  "identified": ${identified},
  "years_of_experience": "${yearsOfExperience}",
  "insurance": ${insurance},
  "driver_license": "${driverLicense}",
  "max_distance": "${maxDistance}",
  "poster": "${poster}",
  "skill_level": "${skillLevel}",
  "file": "${file}",
  "full_address": "${fullAddress}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Task Creation',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TaskCreationSkillCategoryCall {
  Future<ApiCallResponse> call({
    String? skillCategoryName = '',
    String? poster = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "skill_category_name": "${skillCategoryName}",
  "poster":"${poster}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Task Creation skill category',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchFilterPostsCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchFilterPosts',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAddressDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAddressDetails',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic owner(dynamic response) => getJsonField(
        response,
        r'''$.data.owner''',
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.data.creation''',
      );
  dynamic modified(dynamic response) => getJsonField(
        response,
        r'''$.data.modified''',
      );
  dynamic modifiedBy(dynamic response) => getJsonField(
        response,
        r'''$.data.modified_by''',
      );
  dynamic docstatus(dynamic response) => getJsonField(
        response,
        r'''$.data.docstatus''',
      );
  dynamic idx(dynamic response) => getJsonField(
        response,
        r'''$.data.idx''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.data.city''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.data.country''',
      );
  dynamic postalCode(dynamic response) => getJsonField(
        response,
        r'''$.data.postal_code''',
      );
  dynamic streetAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.street_address''',
      );
  dynamic aptNo(dynamic response) => getJsonField(
        response,
        r'''$.data.apt_no''',
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.data.latitude''',
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.data.longitude''',
      );
  dynamic isMainAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.is_main_address''',
      );
  dynamic customerProfile(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.data.doctype''',
      );
}

class GetSkillCategoryDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Skill Category Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Skill Category/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategory(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic owner(dynamic response) => getJsonField(
        response,
        r'''$.data.owner''',
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.data.creation''',
      );
  dynamic modified(dynamic response) => getJsonField(
        response,
        r'''$.data.modified''',
      );
  dynamic modifiedBy(dynamic response) => getJsonField(
        response,
        r'''$.data.modified_by''',
      );
  dynamic docstatus(dynamic response) => getJsonField(
        response,
        r'''$.data.docstatus''',
      );
  dynamic skillCategoryName(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_category_name''',
      );
  dynamic idx(dynamic response) => getJsonField(
        response,
        r'''$.data.idx''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.data.doctype''',
      );
  dynamic skills(dynamic response) => getJsonField(
        response,
        r'''$.data.skills''',
        true,
      );
}

class CustomerProfileListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = '',
    String? orFilters = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Profile List',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateBidCall {
  Future<ApiCallResponse> call({
    String? price = '',
    String? priceType = '',
    String? bider = '',
    String? post = '',
    String? poster = '',
    String? room = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "price": "${price}",
  "price_type": "${priceType}",
  "bider": "${bider}",
  "post": "${post}",
  "poster": "${poster}",
  "room": "${room}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Bid',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Bid',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic poster(dynamic response) => getJsonField(
        response,
        r'''$.data.poster''',
      );
  dynamic post(dynamic response) => getJsonField(
        response,
        r'''$.data.post''',
      );
  dynamic bider(dynamic response) => getJsonField(
        response,
        r'''$.data.bider''',
      );
  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data.price''',
      );
  dynamic priceType(dynamic response) => getJsonField(
        response,
        r'''$.data.price_type''',
      );
}

class BidListCall {
  Future<ApiCallResponse> call({
    String? filters = '[]',
    String? fields = '[\"name\"]',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Bid List',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Bid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic bidList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic bidNameList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  dynamic bidPriceList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      );
  dynamic bidBiderList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].bider''',
        true,
      );
  dynamic bidPosterList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].post''',
        true,
      );
  dynamic bidDocStatusList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].docstatus''',
        true,
      );
}

class CustomerProfileDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Profile Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic customerProfileJson(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic owner(dynamic response) => getJsonField(
        response,
        r'''$.data.owner''',
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.data.creation''',
      );
  dynamic modified(dynamic response) => getJsonField(
        response,
        r'''$.data.modified''',
      );
  dynamic modifiedBy(dynamic response) => getJsonField(
        response,
        r'''$.data.modified_by''',
      );
  dynamic idx(dynamic response) => getJsonField(
        response,
        r'''$.data.idx''',
      );
  dynamic docstatus(dynamic response) => getJsonField(
        response,
        r'''$.data.docstatus''',
      );
  dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.data.account_type''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data.title''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.data.role''',
      );
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  dynamic phoneVerified(dynamic response) => getJsonField(
        response,
        r'''$.data.phone_verified''',
      );
  dynamic yearsOFExperience(dynamic response) => getJsonField(
        response,
        r'''$.data.years_of_experience''',
      );
  dynamic insurance(dynamic response) => getJsonField(
        response,
        r'''$.data.insurance''',
      );
  dynamic identified(dynamic response) => getJsonField(
        response,
        r'''$.data.identified''',
      );
  dynamic reviewCount(dynamic response) => getJsonField(
        response,
        r'''$.data.review_count''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.data.doctype''',
      );
  dynamic reviewAverage(dynamic response) => getJsonField(
        response,
        r'''$.data.review_average''',
      );
}

class MyBidCall {
  Future<ApiCallResponse> call({
    String? filters = '[]',
    String? fields = '[\"name\"]',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'My bid',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Bid',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ServiceDetailCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Service Detail',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Skill Category/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategoryData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic owner(dynamic response) => getJsonField(
        response,
        r'''$.data.owner''',
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.data.creation''',
      );
  dynamic mmodified(dynamic response) => getJsonField(
        response,
        r'''$.data.modified''',
      );
  dynamic modifiedBy(dynamic response) => getJsonField(
        response,
        r'''$.data.modified_by''',
      );
  dynamic docstatus(dynamic response) => getJsonField(
        response,
        r'''$.data.docstatus''',
      );
  dynamic idx(dynamic response) => getJsonField(
        response,
        r'''$.data.idx''',
      );
  dynamic skillCategoryName(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_category_name''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.data.doctype''',
      );
}

class UpdateAppintmentStatusCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? docstatus,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"docstatus":"${docstatus}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update appintment status',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Appointment/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReviewReadByIdCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'review read by id',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Review',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckVerificationCodeCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? code = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"to":"${to}",
"code":"${code}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'check verification code',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/twilio_integration.api.verify_verification_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendToVerificationCodeCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"to":"${to}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'send to verification code',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/twilio_integration.api.send_verification_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdatePhoneVerificationCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? phoneVerified,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "phone_verified": ${phoneVerified}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update phone verification',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEmailVerivicationCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? emailVerified,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "email_verified": ${emailVerified}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update email verivication',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckEmailVerificationCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? code = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"name":"${name}",
"code":"${code}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'check email verification',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/check_email_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MyReviewsCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'my reviews ',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Review',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PlanListCall {
  Future<ApiCallResponse> call({
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'plan list',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Subscription Plan',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PlanReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'plan read',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Subscription Plan/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PayCall {
  Future<ApiCallResponse> call({
    String? subscriptionPlanName = '',
    String? successUrl = '',
    String? cancelUrl = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"subscription_plan_name":"${subscriptionPlanName}",
"success_url":"${successUrl}",
"cancel_url":"${cancelUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pay',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/stripe_payment.api.creat_checkout_session',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic checkoutURL(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetCustomerAdCall {
  Future<ApiCallResponse> call({
    String? customerProfile = '',
    String? position = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "customer_profile": "${customerProfile}",
  "position": "${position}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Customer Ad',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/app_campaigns.api.get_profile_ad',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChangeMainAddressCall {
  Future<ApiCallResponse> call({
    int? isMainAddress,
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "is_main_address":${isMainAddress}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'change main address',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Address/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateNameAndLastNameCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? firstName = '',
    String? lastName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"first_name":"${firstName}",
"last_name":"${lastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update name and last name',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEmailAddressCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? email = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"email":"${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update email address',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdatePasswordCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? password = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"new_password":"<new_password>"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update password',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? avatar = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"avatar":"${avatar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update profile',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateBannerCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? banner = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"banner":"${banner}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update banner',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SkillDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Skill Details',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Skill/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateSkillCategoryInTaskCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? skillCategoryName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"skill_category_name":"${skillCategoryName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update skillCategoryInTask',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskDetailsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? skillName = '',
    String? skillLevel = '',
    String? languages = '',
    String? description = '',
    String? file = '',
    int? isOnline,
    dynamic? optionsJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final options = _serializeJson(optionsJson, true);
    final ffApiRequestBody = '''
{
  "skill_name": "${skillName}",
  "skill_level": "${skillLevel}",
  "language": "${languages}",
  "description": "${description}",
  "file": "${file}",
  "is_online": ${isOnline},
  "options": ${options}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update task details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskOptionsCall {
  Future<ApiCallResponse> call({
    dynamic? optionsJson,
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final options = _serializeJson(optionsJson, true);
    final ffApiRequestBody = '''
{
  "options": ${options}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update task options',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskAddressCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? address = '',
    String? fullAddress = '',
    String? latitude = '',
    String? longitude = '',
    String? country = '',
    String? city = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update task address',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'address': address,
        'full_address': fullAddress,
        'latitude': latitude,
        'longitude': longitude,
        'country': country,
        'city': city,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskScheduleCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    int? isExactStartTime,
    String? startTime = '',
    String? startRangeTime = '',
    int? numberOfHoursPerSession,
    int? isRepeatable,
    String? endDateType = '',
    String? endOn = '',
    int? endAfterNumberOfSessions,
    String? repeatEvery = '',
    String? preferredDays = '',
    String? id = '',
    int? daysPerWeek,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Task Schedule',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'start_date': startDate,
        'is_exact_start_time': isExactStartTime,
        'start_time': startTime,
        'start_range_time': startRangeTime,
        'number_of_hours_per_session': numberOfHoursPerSession,
        'is_repeatable': isRepeatable,
        'end_date_type': endDateType,
        'end_on': endOn,
        'end_after_number_of_sessions': endAfterNumberOfSessions,
        'repeat_every': repeatEvery,
        'preferred_days': preferredDays,
        'days_per_week': daysPerWeek,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskerTypeCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? taskerGender = '',
    String? taskerAgeRange = '',
    int? identified,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update tasker type',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'tasker_gender': taskerGender,
        'tasker_age_range': taskerAgeRange,
        'identified': identified,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskerTypeTwoCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? driverLicense = '',
    int? insurance,
    String? yearsOfExperience = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateTaskerTypeTwo',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'years_of_experience': yearsOfExperience,
        'insurance': insurance,
        'driver_license': driverLicense,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskerTypeThreeCall {
  Future<ApiCallResponse> call({
    int? maxDistance,
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateTaskerTypeThree',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'max_distance': maxDistance,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class InitSubCall {
  Future<ApiCallResponse> call({
    String? subscriptionPlanName = '',
    String? customerProfileName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "subscription_plan_name": "${subscriptionPlanName}",
  "customer_profile_name": "${customerProfileName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'init sub',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/init_subscription',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.message.name''',
      );
}

class GetSubscriptionUpdateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get subscription update',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/erpnext.accounts.doctype.subscription.subscription.get_subscription_updates',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AplyCoponCall {
  Future<ApiCallResponse> call({
    String? couponName = '',
    String? subscriptionName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'aply copon',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/apply_coupon',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'coupon_name': couponName,
        'subscription_name': subscriptionName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPaymentUrlCall {
  Future<ApiCallResponse> call({
    String? customerProfileName = '',
    String? subscriptionName = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "subscription_name": "${subscriptionName}",
  "customer_profile_name": "${customerProfileName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get payment url',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/get_payment_url',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateSubscriptionCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? isSubscribed,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"is_subscribed":"${isSubscribed}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update subscription',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentsHistoryCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payments history',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Sales Invoice',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeatelsPaymentsHistoryReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deatels payments history read',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Sales Invoice/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic planName(dynamic response) => getJsonField(
        response,
        r'''$.data.pricing_rules[:].item_code''',
      );
}

class LanguagesListCall {
  Future<ApiCallResponse> call({
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'languages list',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Language',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CountryListCall {
  Future<ApiCallResponse> call({
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Country list',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Country',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSubscriptionDetalsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get subscription detals',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Subscription/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic planName(dynamic response) => getJsonField(
        response,
        r'''$.data.plans[:].plan''',
      );
}

class IssueListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'issue list',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Issue',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NotificationLogCall {
  Future<ApiCallResponse> call({
    String? fields = '',
    String? filters = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'notification log',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Notification Log',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic notificationList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class NotificationReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? read,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'notification read',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Notification Log/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'read': read,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EducationDeletCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'education delet',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Education/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SkillDeletCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'skill delet',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateIdentificationCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? identified,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"identified":"${identified}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update identification',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChatListCall {
  Future<ApiCallResponse> call({
    String? user = '',
    int? task,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'chat list',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.room.get',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'email': user,
        'task': task,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      );
  dynamic modified(dynamic response) => getJsonField(
        response,
        r'''$.message[:].modified''',
        true,
      );
  dynamic lastmessage(dynamic response) => getJsonField(
        response,
        r'''$.message[:].last_message''',
        true,
      );
  dynamic read(dynamic response) => getJsonField(
        response,
        r'''$.message[:].is_read''',
        true,
      );
  dynamic roomName(dynamic response) => getJsonField(
        response,
        r'''$.message[:].room_name''',
        true,
      );
  dynamic members(dynamic response) => getJsonField(
        response,
        r'''$.message[:].members''',
        true,
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.message[:].type''',
        true,
      );
  dynamic customerTasks(dynamic response) => getJsonField(
        response,
        r'''$.message[:].customer_task''',
        true,
      );
  dynamic catBots(dynamic response) => getJsonField(
        response,
        r'''$.message[:].chat_bot''',
        true,
      );
  dynamic oppositePersionEmail(dynamic response) => getJsonField(
        response,
        r'''$.message[:].opposite_person_email''',
        true,
      );
  dynamic chatListJson(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
}

class ChatRoomMessagesCall {
  Future<ApiCallResponse> call({
    String? room = '',
    String? email = '',
    String? orderBy = 'creation desc',
    int? start = 0,
    int? pageLength = 10,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Room Messages',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.message.get_all',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'room': room,
        'email': email,
        'order_by': orderBy,
        'start': start,
        'page_length': pageLength,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.message[:].content''',
        true,
      );
  dynamic sender(dynamic response) => getJsonField(
        response,
        r'''$.message[:].sender''',
        true,
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.message[:].creation''',
        true,
      );
  dynamic senderemail(dynamic response) => getJsonField(
        response,
        r'''$.message[:].sender_email''',
        true,
      );
  dynamic chatMessagesJson(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
}

class ChatsRoomCopyCall {
  Future<ApiCallResponse> call({
    String? room = '',
    String? email = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'chats room Copy',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.message.get_all',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'room': room,
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.message[:].content''',
        true,
      );
  dynamic sender(dynamic response) => getJsonField(
        response,
        r'''$.message[:].sender''',
        true,
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.message[:].creation''',
        true,
      );
  dynamic senderemail(dynamic response) => getJsonField(
        response,
        r'''$.message[:].sender_email''',
        true,
      );
}

class MarkAsReadCall {
  Future<ApiCallResponse> call({
    String? room = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Mark As Read',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.message.mark_as_read',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'room': room,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendMessageCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? room = '',
    String? user = '',
    String? content = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'send message',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.message.send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'content': content,
        'user': user,
        'room': room,
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateChatCall {
  Future<ApiCallResponse> call({
    String? roomName = '',
    String? users = '',
    String? type = '',
    String? task = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "room_name": "${roomName}",
  "users": "${users}",
  "type": "${type}",
  "task": "${task}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create chat',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.room.create_private',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic room(dynamic response) => getJsonField(
        response,
        r'''$.message.room''',
      );
}

class CreateChatTestCall {
  Future<ApiCallResponse> call({
    String? roomName = '',
    List<String>? membersList,
    String? type = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final members = _serializeList(membersList);

    final ffApiRequestBody = '''
{
  "room_name": "${roomName}",
  "members": [
    "<users>"
  ],
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create chat test',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Chat Room',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMyTasksCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    int? limitStart,
    int? limit,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get my tasks',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task Taskers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
        'limit_start': limitStart,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class JoinTaskCall {
  Future<ApiCallResponse> call({
    String? user = '',
    String? status = '',
    String? customerTask = '',
    bool? isOwner = false,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'join task',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task Taskers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'user': user,
        'status': status,
        'customer_task': customerTask,
        'is_owner': isOwner,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMyTasksGroupByCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    int? limitStart = 0,
    int? limit = 100,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get my tasks group by',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task Taskers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
        'limit_start': limitStart,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.data[:].user''',
        true,
      );
}

class ReadByEmailCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'read by email',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].first_name''',
      );
  dynamic family(dynamic response) => getJsonField(
        response,
        r'''$.data[:].last_name''',
      );
  dynamic avatar(dynamic response) => getJsonField(
        response,
        r'''$.data[:].avatar''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class UpdateTasksTimeCall {
  Future<ApiCallResponse> call({
    String? repeatType = '',
    String? id = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'update tasks time',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'repeat_type': repeatType,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FollowReqCall {
  Future<ApiCallResponse> call({
    int? requestor,
    int? requested,
    String? status = '',
    String? requestMessage = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "requestor": ${requestor},
  "requested": ${requested},
  "status": "${status}",
  "request_message": "${requestMessage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Follow req',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Follow Request',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AnswerToFollowReqCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? status = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'answer to follow req',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Follow Request/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAppRolesCall {
  Future<ApiCallResponse> call({
    String? filters = '[]',
    String? fields = '[\"role_profile_name\",\"message\"]',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAppRoles',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/App Roles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic roleProfilesList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic roleProfileNames(dynamic response) => getJsonField(
        response,
        r'''$.data[:].role_profile_name''',
        true,
      );
  dynamic roleProfileMessages(dynamic response) => getJsonField(
        response,
        r'''$.data[:].message''',
        true,
      );
  dynamic nameList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  dynamic roleProfileAddSkillsText(dynamic response) => getJsonField(
        response,
        r'''$.data[:].add_skills_text''',
        true,
      );
  dynamic roleProfilesSkillLimit(dynamic response) => getJsonField(
        response,
        r'''$.data[:].skills_limit''',
        true,
      );
}

class UpdateUserRoleCall {
  Future<ApiCallResponse> call({
    String? roleProfileName = '',
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
"role_profile_name":"${roleProfileName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserRole',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ReadAppRoleCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Read App Role',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/App Roles/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic appRoleJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic appRoleName(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic roleProfileName(dynamic response) => getJsonField(
        response,
        r'''$.data.role_profile_name''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.data.message''',
      );
  dynamic addSkillsText(dynamic response) => getJsonField(
        response,
        r'''$.data.add_skills_text''',
      );
  dynamic skillsLimit(dynamic response) => getJsonField(
        response,
        r'''$.data.skills_limit''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.data.doctype''',
      );
}

class ConnectionListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? orderBy = 'creation desc',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'connection list',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/Follow Request',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
        'order_by': orderBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTaskRateCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? rateType = '',
    int? rate,
    String? rateCurrency = '',
    String? rateSessionDuration = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "rate_type": "${rateType}",
  "rate": ${rate},
  "rate_currency": "${rateCurrency}",
  "rate_session_duration": "${rateSessionDuration}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update task rate',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Task/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateCustomerProfileCall {
  Future<ApiCallResponse> call({
    dynamic? customerSkillsJson,
    int? name,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final customerSkills = _serializeJson(customerSkillsJson, true);
    final ffApiRequestBody = '''
{
  "customer_skills": ${customerSkills}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Customer Profile',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SetUserPasswordCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? newPassword = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "new_password": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setUserPassword',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMySkillCategoriesCall {
  Future<ApiCallResponse> call({
    int? customerProfile,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get My Skill Categories',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.customer_profile_skills.get_my_skill_categories',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'customer_profile': customerProfile,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic mySkillCategories(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
  dynamic customerProfileSkillNames(dynamic response) => getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      );
  dynamic mySkillCategoryNames(dynamic response) => getJsonField(
        response,
        r'''$.message[:].skill_category_name''',
        true,
      );
}

class SyncSkillCategoriesCall {
  Future<ApiCallResponse> call({
    String? newSkillsList = '',
    int? customerProfileName,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sync Skill Categories',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.customer_profile_skills.sync_skill_categories',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'new_skills_list': newSkillsList,
        'customer_profile_name': customerProfileName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategoriesList(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
  dynamic docNames(dynamic response) => getJsonField(
        response,
        r'''$.message[:].name''',
        true,
      );
  dynamic skillCategoryNames(dynamic response) => getJsonField(
        response,
        r'''$.message[:].skill_category_name''',
        true,
      );
}

class UpdateSkillsCall {
  Future<ApiCallResponse> call({
    String? skill = '',
    String? customerProfileSkill = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Skills',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.customer_profile_skills.update_skills',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'skill': skill,
        'customer_profile_skill': customerProfileSkill,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic addedChildSkill(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic childSkillName(dynamic response) => getJsonField(
        response,
        r'''$.message.name''',
      );
  dynamic childSkillSkill(dynamic response) => getJsonField(
        response,
        r'''$.message.skill''',
      );
  dynamic childSkillParent(dynamic response) => getJsonField(
        response,
        r'''$.message.parent''',
      );
  dynamic childSkillSkillName(dynamic response) => getJsonField(
        response,
        r'''$.message.skill_name''',
      );
  dynamic childSkillParentField(dynamic response) => getJsonField(
        response,
        r'''$.message.parentfield''',
      );
  dynamic childSkillParentType(dynamic response) => getJsonField(
        response,
        r'''$.message.parenttype''',
      );
}

class DeleteSkillsCall {
  Future<ApiCallResponse> call({
    String? skill = '',
    String? customerProfileSkill = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Skills',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.customer_profile_skills.update_skills',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'skill': skill,
        'customer_profile_skill': customerProfileSkill,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic addedChildSkill(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic childSkillName(dynamic response) => getJsonField(
        response,
        r'''$.message.name''',
      );
  dynamic childSkillSkill(dynamic response) => getJsonField(
        response,
        r'''$.message.skill''',
      );
  dynamic childSkillParent(dynamic response) => getJsonField(
        response,
        r'''$.message.parent''',
      );
  dynamic childSkillSkillName(dynamic response) => getJsonField(
        response,
        r'''$.message.skill_name''',
      );
  dynamic childSkillParentField(dynamic response) => getJsonField(
        response,
        r'''$.message.parentfield''',
      );
  dynamic childSkillParentType(dynamic response) => getJsonField(
        response,
        r'''$.message.parenttype''',
      );
}

class UpdateCustomerProfileSkillLevelCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? skillLevel = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Customer Profile Skill Level',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'skill_level': skillLevel,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCustomerProfileSkillsDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Customer Profile Skills Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile Skills/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateIdentificationDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    dynamic? bodyJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
${body}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Identification Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Identification/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic identificationJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class CreateIdentificationCall {
  Future<ApiCallResponse> call({
    dynamic? bodyJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
${body}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Identification',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Identification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic identificationJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetIdentificationDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Identification Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Identification/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic identificationJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ListUserIdentificationCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'List User Identification',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Identification',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userIdentifications(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetUserRateDetailsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Rate Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Rate/${name}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategories(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories''',
        true,
      );
  dynamic customerProfileUser(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile_user''',
      );
  dynamic customerProfile(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.data.currency''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.amount''',
      );
  dynamic label(dynamic response) => getJsonField(
        response,
        r'''$.data.label''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic userRateJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic skillCategoryNamesList(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories[:].skill_category''',
        true,
      );
}

class CreateUserRateCall {
  Future<ApiCallResponse> call({
    dynamic? bodyJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
${body}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create User Rate',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User Rate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategories(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories''',
        true,
      );
  dynamic customerProfileUser(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile_user''',
      );
  dynamic customerProfile(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.data.currency''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.amount''',
      );
  dynamic label(dynamic response) => getJsonField(
        response,
        r'''$.data.label''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic userRateJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic skillCategoryNamesList(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories[:].skill_category''',
        true,
      );
}

class UpdateUserRateCall {
  Future<ApiCallResponse> call({
    String? name = '',
    dynamic? bodyJson,
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = '''
${body}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Rate ',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/User Rate/${name}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic skillCategories(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories''',
        true,
      );
  dynamic customerProfileUser(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile_user''',
      );
  dynamic customerProfile(dynamic response) => getJsonField(
        response,
        r'''$.data.customer_profile''',
      );
  dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.data.currency''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.amount''',
      );
  dynamic label(dynamic response) => getJsonField(
        response,
        r'''$.data.label''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic userRateJson(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic skillCategoryNamesList(dynamic response) => getJsonField(
        response,
        r'''$.data.skill_categories[:].skill_category''',
        true,
      );
}

class UpdateRoleCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? roleProfileName = '',
    String? role = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    final ffApiRequestBody = '''
{
  "role": "${role}",
  "role_profile_name": "${roleProfileName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateRole',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/resource/Customer Profile/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserRateListCall {
  Future<ApiCallResponse> call({
    String? filters = '',
    String? fields = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Rate List',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/User Rate',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'filters': filters,
        'fields': fields,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userRateJsonList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic userRateNamesList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
}

class UserBadgesCall {
  Future<ApiCallResponse> call({
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'user badges',
      apiUrl: '${TaskerpageBackendGroup.baseUrl}/api/resource/App Badges',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetChatRoomDetailsCall {
  Future<ApiCallResponse> call({
    String? roomName = '',
    String? email = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Chat Room Details',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/chat.api.room.get_room_by_name',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'room_name': roomName,
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic chatRoomJson(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.message.name''',
      );
  dynamic owner(dynamic response) => getJsonField(
        response,
        r'''$.message.owner''',
      );
  dynamic creation(dynamic response) => getJsonField(
        response,
        r'''$.message.creation''',
      );
  dynamic modified(dynamic response) => getJsonField(
        response,
        r'''$.message.modified''',
      );
  dynamic modifiedBy(dynamic response) => getJsonField(
        response,
        r'''$.message.modified_by''',
      );
  dynamic docstatus(dynamic response) => getJsonField(
        response,
        r'''$.message.docstatus''',
      );
  dynamic idx(dynamic response) => getJsonField(
        response,
        r'''$.message.idx''',
      );
  dynamic roomName(dynamic response) => getJsonField(
        response,
        r'''$.message.room_name''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.message.type''',
      );
  dynamic members(dynamic response) => getJsonField(
        response,
        r'''$.message.members''',
      );
  dynamic isRead(dynamic response) => getJsonField(
        response,
        r'''$.message.is_read''',
      );
  dynamic customerTask(dynamic response) => getJsonField(
        response,
        r'''$.message.customer_task''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.message.doctype''',
      );
  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$.message.users''',
        true,
      );
  dynamic oppositePersonEmail(dynamic response) => getJsonField(
        response,
        r'''$.message.opposite_person_email''',
      );
  dynamic oppositePersonAvatar(dynamic response) => getJsonField(
        response,
        r'''$.message.opposite_person_avatar''',
      );
  dynamic oppositePersonCustomerProfile(dynamic response) => getJsonField(
        response,
        r'''$.message.opposite_person_customer_profile''',
      );
}

class GetPossibleTransitionsCall {
  Future<ApiCallResponse> call({
    String? currentState = '',
    String? doctype = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Possible Transitions',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.util.get_possible_transitions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'current_state': currentState,
        'doctype': doctype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic actionsJson(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
  dynamic actionsState(dynamic response) => getJsonField(
        response,
        r'''$.message[:].state''',
        true,
      );
  dynamic actionsAllowedRoles(dynamic response) => getJsonField(
        response,
        r'''$.message[:].allowed''',
        true,
      );
  dynamic actionsNextState(dynamic response) => getJsonField(
        response,
        r'''$.message[:].next_state''',
        true,
      );
  dynamic action(dynamic response) => getJsonField(
        response,
        r'''$.message[:].action''',
        true,
      );
}

class ProcessActionCall {
  Future<ApiCallResponse> call({
    String? doctype = '',
    String? docname = '',
    String? action = '',
    String? refrenceDoctype = '',
    String? refrenceDocname = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Process Action',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.workflow.process_action',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'doctype': doctype,
        'docname': docname,
        'action': action,
        'refrence_doctype': refrenceDoctype,
        'refrence_docname': refrenceDocname,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateCustomerProfileBadgesCall {
  Future<ApiCallResponse> call({
    String? customerProfile = '',
    String? appBadge = '',
    String? apiGlobalKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Customer Profile Badges',
      apiUrl:
          '${TaskerpageBackendGroup.baseUrl}/api/method/taskerpage_core.taskerpage_core.api.app_badges.update_customer_profile_badges',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${apiGlobalKey}',
      },
      params: {
        'customer_profile': customerProfile,
        'app_badge': appBadge,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic cpBadgeJson(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.message.name''',
      );
  dynamic badgeName(dynamic response) => getJsonField(
        response,
        r'''$.message.badge_name''',
      );
  dynamic label(dynamic response) => getJsonField(
        response,
        r'''$.message.label''',
      );
  dynamic deactiveIcon(dynamic response) => getJsonField(
        response,
        r'''$.message.deactive_icon''',
      );
  dynamic activeIcon(dynamic response) => getJsonField(
        response,
        r'''$.message.active_icon''',
      );
  dynamic completedPercent(dynamic response) => getJsonField(
        response,
        r'''$.message.completed_percent''',
      );
  dynamic enabled(dynamic response) => getJsonField(
        response,
        r'''$.message.enabled''',
      );
  dynamic parent(dynamic response) => getJsonField(
        response,
        r'''$.message.parent''',
      );
  dynamic parentfield(dynamic response) => getJsonField(
        response,
        r'''$.message.parentfield''',
      );
  dynamic parenttype(dynamic response) => getJsonField(
        response,
        r'''$.message.parenttype''',
      );
  dynamic doctype(dynamic response) => getJsonField(
        response,
        r'''$.message.doctype''',
      );
}

/// End Taskerpage Backend Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
