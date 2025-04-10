import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_party_login/third_party_login_with_phone_number.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../common/enums/api_enums.dart';
import '../../helpers/dialog_helpers.dart';

class ForgotPasswordController extends GetxController {
  late TextEditingController phoneController, otpController;
  late GlobalKey<FormState> formKey;
  late ThirdPartyLoginWithPhoneNumber thirdPartyLoginWithPhoneNumber;
  final isLoading = false.obs;
  final isOtpLoading = false.obs;

  onSumbit() {}
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    otpController = TextEditingController();
    thirdPartyLoginWithPhoneNumber = ThirdPartyLoginWithPhoneNumber();
    super.onInit();
  }

  void sendCode() async {
    isOtpLoading(true);
    try {
      await thirdPartyLoginWithPhoneNumber.init(
        phoneNumber: "+251${phoneController.text.trim()}",
        timeOut: 60,
      );
    } catch (e) {
      inspect(e);
    } finally {
      isOtpLoading(false);
    }
  }

  startVerification() async {
    if (isLoading.isTrue) {
      return;
    }
    isLoading(true);
    try {
      final userCredential = await thirdPartyLoginWithPhoneNumber.verifyCode(
        smsCode: otpController.text.trim(),
      );
      if (userCredential != null) {
        inspect(userCredential);
        Get.toNamed(
          Routes.createPassword,
          arguments: phoneController.text.trim(),
        );
      }
    } catch (e) {
      inspect(e);
      DialogHelpers.getInstance()!.showSnackBarGetx(
        content: "Verification failed",
        responseMessage: ResponseMessage.error,
      );
    } finally {
      isLoading(false);
    }
  }
}
