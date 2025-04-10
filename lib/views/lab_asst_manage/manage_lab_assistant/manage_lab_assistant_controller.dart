import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../../model/lab_assistant/lab_assistant_list_response.dart';
import '../../../model/lab_assistant/lab_assistant_update.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth/auth_service_impl.dart';
import '../../../services/lab_assistant/lab_assistant_service_impl.dart';

class ManageLabAssistantController extends GetxController {
  late GlobalKey<FormState> formKey;
  // final authServiceImpl = Get.find<AuthServiceImpl>();
  final LabAssistantServiceImpl labAssistantService =
      Get.put(LabAssistantServiceImpl());

  final authServiceImpl = Get.put(AuthServiceImpl());

  final isLoading = false.obs;

  RxString selectedQualification = ''.obs;

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

  late TextEditingController nameController,
      phoneNumberController,
      qualificationController,
      pinController,
      statusController;

  @override
  void onInit() {
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    qualificationController = TextEditingController();
    pinController = TextEditingController();
    statusController = TextEditingController();

    super.onInit();
  }

  Future<LabAssistantListResponse> getAllLabAssistants() async {
    isLoading(true);
    int adminUserId = authServiceImpl.userData?.id as int;
    try {
      final response = await labAssistantService.getAllLabAssistants(
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
    }
  }

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

  Future<void> updateLabAssistant(int labassistId) async {
    isLoading(true);

    final userId = labassistId;
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;
    final qualification = qualificationController.text;
    //final statusController = statusController.text;
    int? pin;

    try {
      pin = int.parse(pinController.text);
    } catch (e) {
      print('Error parsing pin: $e');
    }

    try {
      final response = await labAssistantService.updateLabAssist(
        userId: userId,
        labassistant: LabAssistantUpdate(
          name: name,
          phoneNumber: phoneNumber,
          qualification: qualification,
          pin: pin,
          status: "Default",
        ),
      );

      inspect(response);
      print(response);
      Get.snackbar(
        "Updated",
        "Assistant Info Updated",
      );
      getAllLabAssistants();
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

  void viewAssistantDetails(BuildContext context, String assistantId) async {
    try {
      final response = await getLabAssistantById(int.parse(assistantId));
      Get.toNamed(Routes.viewlabassistant, arguments: response);
    } catch (e) {
      print("Error getting lab assistant details: $e");
    }
  }

  void editAssistant(BuildContext context, String assistantId) async {
    try {
      final response = await getLabAssistantById(int.parse(assistantId));

      Get.toNamed(Routes.editlabassistant, arguments: response);
    } catch (e) {
      print("Error getting lab assistant details: $e");
    }
  }

  void deleteAssistantPopUp(
      BuildContext context, String assistantId, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onConfirm();

                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAssistant(String assistantId) async {
    isLoading(true);
    try {
      final response =
          await labAssistantService.deleteAssistant(userId: assistantId);

      if (response.statusCode != 200) {
        Get.back();
      } else {
        //getAllLabAssistants();
        //isLoading(true);

        getAllLabAssistants();
        Get.snackbar("Success", "Lab Assistant Deleted Successfully");
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
