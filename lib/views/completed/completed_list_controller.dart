import 'package:get/get.dart';
import 'dart:developer';
import 'package:unity_labs/model/completed/completed_list.dart';
import 'package:unity_labs/services/completed/completed_service_impl.dart';

class CompletedListController extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final isLoading = false.obs;
  late String testId;

  @override
  void onInit() {
    super.onInit();

    getAllCompletedList().then((response) {
      if (response != null) {
        setCompletedList(response);
      }
    });
    if (Get.arguments != null) {
      testId = Get.arguments['testId'];
    }
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
