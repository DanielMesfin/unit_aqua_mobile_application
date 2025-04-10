import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/views/treatment_list/treatment_list_controller.dart';

import '../../common/enums/api_enums.dart';
import '../../helpers/dialog_helpers.dart';
import '../../model/treatment/create_treatment_model.dart';
import '../../model/treatment/problem_model.dart';
import '../../services/treatment/treatment_service_impl.dart';

class CreateTreatmentController extends GetxController {
  late TextEditingController nameController, descriptionController;
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  final List<ProblemModel> problemList =
      List<ProblemModel>.empty(growable: true).obs;
  List<XFile> images = [];
  final isSaveLoading = false.obs;
  final isLoading = true.obs;
  final isFetched = false.obs;
  final isSuggestLoading = false.obs;
  late int sectorId;
  late int problemId;
  late GlobalKey<FormState> formKey;
  final currentIndex = 0.obs;
  RxString selectedProblem = "".obs;
  String type = '';
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    descriptionController = TextEditingController();

    if (Get.arguments != null) {
      sectorId = Get.arguments['id'];
      type = Get.arguments['type'];
    }
    getAllProblems(sectorId);
    super.onInit();
  }

  Future<void> getAllProblems(int sectorId) async {
    isLoading(true);
    try {
      problemList.clear();
      final response =
          await _treatmentServiceImpl.getAllProblems(sectorId: sectorId);
      problemList.addAll(response.problems ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<TreatmentModel?> createTreatment(bool isSuggest) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    if (!isSuggest) {
      isSaveLoading(true);
    }
    try {
      if(images.length<3){
         Get.snackbar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.red,
            "",
            "Please select at least 3 image ");
      }
      CreateTreatmentModel treatmentModel = CreateTreatmentModel(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        problemId: problemId,
        imageUrl1: images.isEmpty ? null : File(images[0].path),
        imageUrl2: images.length <= 1 ? null : File(images[1].path),
        imageUrl3: images.length <= 2 ? null : File(images[2].path),
      );
      final treatment = await _treatmentServiceImpl.createTreatment(
          treatment: treatmentModel);
      final listController = Get.find<TreatmentListController>();
      listController.getAllTreatments(
        sectorId,
        type,
      );
      if (!isSuggest) {
        Get.back();
      }
      return treatment;
    } catch (e) {
      inspect(e);
    } finally {
      isSaveLoading(false);
    }
    return null;
  }

  void suggestGlobalTreatment() async {
    try {
      isSuggestLoading(true);
      final treatment = await createTreatment(true);
      inspect(treatment);
      if (treatment != null) {
        Get.snackbar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
            "Treatment Suggestion",
            "Treatment Suggestion sent successfully");
        final listController = Get.find<TreatmentListController>();
        listController.getAllTreatments(
          sectorId,
          type,
        );
        Get.toNamed(Routes.treatmentList);
      }
    } catch (e) {
      inspect(e);
    } finally {
      isSuggestLoading(false);
    }
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      if (selectedImages.length > 3) {
        return DialogHelpers().showSnackBarGetx(
          content: "Please select only 3 images",
          responseMessage: ResponseMessage.warning,
        );
      }
      images = selectedImages;
      isFetched(true);
    }
  }
}
