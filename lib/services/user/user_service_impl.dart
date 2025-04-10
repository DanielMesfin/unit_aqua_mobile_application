// import 'dart:developer';

// import 'package:get/get.dart';
// import 'package:metahu_addis_customer/data/auth_model/auth_request.dart';
// import 'package:metahu_addis_customer/data/auth_model/auth_response.dart';
// import 'package:metahu_addis_customer/data/auth_model/change_password_request.dart';
// import 'package:metahu_addis_customer/data/auth_model/forgot_password_request_model.dart';
// import 'package:metahu_addis_customer/data/base_store_model/base_store_response_model.dart';
// import 'package:metahu_addis_customer/data/base_user_model/base_address_request_model.dart';
// import 'package:metahu_addis_customer/data/base_user_model/base_user_request_model.dart';
// import 'package:metahu_addis_customer/data/base_user_model/base_user_response_model.dart';
// import 'package:metahu_addis_customer/data/forgot_password_model/forgot_password_response.dart';
// import 'package:metahu_addis_customer/data/notification_model/notification_model.dart';
// import 'package:metahu_addis_customer/data/notification_model/notification_request.dart';
// import 'package:metahu_addis_customer/data/notification_model/notification_response.dart';
// import 'package:metahu_addis_customer/data/user_model/user_address_model/user_address_request_model.dart';
// import 'package:metahu_addis_customer/data/user_model/user_address_model/user_address_response_model.dart';
// import 'package:metahu_addis_customer/data/user_model/user_model.dart';
// import 'package:metahu_addis_customer/services/auth/auth_service.dart';
// import 'package:metahu_addis_customer/services/auth/auth_service_impl.dart';

// import '../../data/base_model/base_model.dart';
// import '../../data/base_model/base_response_model.dart';
// import '../../data/user_model/user_address_model/user_address_model.dart';
// import '../../data/user_model/user_response_model.dart';
// import '../apis.dart';
// import '../http/http_services.dart';

// part 'user_service.dart';

// enum ManageNotificationCount { increment, decrement }

// enum AddressSaveType {
//   add,
//   update,
// }

// enum NotificationSetting {
//   on,
//   off,
//   read,
// }

// class UserServiceImpl implements UserService {
//   final HttpService _httpService = Get.find<HttpServiceImpl>();
//   final AuthService _authService = Get.find<AuthServiceImpl>();
//   RxInt undReadNotificationCount = 0.obs;
//   @override
//   Future<BaseUserResponseModel> forgotPassword({
//     required BaseUserRequestModel request,
//   }) async {
//     final response = await _httpService.postRequest(
//       urlPath: Apis.forgotPassword,
//       data: request.toJson(),
//       headerType: HeaderType.none,
//     );

//     final parsedResponse = BaseUserResponseModel.fromJson(response.data);
//     return parsedResponse;
//   }

//   @override
//   Future<BaseResponseModel<BaseUserResponseModel>> updateProfile({
//     required BaseUserRequestModel request,
//   }) async {
//     final response = await _httpService.patchRequest(
//       urlPath: Apis.updateProfile,
//       data: request.toJson(),
//       headerType: HeaderType.file,
//     );

//     final parsedResponse = BaseResponseModel.fromJson(
//       response.data,
//       BaseUserResponseModel.fromJsonModel,
//     );
//     return parsedResponse;
//   }

//   @override
//   Future<BaseResponseModel<BaseUserResponseModel>> getUserAddress() async {
//     final response = await _httpService.getRequest(
//       urlPath: Apis.getUserAddresses,
//     );

//     final parsedResponse = BaseResponseModel.fromJson(
//       response.data,
//       BaseUserResponseModel.fromJsonModel,
//     );
//     return parsedResponse;
//   }

