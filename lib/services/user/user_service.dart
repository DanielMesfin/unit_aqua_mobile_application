// part of 'user_service_impl.dart';

// abstract class UserService {
//   Future<BaseUserResponseModel> changePassword({
//     required BaseUserRequestModel request,
//   });

//   Future<BaseUserResponseModel> forgotPassword({
//     required BaseUserRequestModel request,
//   });

//   Future<BaseResponseModel<BaseUserResponseModel>> updateProfile({
//     required BaseUserRequestModel request,
//   });

//   Future<BaseResponseModel<BaseUserResponseModel>> getUserAddress();

//   Future<BaseResponseModel<BaseUserResponseModel>> saveAddress({
//     required BaseAddressRequestModel addressRequest,
//     required AddressSaveType addressSaveType,
//   });
//   Future<void> deleteAddress({
//     required BaseAddressRequestModel request,
//   });

//   Future<BaseStoreResponseModel<NotificationModel>> getNotifications();

//   void readNotification({required NotificationRequest notificationRequest});

//   Future<NotificationResponse> notificationCount();

//   RxInt getUnReadNotification();

//   void manageNotificationCount({
//     ManageNotificationCount manageNotificationCount =
//         ManageNotificationCount.decrement,
//   });

//   Future<UserModel> muteNotification({
//     required NotificationSetting notificationSetting,
//   });

//   Future<void> updateNotificationStatus({
//     required NotificationRequest notificationRequest,
//   });

//   Future<void> deleteAccount();
// }
