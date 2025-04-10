import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/treatment/sector.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';
import 'package:unity_labs/services/treatment/treatment_service_impl.dart';

class TreatmentController extends GetxController
    with GetTickerProviderStateMixin {
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  final List<SectorModel> sectorList =
      List<SectorModel>.empty(growable: true).obs;
  final List<TreatmentModel> treatmentList =
      List<TreatmentModel>.empty(growable: true).obs;
  final isMyTreatment = false.obs;
  final List<TreatmentModel> selectedTreatmentList =
      List<TreatmentModel>.empty(growable: true).obs;
  final isGlobal = true.obs;
  late TabController tabController;
  final isLoading = true.obs;
  final isMyTreatmentLoading = false.obs;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getAllSectors();
    super.onInit();
  }

  Future<void> getAllSectors() async {
    isLoading(true);
    try {
      sectorList.clear();
      final response = await _treatmentServiceImpl.getAllSectors();
      sectorList.addAll(response.sectors ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getMyTreatments() async {
    isMyTreatmentLoading(true);
    try {
      treatmentList.clear();
      final response = await _treatmentServiceImpl.getMyTreatments();
      treatmentList.addAll(response.treatments ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isMyTreatmentLoading(false);
    }
  }

  changeTab(int i) {
    currentIndex.value = i;
    print("change tab");
    print(i);
    switch (i) {
      case 0:
        getMyTreatments();
        break;
      case 1:
        getMyTreatments();
        break;
      case 2:
        getMyTreatments();
    }
  }
}