//   @override
//   Future<BaseResponseModel<BaseUserResponseModel>> saveAddress({
//     required BaseAddressRequestModel addressRequest,
//     required AddressSaveType addressSaveType,
//   }) async {
//     String urlPath;
//     var request;
//     switch (addressSaveType) {
//       case AddressSaveType.add:
//         urlPath = Apis.addUserAddress;
//         request = _httpService.postRequest(
//             urlPath: urlPath, data: addressRequest.toJson());
//         break;
//       case AddressSaveType.update:
//         urlPath = "${Apis.updateUserAddress}/${addressRequest.id}";
//         request = _httpService.patchRequest(
//             urlPath: urlPath, data: addressRequest.toJson());
//         break;
//       default:
//         urlPath = Apis.addUserAddress;
//         request = _httpService.postRequest(
//             urlPath: urlPath, data: addressRequest.toJson());
//     }

//     final response = await request;
//     final parsedResponse = BaseResponseModel.fromJson(
//       response.data,
//       BaseUserResponseModel.fromJsonModel,
//     );
//     return parsedResponse;
//   }

//   @override
//   Future<BaseStoreResponseModel<NotificationModel>> getNotifications() async {
//     final response = await _httpService.getRequest(
//       urlPath: Apis.notificationList,
//     );
//     return BaseStoreResponseModel.fromJson(
//       response.data["list"],
//       NotificationModel.fromJsonModel,
//     );
//   }

//   @override
//   Future<UserModel> muteNotification({
//     required NotificationSetting notificationSetting,
//   }) async {
//     NotificationRequest notificationRequest = NotificationRequest();
//     switch (notificationSetting) {
//       case NotificationSetting.on:
//         notificationRequest.notify = 0;
//         break;
//       case NotificationSetting.off:
//         notificationRequest.notify = 1;
//         break;
//       default:
//         notificationRequest.notify = 0;
//     }
//     final response = await _httpService.getRequest(
//       urlPath: Apis.muteNotification,
//       data: notificationRequest.toJson(),
//     );
//     final authResponse = AuthResponse.fromJson(response.data);

//     return authResponse.user ?? UserModel();
//   }

//   @override
//   Future<void> updateNotificationStatus({
//     required NotificationRequest notificationRequest,
//   }) async {
//     _httpService.fireAndForgetGetRequest(
//       Apis.updateNotification,
//       notificationRequest.toJson(),
//     );
//   }

//   @override
//   void readNotification({required NotificationRequest notificationRequest}) {
//     _httpService.fireAndForgetPostRequest(
//       Apis.updateNotification,
//       notificationRequest.toJson(),
//     );
//   }

//   @override
//   Future<NotificationResponse> notificationCount() async {
//     final response =
//         await _httpService.getRequest(urlPath: Apis.notificationCount);
//     final NotificationResponse parsedResponse = NotificationResponse.fromJson(
//       response.data,
//     );
//     undReadNotificationCount.value = parsedResponse.notificationCount ?? 0;
//     return parsedResponse;
//   }

//   @override
//   RxInt getUnReadNotification() {
//     return undReadNotificationCount;
//   }

//   @override
//   void manageNotificationCount({
//     ManageNotificationCount manageNotificationCount =
//         ManageNotificationCount.decrement,
//   }) {
//     switch (manageNotificationCount) {
//       case ManageNotificationCount.decrement:
//         undReadNotificationCount.value -= 1;
//         break;
//       case ManageNotificationCount.increment:
//         undReadNotificationCount.value += 1;
//         break;
//       default:
//     }
//   }

//   @override
//   Future<void> deleteAddress({
//     required BaseAddressRequestModel request,
//   }) async {
//     _httpService.fireAndForgetDeleteRequest(
//         "${Apis.removeUserAddress}/${request.id}", request.toJson());
//   }

//   @override
//   Future<BaseUserResponseModel> changePassword({
//     required BaseUserRequestModel request,
//   }) async {
//     final response = await _httpService.patchRequest(
//       urlPath: Apis.changePassword,
//       data: request.toJson(),
//     );
//     final parsedResponse = BaseUserResponseModel.fromJson(response.data);
//     return parsedResponse;
//   }

//   @override
//   Future<void> deleteAccount() async {
//     final response = await _httpService.deleteRequest(
//       urlPath: Apis.profile,
//       data: {},
//     );
//   }
// }
