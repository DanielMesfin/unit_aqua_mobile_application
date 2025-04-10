
import 'package:get/get.dart';
import 'package:unity_labs/model/user/user_response.dart';
import 'package:unity_labs/model/user/user_model.dart';
import 'package:unity_labs/model/auth/auth_response.dart';
import 'package:unity_labs/routes/app_pages.dart';
import '../../model/base/base_model.dart';
import '../apis.dart';
import '../http/http_services.dart';
import '../secure_storage/secure_storage_service.dart';
import '../secure_storage/secure_storage_service_impl.dart';
import 'auth_service.dart';

enum LoginType { login, socialLogin }

class AuthServiceImpl implements AuthService {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  UserModel? userData;
  @override
  Future<UserResponse> getProfile() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.user,
      headerType: HeaderType.secured,
    );
    final parsedResponse = UserResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<AuthResponse> login({required UserModel request}) async {
    final response = await _httpService.postRequest(
      data: await request.toJson(),
      urlPath: Apis.login,
      headerType: HeaderType.none,
    );
    final parsedResponse = AuthResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<AuthResponse> signup({required UserModel user}) async {
    print(user.labReportImage);
    final response = await _httpService.postRequest(
      data: await user.toJson(),
      urlPath: Apis.signup,
      headerType: HeaderType.file,
    );
    final parsedResponse = AuthResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> changePassword(
      {required String phoneNumber, required String pin}) async {
    final response = await _httpService.postRequest(
      data: {
        "phoneNumber": phoneNumber,
        "pin": pin,
      },
      urlPath: Apis.forgot,
      headerType: HeaderType.none,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<void> logout({required int uiserId}) async {
    final response = await _httpService.putRequest(
      data: {},
      urlPath: "${Apis.user}/logout/$uiserId",
      headerType: HeaderType.none,
    );
    final SecureStorageService secureStorageService =
        Get.find<SecureStorageServiceImpl>();
    Get.offAllNamed(Routes.login);
    await secureStorageService.clearAll();
  }

  @override
  Future<UserResponse> updateProfile(
      {required int userId, required UserModel user}) async {
        print("These is image path");
            print(user.labReportImage);

    final response = await _httpService.putRequest(
      urlPath: '${Apis.updateProfile}$userId',
      data: await user.toJson(),
      headerType: HeaderType.file,

    );
    final parsedResponse = UserResponse.fromJson(response.data);
    return parsedResponse;
  }

  //
  // final RxBool _isAuthenticated = false.obs;
  // final RxBool _isCheckingAuth = true.obs;
  // final RxBool _isOnBoardingPageShown = false.obs;
  // late final Rx<UserModel> userData;
  // late final Rx<UserData> userDataModel = UserData.create().obs;

  // final SecureStorageService secureStorageService =
  //     Get.find<SecureStorageServiceImpl>();
  // @override
  // Future<BaseResponseModel<UserResponseModel>> login({
  //   required LoginRequestModel request,
  //   required LoginType loginType,
  // }) async {
  //   String urlPath = _getUrlByLoginType(loginType);
  //   try {
  //     final response = await _httpService.postRequest(
  //       urlPath: urlPath,
  //       data: request.toJson(),
  //       headerType: HeaderType.none,
  //     );
  //     final parsedResponse = BaseResponseModel.fromJson(
  //         response.data, UserResponseModel.fromJsonModel);
  //     return parsedResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // String _getUrlByLoginType(LoginType loginType) {
  //   late String urlPath;
  //   switch (loginType) {
  //     case LoginType.login:
  //       urlPath = Apis.login;
  //       break;
  //     case LoginType.socialLogin:
  //       urlPath = Apis.socialLogin;
  //       break;
  //     default:
  //   }
  //   return urlPath;
  // }

  // @override
  // Future<BaseResponseModel<UserResponseModel>> signUp(
  //     {required SignUpRequestModel request}) async {
  //   try {
  //     final response = await _httpService.postRequest(
  //       urlPath: Apis.signUp,
  //       data: request.toJson(),
  //       headerType: HeaderType.file,
  //     );

  //     final parsedResponse = BaseResponseModel.fromJson(
  //         response.data, UserResponseModel.fromJsonModel);
  //     return parsedResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<AuthResponse> verifyOTP({required AuthRequest authRequest}) async {
  //   try {
  //     final response = await _httpService.postRequest(
  //       urlPath: Apis.verifyOTP,
  //       data: authRequest.toJson(),
  //       headerType: HeaderType.none,
  //     );

  //     final parsedResponse = AuthResponse.fromJson(response.data);
  //     return parsedResponse;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> init() async {
  //   try {
  //     if (!await _checkIsOnBoardingShown()) {
  //       Get.offAllNamed(Routes.onBoarding);
  //       return;
  //     }
  //     final response = await _httpService.getRequest(
  //       urlPath: Apis.profile,
  //       headerType: HeaderType.secured,
  //     );

  //     final parsedResponse = BaseResponseModel.fromJson(
  //         response.data, UserResponseModel.fromJsonModel);
  //     final String? accessToken = await Get.find<SecureStorageServiceImpl>()
  //         .read(key: Constants.accessTokenKey);
  //     final String? refreshToken = await Get.find<SecureStorageServiceImpl>()
  //         .read(key: Constants.refreshTokenKey);
  //     final authResponse = AuthResponse(
  //       user: parsedResponse.data?.user,
  //       status: parsedResponse.status!,
  //       accessToken: parsedResponse.accessToken ?? accessToken ?? "",
  //       refreshToken: parsedResponse.refreshToken ?? refreshToken ?? "",
  //     );
  //     await processAuthentication(authResponse: authResponse);
  //   } on DioError catch (e) {
  //     logout();
  //     return;
  //   } catch (e) {
  //     logout();
  //     return;
  //   } finally {
  //     _isCheckingAuth(false);
  //   }
  // }

  // @override
  // Future<void> processAuthentication({
  //   AuthResponse? authResponse,
  //   bool goBack = true,
  //   ViewType viewType = ViewType.login,
  // }) async {
  //   if (authResponse == null) {
  //     _isAuthenticated(false);
  //     Get.offAllNamed(Routes.login);
  //     return;
  //   }

  //   UserModel user = authResponse.user!;
  //   userDataModel.value = UserData.fromUserModel(user);

  //   //save access token
  //   await _saveAccessToken(authResponse);
  //   await _saveRefreshToken(authResponse);
  //   //check if email is empty or check if phone number is empty
  //   if (user.isEmailEmpty || user.isPhoneNumberEmpty) {
  //     //route to create profile
  //     return Get.offAllNamed(
  //       Routes.createProfile,
  //       arguments: UserArgsModel(
  //         userData: UserData.fromUserModel(authResponse.detail!),
  //         viewType: viewType,
  //       ),
  //     );
  //   }

  //   //check if first name and last name is empty
  //   if (user.isFirstNameEmpty || user.isLastNameEmpty) {
  //     //route to create profile
  //     return Get.offAndToNamed(
  //       Routes.createProfile,
  //       arguments: UserArgsModel(
  //         userData: UserData.fromUserModel(authResponse.user!),
  //         viewType: viewType,
  //       ),
  //     );
  //   }

  //   Get.offAllNamed(Routes.homeCategory);
  //   //authenticate user
  //   _isAuthenticated(true);

  //   //route to home activity
  //   // if (goBack) {
  //   //   if (viewType == ViewType.login) {
  //   //     Get.offAllNamed(Routes.splashScreen);
  //   //     return;
  //   //   } else {
  //   //     Get.back();
  //   //     return;
  //   //   }
  //   // }
  // }

  // Future<void> _saveAccessToken(AuthResponse authResponse) async {
  //   if (authResponse.accessToken == null) {
  //     return;
  //   }
  //   await secureStorageService.write(
  //       key: Constants.accessTokenKey, value: authResponse.accessToken!);
  // }

  // Future<void> _saveRefreshToken(AuthResponse authResponse) async {
  //   if (authResponse.refreshToken == null) {
  //     return;
  //   }
  //   await secureStorageService.write(
  //     key: Constants.refreshTokenKey,
  //     value: authResponse.refreshToken!,
  //   );
  // }

  // @override
  // RxBool isAuthenticated() {
  //   return _isAuthenticated;
  // }

  // @override
  // RxBool isCheckingAuth() {
  //   return _isCheckingAuth;
  // }

  // Future<bool> _checkIsOnBoardingShown() async {
  //   return await secureStorageService.isExists(key: Constants.onBoarding);
  // }

  // @override
  // RxBool isOnBoardingShown() {
  //   return _isOnBoardingPageShown;
  // }

  // @override
  // Future<void> onBoardingShown() async {
  //   await secureStorageService.write(
  //     key: Constants.onBoarding,
  //     value: "true",
  //   );
  //   _isOnBoardingPageShown(true);
  // }

  // @override
  // void logout({clearAll = false}) async {
  //   if (!clearAll) {
  //     await _clearAccessToken();
  //   } else {
  //     await _clearAllStoredData();
  //   }
  //   _isAuthenticated(false);
  //   Get.offAllNamed(Routes.login);
  //   clearUserDataModel();
  // }

  // Future<void> _clearAccessToken() async {
  //   await secureStorageService.clear(key: Constants.accessTokenKey);
  //   await secureStorageService.clear(key: Constants.refreshTokenKey);
  // }

  // Future<void> _clearAllStoredData() async {
  //   await secureStorageService.clearAll();
  // }

  // @override
  // Rx<UserData> getUserData() {
  //   return userDataModel;
  // }

  // @override
  // void clearUserData() {
  //   userData = UserModel().obs;
  // }

  // @override
  // Rx<UserData> updateUserStateData(UserModel userModel) {
  //   userDataModel.value = UserData.fromUserModel(userModel);
  //   return userDataModel;
  // }

  // @override
  // void clearUserDataModel() {
  //   userDataModel.value = UserData.create();
  // }
}
