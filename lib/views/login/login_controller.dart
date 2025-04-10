import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/user/user_model.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../services/secure_storage/secure_storage_service_impl.dart';

class LoginController extends GetxController {
  late TextEditingController phoneController, pinController;
  late GlobalKey<FormState> formKey;
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  final _secureServiceImpl = Get.find<SecureStorageServiceImpl>();
  final isLoading = false.obs;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  void login() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);
    try {
      UserModel request = UserModel(
        phoneNumber: phoneController.text.trim(),
        pin: int.parse(pinController.text.trim()),
      );
      final response = await _authServiceImpl.login(request: request);
      inspect(response);
      if (response.isFailure) {
        if (response.message == "lab Assistant is not Approved by Admin") {
          Get.offAllNamed(Routes.loginlabassistant, arguments: {
            'phoneNumber': phoneController.text.trim(),
            'pin': int.parse(pinController.text.trim()),
          });
        }
        showWarningDialog(Get.context!);
        //  Get.snackbar("Warning", "You Are Not Approved");
      } else {
        await _secureServiceImpl.write(
            key: 'authToken', value: response.authUser!.authToken!);
        await _secureServiceImpl.write(
            key: 'userId', value: response.authUser!.user!.id!.toString());
        //Get.offAllNamed(Routes.wrapper);

        if (response.authUser!.type == 'User') {
          Get.offAllNamed(Routes.wrapper, arguments: {'userType': "User"});
        } else if (response.authUser!.type == 'Assistant') {
          Get.offAllNamed(Routes.wrapper, arguments: {'userType': "Assistant"});
        } else {
          Get.snackbar(
              backgroundColor: Colors.red,
              "Warning",
              "Invalid Phone Number or PIN");
        }
      }
    } catch (e) {
      Get.snackbar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.error,
            size: 35,
          ),
          "Warning",
          "Wrong Phone Number or PIN");
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}

void showWarningDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 16,
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 50,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 16),
              const Text(
                "Warning",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your profile was sent for review , We will approve it in 12 - 24 hours.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
