import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_report.dart';

import '../../../model/report/complete_report/complete_report_model.dart';
import '../../../model/report/culture/culture_report_response.dart';
import '../../../model/report/feed_report/feed_report_response.dart';
import '../../../model/report/fish_report/fish_report_response.dart';
import '../../../model/report/pcr_report/pcr_report_response.dart';
import '../../../model/report/shrimp_report/shrimp_report_response.dart';
import '../../../model/report/soil/soil_report_response.dart';
import '../../../model/report/water_report/water_report_response.dart';
import '../../../services/report/report_service_impl.dart';
import 'package:unity_labs/common/enums/repor_type.dart';

class ReportViewController extends GetxController {
  final ReportServiceImpl _reportService = Get.put(ReportServiceImpl());
  final waterReport = Rx<WaterReportResponse?>(null);
  final fishReport = Rx<FishReportResponse?>(null);
  final feedReport = Rx<FeedReportResponse?>(null);
  final shrimpReport = Rx<ShrimpReportResponse?>(null);
  final cultureReport = Rx<CultureReportResponse?>(null);
  final pcrReport = Rx<PcrReportResponse?>(null);
  final soilReport = Rx<SoilReportResponse?>(null);
  final planktonReport = Rx<ResponseModel?>(null);

  final currentReportType = ReportType.water.obs;
  final currentReport = Rx<dynamic>(null);

  late GlobalKey<FormState> formKey;
  late TextEditingController suggestionController;
  late PlanktonController planktonController;

  final isLoading = false.obs;
  final canRedirect = false.obs;
  final RxBool isTextFieldExpanded = false.obs;

  int tankId = 0;
  int testId = 0;
  int id = Get.arguments['id'];
  String formType = Get.arguments['formType'];
  String farmerName = "";
  @override
  void onInit() {
    super.onInit();
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    id = Get.arguments['id'];
    farmerName = Get.arguments['farmer'] ?? "";
    formType = Get.arguments['formType'];
    planktonController = Get.put(PlanktonController());
    if (formType == 'water') {
      planktonController.faching(testId);
    }
    formKey = GlobalKey<FormState>();
    suggestionController = TextEditingController();

    if (Get.arguments['formType'] != null) {
      String formType = Get.arguments['formType'];
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
    } else {}

    loadReport();
  }

  void toggleTextFieldExpansion() {
    isTextFieldExpanded.toggle();
  }

  Future<void> loadReport() async {
    isLoading(true);
    dynamic report;
    switch (currentReportType.value) {
      case ReportType.water:
        report = await getAllWaterReport();
        break;
      case ReportType.fish:
        report = await getAllFishReport();

        break;
      case ReportType.shrimp:
        report = await getAllShrimpReport();

        break;
      case ReportType.soil:
        report = await getAllSoilReport();

        break;
      case ReportType.pcr:
        report = await getAllPcrReport();

        break;
      case ReportType.culture:
        report = await getAllCultureReport();

        break;
      case ReportType.feed:
        report = await getAllFeedReport();

        break;

      default:
        report = null;
    }

    if (report != null) {
      currentReport.value = report;
    } else {}

    _checkAllReportsLoaded();
    isLoading(false);
  }

// Method to check if all reports are loaded
  void _checkAllReportsLoaded() {
    if (fishReport.value != null &&
        waterReport.value != null &&
        shrimpReport.value != null &&
        soilReport.value != null &&
        pcrReport.value != null &&
        cultureReport.value != null &&
        feedReport.value != null) {
      isLoading(false);
    }
  }

  //Fetch
  //water
  Future<WaterReportResponse?> getAllWaterReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.waterReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      //isLoading(false);
    }
  }

  Future<void> loadWaterReport() async {
    WaterReportResponse? apiResponse = await getAllWaterReport();
    if (apiResponse != null) {
      waterReport.value = apiResponse;
    } else {}
  }

  //fish
  Future<FishReportResponse?> getAllFishReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.fishReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      //isLoading(false);
    }
  }

  Future<void> loadFishReport() async {
    FishReportResponse? apiResponse = await getAllFishReport();
    if (apiResponse != null) {
      fishReport.value = apiResponse;
    } else {}
  }

  //shrimp
  Future<ShrimpReportResponse?> getAllShrimpReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.shrimpReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      //isLoading(false);
    }
  }

  Future<void> loadShrimpReport() async {
    ShrimpReportResponse? apiResponse = await getAllShrimpReport();
    if (apiResponse != null) {
      shrimpReport.value = apiResponse;
    } else {}
  }

  //soil
  Future<SoilReportResponse?> getAllSoilReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.soilReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        // Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> loadSoilReport() async {
    SoilReportResponse? apiResponse = await getAllSoilReport();
    if (apiResponse != null) {
      soilReport.value = apiResponse;
    } else {}
  }

  //pcr
  Future<PcrReportResponse?> getAllPcrReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.pcrReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //  Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      //isLoading(false);
    }
  }

  Future<void> loadPcrReport() async {
    PcrReportResponse? apiResponse = await getAllPcrReport();
    if (apiResponse != null) {
      pcrReport.value = apiResponse;
    } else {}
  }

  //culture
  Future<CultureReportResponse?> getAllCultureReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.cultureReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        // Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> loadCultureReport() async {
    CultureReportResponse? apiResponse = await getAllCultureReport();
    if (apiResponse != null) {
      cultureReport.value = apiResponse;
    } else {}
  }

  //feed
  Future<FeedReportResponse?> getAllFeedReport() async {
    //isLoading(true);
    try {
      final response = await _reportService.feedReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response, response.message);
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      //isLoading(false);
    }
  }

  Future<void> loadFeedReport() async {
    FeedReportResponse? apiResponse = await getAllFeedReport();
    if (apiResponse != null) {
      feedReport.value = apiResponse;
    } else {}
  }

  Future<void> addSuggestionToReport(
      int reportId, String reportType, int testId) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);

    try {
      CompleteReportModel suggestion = CompleteReportModel(
        suggestion: suggestionController.text.trim(),
        testId: testId,
      );

      final response = await _reportService.addSuggestionToReport(
          suggestionmodel: suggestion,
          reportId: reportId,
          reportType: reportType);

      if (response.statusCode != 200) {
        Get.snackbar(response.response ?? "", response.message ?? "");
        // canRedirect(false);
      } else {
        await loadReport();

        // Get.snackbar(
        //   response.response ?? "",
        //   "Suggestion is added Successfully" ?? "",
        //   backgroundColor: Colors.green,
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        canRedirect.value = true;
        canRedirect(true);
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}

// enum ReportType { water, fish, shrimp, soil, pcr, culture, feed }
