import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:developer';

import 'package:unity_labs/model/completed/completed_list.dart';
import 'package:unity_labs/services/completed/completed_service_impl.dart';
import 'package:unity_labs/views/my_work_records/chart_data.dart';

class CompletedListControllerHistory extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final isLoading = false.obs;
  // late List<ChartData> data;
  var data = <ChartData>[].obs;
  late TooltipBehavior tooltip;
  late String testId;
  final RxString selectedFilter = "today".obs;
  final List<String> filters = [
    'today',
    'yesterday',
    'thisWeek',
    'thisMonth',
    'dateRange'
  ];
  @override
  void onInit() {
    tooltip = TooltipBehavior(enable: true);

    super.onInit();
    data = [
      ChartData('Water', getWaterTypeCount(completedList.value)),
      ChartData('Fish', getFishTypeCount(completedList.value)),
      ChartData('Shrimp', getShrimpTypeCount(completedList.value)),
      ChartData('Soil', getSoilTypeCount(completedList.value)),
      ChartData('PCR', getPCRTypeCount(completedList.value)),
      ChartData('Feed', getFeedTypeCount(completedList.value)),
      ChartData('Culture', getCultureTypeCount(completedList.value)),
    ].obs;
    getAllCompletedList().then((response) {
      if (response != null) {
        completedList.value = response;
      }
    });
    if (Get.arguments != null) {
      testId = Get.arguments['testId'];
    }
  }

  void onFilterChanged(String? newValue) async {
    if (newValue != null) {
      selectedFilter.value = newValue;
      await getAllCompletedList().then((response) {
        if (response != null) {
          completedList.value = response;
          data = [
            ChartData('Water', getWaterTypeCount(completedList.value)),
            ChartData('Fish', getFishTypeCount(completedList.value)),
            ChartData('Shrimp', getShrimpTypeCount(completedList.value)),
            ChartData('Soil', getSoilTypeCount(completedList.value)),
            ChartData('PCR', getPCRTypeCount(completedList.value)),
            ChartData('Feed', getFeedTypeCount(completedList.value)),
            ChartData('Culture', getCultureTypeCount(completedList.value)),
          ].obs;
        }
      });
    } else {
      print("No Filter Selected");
    }
  }

  Future<CompletedList?> getAllCompletedList() async {
    isLoading(true);
    try {
      final response =
          await _completedService.completedList(dateTime: selectedFilter.value);
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

  // void setCompletedList(CompletedList? data) {
  //   completedList.value = data;
  // }

  int getWaterTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.water!.length;
    }
    return 0;
  }

  int getFishTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.fish!.length;
    }
    return 0;
  }

  int getShrimpTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.shrimp!.length;
    }
    return 0;
  }

  int getSoilTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.soil!.length;
    }
    return 0;
  }

  int getPCRTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.pcr!.length;
    }
    return 0;
  }

  int getFeedTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.feed!.length;
    }
    return 0;
  }

  int getCultureTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.culture!.length;
    }
    return 0;
  }
}
