import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/enums/repor_type.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';

import '../../../model/completed/completed_list.dart';
import '../../../services/completed/completed_service_impl.dart';

class TankReportController extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final currentReport = Rx<dynamic>(null);
  final currentReportType = ReportType.water.obs;

  final isLoading = false.obs;
  int tankId = 0;
  int testId = 0;
  int id = Get.arguments['id'];
  String formType = Get.arguments['formType'].toLowerCase();
  final isdowloding = false.obs;
  late PlanktonController planktonController;
  @override
  void onInit() {
    super.onInit();
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    planktonController = Get.put(PlanktonController());
    if (formType == 'water') {
      planktonController.faching(testId);
    }
    id = Get.arguments['id'];
    formType = Get.arguments['formType'];
    formType = convertToApiResponseFormat(formType);
    typeUpdeter(formType);
    // if (Get.arguments['formType'] != null) {
    //   String formType = Get.arguments['formType'];
    //   switch (formType) {
    //     case 'water':
    //       currentReportType.value = ReportType.water;

    //       break;
    //     case 'fish':
    //       currentReportType.value = ReportType.fish;

    //       break;
    //     case 'shrimp':
    //       currentReportType.value = ReportType.shrimp;
    //       break;

    //     case 'soil':
    //       currentReportType.value = ReportType.soil;
    //       break;
    //     case 'pcr':
    //       currentReportType.value = ReportType.pcr;
    //       break;
    //     case 'feed':
    //       currentReportType.value = ReportType.feed;
    //       break;
    //     case 'culture':
    //       currentReportType.value = ReportType.culture;
    //       break;

    //     default:
    //       currentReportType.value = ReportType.water;
    //       break;
    //   }
    // } else {}

    getAllCompletedList().then((response) {
      if (response != null) {
        setCompletedList(response);

        if (kDebugMode) {
          setCompletedList(response);
        }
      }
    });
  }

  void typeUpdeter(String type) {
    switch (formType) {
      case 'water':
        currentReportType.value = ReportType.water;

        break;
      case 'fish':
        currentReportType.value = ReportType.fish;

        break;
      case 'shrimp':
        currentReportType.value = ReportType.shrimp;
        break;

      case 'soil':
        currentReportType.value = ReportType.soil;
        break;
      case 'pcr':
        currentReportType.value = ReportType.pcr;
        break;
      case 'feed':
        currentReportType.value = ReportType.feed;
        break;
      case 'culture':
        currentReportType.value = ReportType.culture;
        break;

      default:
        currentReportType.value = ReportType.water;
        break;
    }
    }

  Future<CompletedList?> getAllCompletedList() async {
    isLoading(true);
    try {
      final response = await _completedService.completedList();
      inspect(response);
      if (response.response == "SUCCESS") {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setCompletedList(CompletedList? data) {
    completedList.value = data;

    //update();
  }

  String convertToApiResponseFormat(String input) {
    if (input == "Water") {
      return "water";
    } else if (input == "Fish") {
      return "fish";
    } else if (input == "Shrimp") {
      return "shrimp";
    } else if (input == "Soil") {
      return "soil";
    } else if (input == "Pcr") {
      return "pcr";
    } else if (input == "Feed") {
      return "feed";
    } else if (input == "Culture") {
      return "culture";
    } else {
      return input;
    }
  }
}
