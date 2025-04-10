import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../services/auth/auth_service_impl.dart';

class ChangePasswordController extends GetxController {
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  late TextEditingController pinController;
  late GlobalKey<FormState> formKey;
  final isLoading = false.obs;
  late String phone;

  onSumbit() {}
  @override
  void onInit() {
    if (Get.arguments != null) {
      phone = Get.arguments;
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    super.onInit();
  }

  void changePassword() async {
    isLoading(true);
    try {
      final response = await _authServiceImpl.changePassword(
        phoneNumber: phone,
        pin: pinController.text.trim(),
      );
      if (!response.isFailure) {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
