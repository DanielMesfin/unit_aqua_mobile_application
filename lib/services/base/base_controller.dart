// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:metahu_addis_customer/common/constants/constants.dart';
// import 'package:metahu_addis_customer/data/auth_model/login_form_model.dart';
// import 'package:metahu_addis_customer/data/auth_model/login_request_model.dart';
// import 'package:metahu_addis_customer/data/auth_model/sign_up_form_model.dart';
// import 'package:metahu_addis_customer/data/auth_model/sign_up_request_model.dart';
// import 'package:metahu_addis_customer/data/base_model/base_model.dart';
// import 'package:metahu_addis_customer/data/base_provider_model/base_provider_args_model.dart';
// import 'package:metahu_addis_customer/data/base_provider_model/base_provider_request_model.dart';
// import 'package:metahu_addis_customer/data/data_lookup/data_lookup_model.dart';
// import 'package:metahu_addis_customer/data/home_category_model/home_category_model.dart';
// import 'package:metahu_addis_customer/data/location_model/place_model.dart';
// import 'package:metahu_addis_customer/helpers/utils.dart';
// import 'package:metahu_addis_customer/model/user/user_data.dart';
// import 'package:metahu_addis_customer/services/auth/auth_service.dart';
// import 'package:metahu_addis_customer/services/auth/auth_service_impl.dart';
// import 'package:metahu_addis_customer/services/data_lookup/data_lookup_service.dart';
// import 'package:metahu_addis_customer/services/firebase/push_notification_service/push_notification_service_impl.dart';
// import 'package:metahu_addis_customer/services/location/address_search.dart';
// import 'package:metahu_addis_customer/services/location/location_service.dart';
// import 'package:metahu_addis_customer/services/location/location_service_impl.dart';
// import 'package:metahu_addis_customer/services/store/store_service_impl.dart';
// import 'package:metahu_addis_customer/services/user/user_service_impl.dart';

// import '../../common/enums/api_enums.dart';
// import '../../data/base_data_lookup_model/base_data_lookup_request_model.dart';
// import '../../data/base_store_model/base_store_args_model.dart';
// import '../../data/base_store_model/base_store_request_model.dart';
// import '../../data/provider_model/provider_model.dart';
// import '../../data/store_model/store_model.dart';
// import '../../helpers/dialog_helpers.dart';
// import '../../views/home/controller/home_page_view_controller.dart';
// import '../../views/home/nearby_store/controller/nearby_store_view_controller.dart';
// import '../api_responses/api_response.dart';
// import '../dio_exceptions.dart';
// import '../order/order_service_impl.dart';

// mixin BaseController on GetxController {
//   RxBool isLoading = false.obs;
//   RxBool isDataProcessing = false.obs;
//   late int pageIndex;
//   late HomeCategoryModel service;
//   late String serviceName;
//   RxBool isMoreDataAvailable = false.obs;

//   late UserService userService;
//   late LoginRequestModel loginRequest;
//   late Rx<UserData> user;
//   late LoginFormModel loginForm;
//   late SignUpFormModel signUpFormModel;
//   late SignUpRequestModel signUpRequest;
//   late AuthService authService;
//   late StoreService storeService;
//   late OrderService orderService;

//   RxBool isSearchingAddress = false.obs;
//   late LocationService locationService;
//   late PlaceModel? placeDetails;
//   late ScrollController scrollController;
//   late RxBool isExpanded;
//   late RxDouble opacity;
//   late PushNotificationService pushNotificationService;
//   @Deprecated("use [baseProviderList] instead")
//   late RxList<BaseStoreArgsModel> baseStoreStoreList;
//   late RxList<BaseProviderArgsModel> baseProviderList;
//   late DataLookupService dataLookupService;
//   var obsSecureText = true.obs;

//   var obsSecureText2 = true.obs;

//   showLoading() {
//     isLoading(true);
//   }

//   hideLoading() {
//     isLoading(false);
//   }

