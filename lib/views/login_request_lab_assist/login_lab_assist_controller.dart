import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../model/user/user_model.dart';
import '../../routes/app_pages.dart';
import '../../services/auth/auth_service_impl.dart';
import '../../services/lab_assistant/lab_assistant_service_impl.dart';
import '../../services/secure_storage/secure_storage_service_impl.dart';

class LoginLabAssistController extends GetxController {
  late GlobalKey<FormState> formKey;
  // final authServiceImpl = Get.find<AuthServiceImpl>();
  final LabAssistantServiceImpl labAssistantService =
      Get.put(LabAssistantServiceImpl());

  //final authServiceImpl = Get.put(AuthServiceImpl());

  final isLoading = false.obs;
  final status = "Wait until Admin approves you".obs;
  final showManualCheckButton = true.obs;
  final countdown = 5;

  final _authServiceImpl = Get.find<AuthServiceImpl>();
  final _secureServiceImpl = Get.find<SecureStorageServiceImpl>();

  Future<LabAssistantDetailResponse> getLabAssistantById(int id) async {
    isLoading(true);
    try {
      final response = await labAssistantService.getLabAssistantByID(id: id);
      inspect(response);

      if (response.statusCode != 200) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        //
      }

      return response;
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(
        e.response!.data["RESPONSE"] ?? "",
        e.response!.data["message"] ?? "",
      );

      rethrow;
    } catch (e) {
      inspect(e);

      rethrow;
    } finally {
      isLoading(false);
    }
  }

  void checkStatus() {
    final phoneNumber = Get.arguments['phoneNumber'];
    final pin = Get.arguments['pin'];

    status.value = "Manual status check in progress...";
    login(phoneNumber: phoneNumber, pin: pin);
    showManualCheckButton.value = false;
    Future.delayed(const Duration(seconds: 5), () {
      showManualCheckButton.value = true;
    });
  }

  void login({required String phoneNumber, required int pin}) async {
    isLoading(true);
    try {
      UserModel request = UserModel(
        phoneNumber: phoneNumber,
        pin: pin,
      );
      print(phoneNumber);
      print(pin);
      final response = await _authServiceImpl.login(request: request);
      inspect(response);
      if (response.isFailure) {
        if (response.message == "lab Assistant is not Approved by Admin") {
          Get.offAllNamed(Routes.login);
        }
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        await _secureServiceImpl.write(
            key: 'authToken', value: response.authUser!.authToken!);
        await _secureServiceImpl.write(
            key: 'userId', value: response.authUser!.user!.id!.toString());
        //Get.offAllNamed(Routes.wrapper);
        // Check user type and route accordingly
        if (response.authUser!.type == 'User') {
          Get.offAllNamed(Routes.wrapper, arguments: {'userType': "User"});
        } else if (response.authUser!.type == 'Assistant') {
          Get.offAllNamed(Routes.home, arguments: {'userType': "Assistant"});
        }
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
