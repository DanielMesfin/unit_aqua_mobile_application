import 'package:get/get.dart';
import 'package:unity_labs/model/completed/completed_list.dart';
import 'dart:developer';
import 'package:unity_labs/common/enums/repor_type.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';
import 'package:unity_labs/services/completed/completed_service_impl.dart';

class MyCompletedReportViewController extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final currentReport = Rx<dynamic>(null);
  final finshedcurrentReportType = ReportType.water.obs;

  final isLoading = false.obs;
  int tankId = 0;
  int testId = 0;
  int id = Get.arguments['id'];
  String formType = Get.arguments['formType'];
  late PlanktonController planktonControllerP;
  @override
  void onInit() {
    super.onInit();
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    id = Get.arguments['id'];

    formType = Get.arguments['formType'];
    planktonControllerP = Get.put(PlanktonController());
    if (formType == 'water') {
      planktonControllerP.faching(testId);
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
  }
}

// enum FinishedReportType { water, fish, shrimp, soil, pcr, culture, feed }
