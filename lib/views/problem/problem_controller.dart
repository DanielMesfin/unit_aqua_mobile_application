import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/treatment/problem_model.dart';

import '../../services/treatment/treatment_service_impl.dart';

class ProblemController extends GetxController {
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  final List<ProblemModel> problemList =
      List<ProblemModel>.empty(growable: true).obs;
  final List<ProblemModel> searchList =
      List<ProblemModel>.empty(growable: true).obs;
  final isLoading = true.obs;
  final isSearched = false.obs;
  late TextEditingController searchController;
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

  @override
  void onInit() {
    searchController = TextEditingController();
    if (Get.arguments != null) {
      getAllProblems(Get.arguments);
    }
    super.onInit();
  }

  void searchProblem() {
    searchList.clear();
    if (searchController.text.isNotEmpty && searchController.text.length > 2) {
      isSearched(true);
      searchList.addAll(problemList.where((prblm) =>
          prblm.name!.toLowerCase() == searchController.text.toLowerCase()));
    } else {
      isSearched(false);
    }
  }
}
