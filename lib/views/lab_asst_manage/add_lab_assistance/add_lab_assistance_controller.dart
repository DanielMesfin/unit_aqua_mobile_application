import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/lab_assistant/lab_assistant_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service_impl.dart';
import '../../../services/lab_assistant/lab_assistant_service_impl.dart';

class AddLabAssistanceController extends GetxController {
  late GlobalKey<FormState> formKey;
  final authServiceImpl = Get.find<AuthServiceImpl>();
  final LabAssistantServiceImpl _labAssistantService =
      Get.put(LabAssistantServiceImpl());

  final isLoading = false.obs;
  RxString selectedQualification = ''.obs;
  late TextEditingController asstNameController,
      mobilenoController,
      pinController;
  // final String qualificationController = ''.obs;

  List<String> qualification = [
    "BSc",
    "MSc",
    "Diploma",
    "Phd",
    "BA",
    "MA",
    "MBA",
    "High School",
    "No"
  ];

  @override
  void onInit() {
    super.onInit();

    formKey = GlobalKey<FormState>();

    asstNameController = TextEditingController();
    // qualificationController = TextEditingController();
    mobilenoController = TextEditingController();
    pinController = TextEditingController();
  }

  void registerLabAssistant() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);
    int adminUserId = authServiceImpl.userData?.id as int;
    String adminLabName = authServiceImpl.userData?.labName ?? "";

    try {
      LabAssistantModel labAssistant = LabAssistantModel(
        name: asstNameController.text.trim(),
        phoneNumber: mobilenoController.text.trim(),
        pin: pinController.text.trim(),
        qualification: selectedQualification.value,
        labName: adminLabName,
        userId: adminUserId,
      );

      final response = await _labAssistantService.addLabAssistant(
          labAssistant: labAssistant);

      if (response.statusCode != 200) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        Get.toNamed(Routes.managelabassistant, arguments: response);
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