//   showDioErrorDialog({required DioError e}) async {
//     final error = DioExceptions.fromDioError(e);
//     if (kDebugMode) {
//       debugPrint(error.baseResponse.message);
//     }
//     if (error.baseResponse.error == "session expired") {
//       // authService.logout();
//       // Get.back();
//       // return;
//     }
//     DialogHelpers.getInstance()!.showSnackBarGetx(
//         content: error.baseResponse.error ??
//             AppLocalizations.of(Get.context!)!.something_went_wrong,
//         responseMessage: ResponseMessage.error);
//     // Get.back(closeOverlays: true);
//     return;
//   }

//   showApiErrorDialog({required BaseModel response}) {
//     if (kDebugMode) {
//       debugPrint(response.error);
//     }
//     final errors = ApiResponse.fromApiResponse(response);
//     DialogHelpers.getInstance()!.showSnackBarGetx(
//       content: errors.message,
//       responseMessage: ResponseMessage.error,
//     );
//     return;
//   }

//   showErrorDialog({required String errorMessage}) {
//     if (kDebugMode) {
//       debugPrint(errorMessage);
//     }
//     DialogHelpers.getInstance()!.showSnackBarGetx(
//       content: kDebugMode
//           ? errorMessage
//           : AppLocalizations.of(Get.context!)!.something_went_wrong,
//       responseMessage: ResponseMessage.error,
//     );
//     return;
//   }

//   showSnackBar({required String message}) {
//     DialogHelpers.getInstance()!.showSnackBarGetx(
//       content: message,
//       responseMessage: ResponseMessage.warning,
//       position: SnackPosition.TOP,
//       style: SnackStyle.GROUNDED,
//     );
//     return;
//   }

//   showSuccessDialog({required String message, bool routeBack = false}) async {
//     DialogHelpers.getInstance()!.showSnackBarGetx(
//       content: message,
//       responseMessage: ResponseMessage.success,
//     );
//     if (routeBack) {
//       await Future.delayed(
//           const Duration(seconds: Constants.snackBarDuration - 2));
//       Get.back(closeOverlays: true);
//     }
//     return;
//   }

//   /// LOCATION
//   ///
//   /// GET CURRENT LOCATION
//   void getCurrentLocation(TextEditingController editingController) async {
//     try {
//       isSearchingAddress(true);
//       placeDetails = await locationService.getAddressByLatLng();
//       if (placeDetails == null) {
//         showErrorDialog(errorMessage: "something went wrong");
//         return null;
//       }
//       // isSearchingAddress(false);
//       editingController.text = Utils().buildAddressData(placeDetails);
//       // return Utils().buildAddressData(placeDetails);
//     } catch (e) {
//       showErrorDialog(errorMessage: e.toString());
//       await Future.delayed(const Duration(seconds: 4));
//       if (e.toString() ==
//           "Location permissions are permanently denied, we cannot request permissions.") {
//         locationService.openAppSetting();
//       }
//     } finally {
//       isSearchingAddress(false);
//     }
//     return null;
//   }

//   bool isResponseSuccess(BaseModel response) {
//     final apiResponse = ApiResponse.fromApiResponse(response);
//     return apiResponse.isSuccess;
//   }

//   void showPlacesSearch(BuildContext context,
//       [TextEditingController? controller,
//       String? location,
//       bool storeAsCurrentLocation = false]) async {
//     if (controller == null) {
//       assert(location != null);
//     }

