import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../../model/farmer_record/tank_reports/tank_report_list_response.dart';
import '../../../services/farmer_record/farmer_record_service_impl.dart';

class TankListController extends GetxController {
  late TextEditingController searchController;
  late GlobalKey<FormState> formKey;
  final _farmerRecordServiceImpl = Get.put(FarmerRecordServiceImpl());
  final authServiceImpl = Get.find<AuthServiceImpl>();
  final allTankReports = Rx<TankReportListResponse?>(null);
  final isLoading = false.obs;
  final totalItemCount = 0.obs;

  int id = Get.arguments['id'];

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    searchController = TextEditingController();

    super.onInit();
    getTankReports(id, authServiceImpl.userData!.id).then((response) {
      if (response != null) {
        setTankReportsData(response);
      }
    });
  }

  Future<TankReportListResponse?> getTankReports(id, userId) async {
    isLoading(true);
    try {
      final response =
          await _farmerRecordServiceImpl.getTankReports(id: id, userId: userId);
      inspect(response);

      if (response.message == "OK") {
        //Get.snackbar(response.response ?? "", response.message ?? "");

        //Get.toNamed(Routes.tank, arguments: response);
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      isLoading(false);
    }
    return null;
  }

  void setTankReportsData(TankReportListResponse? data) {
    allTankReports.value = data;
    calculateTotalItemCount();
  }

  void calculateTotalItemCount() {
    int totalCount = 0;

    if (allTankReports.value?.result != null) {
      totalCount += allTankReports.value!.result!.water!.length;
      totalCount += allTankReports.value!.result!.fish!.length;
      totalCount += allTankReports.value!.result!.shrimp!.length;
      totalCount += allTankReports.value!.result!.soil!.length;
      totalCount += allTankReports.value!.result!.pcr!.length;
      totalCount += allTankReports.value!.result!.feed!.length;
      totalCount += allTankReports.value!.result!.culture!.length;
    }

    totalItemCount.value = totalCount;
  }
}
