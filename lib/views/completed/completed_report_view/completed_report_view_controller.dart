import 'package:get/get.dart';
import 'package:unity_labs/common/enums/repor_type.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';

import 'dart:developer';

import '../../../model/completed/completed_list.dart';
import '../../../services/completed/completed_service_impl.dart';

class CompletedReportViewController extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final currentReport = Rx<dynamic>(null);
  final finshedcurrentReportType = ReportType.water.obs;
  late PlanktonController planktonController;

  final isLoading = false.obs;
  int tankId = 0;
  int testId = 0;
  int id = Get.arguments['id'];
  String formType = Get.arguments['formType'];

  @override
  void onInit() {
    super.onInit();
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    
    id = Get.arguments['id'];
    formType = Get.arguments['formType'];
    planktonController = Get.put(PlanktonController());
    if (formType == 'water') {
      planktonController.faching(testId);
    }
    if (Get.arguments['formType'] != null) {
      String formType = Get.arguments['formType'];
      
      switch (formType) {
        case 'water':
          finshedcurrentReportType.value = ReportType.water;

          break;
        case 'fish':
          finshedcurrentReportType.value = ReportType.fish;

          break;
        case 'shrimp':
          finshedcurrentReportType.value = ReportType.shrimp;
          break;

        case 'soil':
          finshedcurrentReportType.value = ReportType.soil;
          break;
        case 'pcr':
          finshedcurrentReportType.value = ReportType.pcr;
          break;
        case 'feed':
          finshedcurrentReportType.value = ReportType.feed;
          break;
        case 'culture':
          finshedcurrentReportType.value = ReportType.culture;
          break;

        default:
          finshedcurrentReportType.value = ReportType.water;
          break;
      }
    } else {}

    getAllCompletedList().then((response) {
      if (response != null) {
        setCompletedList(response);
        print(response);
        print("###########################");
      }
    });
  }

  Future<CompletedList?> getAllCompletedList() async {
    isLoading(true);
    try {
      final response = await _completedService.completedList(dateTime: "today");
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
  }
}
