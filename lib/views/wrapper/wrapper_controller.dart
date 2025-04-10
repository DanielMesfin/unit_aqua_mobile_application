import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/enums/api_enums.dart';
import 'package:unity_labs/helpers/dialog_helpers.dart';
import 'package:unity_labs/services/secure_storage/secure_storage_service_impl.dart';
import '../../routes/app_pages.dart';
import '../../services/auth/auth_service_impl.dart';

class WrapperController extends GetxController {
  final isCheckingAuth = false.obs;
  final isAuthenticated = false.obs;
  final _secureServiceImpl = Get.find<SecureStorageServiceImpl>();
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  //String userType = 'unauthorized';

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  void checkAuth() async {
    // await _secureServiceImpl.clearAll();
    await fetchProfile();
  }

  Future<void> fetchProfile() async {
    isCheckingAuth(true);
    final authToken = await _secureServiceImpl.read(key: "authToken");

    if (authToken == null) {
      isAuthenticated(false);
      isCheckingAuth(false);
      Get.offAllNamed(Routes.login);
      return;
    }

    try {
      final response = await _authServiceImpl.getProfile();
      _authServiceImpl.userData = response.userModel!;
      isAuthenticated(true);
      isCheckingAuth(false);
      //Get.offAllNamed(Routes.home);

      if (_authServiceImpl.userData?.userId == null) {
        Get.offAllNamed(Routes.home, arguments: {'userType': "User"});
      } else if (_authServiceImpl.userData?.userId != null &&
          _authServiceImpl.userData?.status == "Approved") {
        Get.offAllNamed(Routes.home, arguments: {'userType': "Assistant"});
      } else if (_authServiceImpl.userData?.userId != null) {
        final phoneNumber = _authServiceImpl.userData?.phoneNumber;
        final pin = _authServiceImpl.userData?.pin;

        Get.offAllNamed(Routes.loginlabassistant, arguments: {
          'userType': "Assistant",
          'phoneNumber': phoneNumber,
          'pin': pin
        });
      }
    } on DioException catch (e) {
      DialogHelpers().showSnackBarGetx(
        content: e.response!.data["message"],
        responseMessage: ResponseMessage.error,
      );
      inspect(e);
      Get.offAllNamed(Routes.login);
    } catch (e) {
      inspect(e);
      Get.offAllNamed(Routes.login);
    } finally {
      isCheckingAuth(false);
    }
  }
}