//     final result = await showSearch(
//       context: context,
//       delegate: AddressSearch(locationService),
//     );
//     isSearchingAddress(true);
//     if (result != null) {
//       placeDetails =
//           await locationService.getPlaceDetailFromId(result.placeId!);
//       final locationData = Utils().buildAddressData(placeDetails);
//       if (location != null) {
//         Get.find<HomePageViewController>().selectedLocationName.value =
//             locationData;
//       } else {
//         controller!.text = Utils().buildAddressData(placeDetails);
//       }
//       if (storeAsCurrentLocation) {
//         Position position = Position(
//           longitude: placeDetails!.longitude!,
//           latitude: placeDetails!.latitude!,
//           timestamp: DateTime.now(),
//           accuracy: 0.0,
//           altitude: 0.0,
//           heading: 0.0,
//           speed: 0.0,
//           speedAccuracy: 0.0,
//         );
//         Get.find<LocationServiceImpl>().selectedLocation = position.obs;
//         Get.find<LocationServiceImpl>().selectedLocationType =
//             SelectedLocationType.searchLocation.obs;
//         update();
//         Get.find<NearByStoreViewController>().getNearByProvider(clear: true);
//         Get.back();
//       }
//     }
//     isSearchingAddress(false);
//     return null;
//   }

//   bool validForm({required GlobalKey<FormState> formKey}) {
//     final isValid = formKey.currentState!.validate();
//     if (isValid) {
//       formKey.currentState!.save();
//     }
//     return isValid;
//   }

