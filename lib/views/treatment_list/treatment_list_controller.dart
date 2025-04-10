import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/enums/api_enums.dart';
import 'package:unity_labs/helpers/dialog_helpers.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';

import '../../services/treatment/treatment_service_impl.dart';

class TreatmentListController extends GetxController {
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  final List<TreatmentModel> searchList =
      List<TreatmentModel>.empty(growable: true).obs;
  final List<TreatmentModel> treatmenList =
      List<TreatmentModel>.empty(growable: true).obs;
  final isLoading = true.obs;
  final isButtonLoading = false.obs;
  final isSearched = false.obs;
  late TextEditingController searchController;
  late int sectorId;
  late int indexValue;
  String type = '';
  Future<void> getAllTreatments(int sectorId, String type) async {
    isLoading(true);
    try {
      treatmenList.clear();
      final response = await _treatmentServiceImpl.getAllTreatments(
          sectorId: sectorId, type: type);
      treatmenList.addAll(response.treatments ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> importTreatment(int treatmentId) async {
    isButtonLoading(true);
    try {
      final response =
          await _treatmentServiceImpl.importTreatment(treatmentId: treatmentId);

      if (!response.isFailure) {
        DialogHelpers().showSnackBarGetx(
          content: "Imported",
          responseMessage: ResponseMessage.success,
        );
      }
    } catch (e) {
      inspect(e);
    } finally {
      isButtonLoading(false);
    }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    if (Get.arguments != null) {
      indexValue = Get.arguments['index'];
      sectorId = Get.arguments['id'];
      type = Get.arguments['type'];
      getAllTreatments(sectorId, type);
    }
    super.onInit();
  }

  void searchTreatment() {
    searchList.clear();
    if (searchController.text.isNotEmpty && searchController.text.length > 2) {
      isSearched(true);
      searchList.addAll(treatmenList.where((trt) =>
          trt.name!.toLowerCase() == searchController.text.toLowerCase()));
    } else {
      isSearched(false);
    }
  }
}
