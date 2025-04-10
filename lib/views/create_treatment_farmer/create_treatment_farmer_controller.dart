import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/enums/api_enums.dart';
import 'package:unity_labs/helpers/dialog_helpers.dart';
import 'package:unity_labs/model/treatment/treatment_farmer_model.dart';

import '../../services/treatment/treatment_service_impl.dart';

class CreateTreatmentFramerController extends GetxController {
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  late GlobalKey<FormState> formKey;
  final isLoading = false.obs;
  late TextEditingController nameOne,
      nameTwo,
      nameThree,
      tankOne,
      tankTwo,
      tankThree,
      phoneOne,
      phoneTwo,
      phoneThree;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    nameOne = TextEditingController();
    nameTwo = TextEditingController();
    nameThree = TextEditingController();
    tankOne = TextEditingController();
    tankTwo = TextEditingController();
    tankThree = TextEditingController();
    phoneOne = TextEditingController();
    phoneTwo = TextEditingController();
    phoneThree = TextEditingController();
    super.onInit();
  }

  Future<void> createTreatmentFramer() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);
    try {
      TreatmentFarmerModel farmerModel = TreatmentFarmerModel(
        treatmentId: Get.arguments,
        nameOne: nameOne.text.trim(),
        nameTwo: nameTwo.text.trim(),
        nameThree: nameThree.text.trim(),
        tankOne: tankOne.text.trim(),
        tankTwo: tankTwo.text.trim(),
        tankThree: tankThree.text.trim(),
        phoneOne: phoneOne.text.trim(),
        phoneTwo: phoneTwo.text.trim(),
        phoneThree: phoneThree.text.trim(),
      );
      final response = await _treatmentServiceImpl.creatTreatmentFramer(
        treatFarmer: farmerModel,
      );
      if (!response.isFailure) {
        inspect(response);
        Get.back();
        Get.back();
        Get.back();
        DialogHelpers().showSnackBarGetx(
          content: "Thank you for submitting",
          responseMessage: ResponseMessage.success,
        );
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