//   paginate<T>({required Future<void> Function() loadMore}) async {
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.position.pixels) {
//         pageIndex++;
//         loadMore();
//       }
//     });
//   }

//   void isSliverAppBarExpanded() {
//     isExpanded.value = !(scrollController.hasClients &&
//         scrollController.offset > (Get.height * .4 - kToolbarHeight));
//   }

//   void handleOpacity() {
//     opacity.value = 1 -
//         (Get.height * .4 - (scrollController.offset + kToolbarHeight)) /
//             Get.height *
//             4;
//     if (opacity > 1) {
//       opacity.value = 1;
//     } else if (opacity < 0) {
//       opacity.value = 0;
//     }
//   }

//   Future<T?> request<T extends BaseModel>(
//     Future<T> data, [
//     bool hasLoading = true,
//   ]) async {
//     if (hasLoading) {
//       showLoading();
//     }
//     try {
//       final response = await data;
//       final apiResponse = ApiResponse.fromApiResponse(response);
//       if (apiResponse.isSuccess) {
//         return response;
//       }
//       showApiErrorDialog(response: response);
//     } on DioError catch (e) {
//       showDioErrorDialog(e: e);
//     } catch (e) {
//       showErrorDialog(errorMessage: e.toString());
//     } finally {
//       if (hasLoading) {
//         hideLoading();
//       }
//     }
//     return null;
//   }

//   @Deprecated("user [getProvider] instead")
//   Future<List<BaseStoreArgsModel>> getStore({
//     bool clear = false,
//     String tag = "",
//     required List<StoreModel> storeList,
//     required List<BaseStoreArgsModel> baseStoreStoreList,
//     required BaseStoreRequestModel baseStoreRequestModel,
//     required StoreResultType storeResultType,
//     Axis scrollDirection = Axis.horizontal,
//   }) async {
//     if (clear) {
//       storeList.clear();
//       baseStoreStoreList.clear();
//     }
//     final response = await request(
//       storeService.getStore(
//         baseStoreRequestModel: baseStoreRequestModel,
//         storeResultType: storeResultType,
//       ),
//     );
//     if (response == null) {
//       return [];
//     }
//     storeList.addAll(response.list ?? []);
//     baseStoreStoreList.addAll(
//       BaseStoreArgsModel.fromStoreModel(
//         list: storeList,
//         typeId: baseStoreRequestModel.typeId!,
//         scrollDirection: scrollDirection,
//       ),
//     );
//     return baseStoreStoreList;
//   }

//   Future<List<DataLookupModel>> getDataLookUp(String dataLookUpType,
//       [String? lookupValue]) async {
//     try {
//       final BaseDataLookupRequestModel dataLookupRequestModel =
//           BaseDataLookupRequestModel(type: dataLookUpType);
//       final response = await dataLookupService.getLookups(
//         request: dataLookupRequestModel,
//       );
//       if (isResponseSuccess(response)) {
//         List<DataLookupModel> dataLookupList =
//             List<DataLookupModel>.empty(growable: true);
//         if (lookupValue != null) {
//           final List<DataLookupModel?>? list = response.data?.dataLookupList;
//           if (list != null && list.isNotEmpty) {
//             final DataLookupModel? dataLookupModel = list.firstWhereOrNull(
//               (lookup) => lookup?.value == lookupValue,
//             );
//             if (dataLookupModel != null) {
//               dataLookupList.add(dataLookupModel);
//             }
//           }
//         } else {
//           dataLookupList.addAll(response.data!.dataLookupList);
//         }
//         return dataLookupList;
//       } else {
//         showApiErrorDialog(response: response);
//       }
//     } on DioError catch (e) {
//       showDioErrorDialog(e: e);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return [];
//   }

//   Future<List<BaseProviderArgsModel>> getProviders({
//     bool clear = false,
//     String tag = "",
//     required List<ProviderModel> providerList,
//     required List<BaseProviderArgsModel> baseStoreStoreList,
//     required BaseProviderRequestModel baseProviderRequestModel,
//     required StoreResultType storeResultType,
//     Axis scrollDirection = Axis.horizontal,
//   }) async {
//     if (clear) {
//       providerList.clear();
//       baseStoreStoreList.clear();
//     }
//     final response = await request(
//       storeService.getProvider(
//         baseProviderRequestModel: baseProviderRequestModel,
//         storeResultType: storeResultType,
//       ),
//     );
//     if (response == null) {
//       return [];
//     }
//     providerList.addAll(response.data?.providers ?? []);
//     baseStoreStoreList.addAll(
//       BaseProviderArgsModel.fromProviderModelList(
//         list: providerList,
//         serviceId: baseProviderRequestModel.serviceId!,
//         scrollDirection: scrollDirection,
//       ),
//     );
//     return baseStoreStoreList;
//   }

//   Future<BaseProviderArgsModel?> getProvider({
//     required BaseProviderRequestModel baseProviderRequestModel,
//     required StoreResultType storeResultType,
//     Axis scrollDirection = Axis.horizontal,
//   }) async {
//     BaseProviderArgsModel baseProvider = new BaseProviderArgsModel();
//     final response = await request(
//       storeService.getProvider(
//         baseProviderRequestModel: baseProviderRequestModel,
//         storeResultType: storeResultType,
//       ),
//     );

//     if (response?.data?.provider == null) {
//       return null;
//     }
//     ProviderModel? provider = response?.data?.provider;
//     baseProvider = BaseProviderArgsModel.fromProviderModel(
//       providerModel: provider!,
//       serviceId: baseProviderRequestModel.serviceId!,
//       scrollDirection: scrollDirection,
//     );
//     return baseProvider;
//   }

//   @override
//   void onInit() {
//     isLoading = false.obs;
//     isExpanded = true.obs;
//     opacity = 0.0.obs;
//     pushNotificationService = Get.find<PushNotificationServiceImpl>();
//     locationService = Get.find<LocationServiceImpl>();
//     userService = Get.find<UserServiceImpl>();
//     authService = Get.find<AuthServiceImpl>();
//     scrollController = ScrollController()
//       ..addListener(() {
//         isSliverAppBarExpanded();
//         handleOpacity();
//       });
//     baseStoreStoreList = List<BaseStoreArgsModel>.empty(growable: true).obs;
//     baseProviderList = List<BaseProviderArgsModel>.empty(growable: true).obs;
//     super.onInit();
//   }

//   void togglePasswordVisibility() {
//     obsSecureText.toggle();
//   }

//   void togglePassword2Visibility() {
//     obsSecureText2.toggle();
//   }

//   // @override
//   // void dispose() {
//   //   scrollController.dispose();
//   //   super.dispose();
//   // }

//   // @override
//   // void onClose() {
//   //   scrollController.dispose();
//   //   super.onClose();
//   // }
// }
