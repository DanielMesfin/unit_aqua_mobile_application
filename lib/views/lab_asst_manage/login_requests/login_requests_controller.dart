import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/lab_assistant/lab_assistant_pending.dart';
import '../../../model/lab_assistant/lab_assistant_update.dart';
import '../../../services/auth/auth_service_impl.dart';
import '../../../services/lab_assistant/lab_assistant_service_impl.dart';

class LoginRequestsController extends GetxController {
  late GlobalKey<FormState> formKey;
  // final authServiceImpl = Get.find<AuthServiceImpl>();
  final LabAssistantServiceImpl labAssistantService =
      Get.put(LabAssistantServiceImpl());

  final authServiceImpl = Get.put(AuthServiceImpl());

  final isLoading = false.obs;

  Future<LabAssistantPending> getPendingLabAssistants() async {
    isLoading(true);
    int adminUserId = authServiceImpl.userData?.id as int;
    try {
      final response = await labAssistantService.getPendingLabAssistants(
        userId: adminUserId,
      );
      inspect(response);

      if (response.statusCode != 200) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        //Get.toNamed(Routes.loginrequests, arguments: response);
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
      print("############################### $isLoading");
    }
  }

  Future<void> updateLabAssistant(
      int labassistuserId, String currentStatus) async {
    isLoading(true);

    final userId = labassistuserId;
    final status = currentStatus;

    print("########################");
    print(userId);
    print(status);

    try {
      final response = await labAssistantService.updateLabAssist(
        userId: userId,
        labassistant: LabAssistantUpdate(
          name: null,
          phoneNumber: null,
          qualification: null,
          pin: null,
          status: status,
        ),
      );

      inspect(response);
      print(response);
      Get.snackbar(
        "Request",
        "Updated Successfully",
      );
      //getAllLabAssistants();
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
}
