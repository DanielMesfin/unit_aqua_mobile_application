import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../model/test/test_pending/test_pending.dart';
import '../../../services/test/test_service_impl.dart';

class FeedTestReportController extends GetxController {
  final TestServiceImpl _testService = Get.put(TestServiceImpl());
  final _testServiceImpl = Get.put(TestServiceImpl());
  final testPending = Rx<TestPending?>(null);

  int tankId = 0;
  //int tankId = Get.arguments['tankId'];
  int testId = 0;
  String name = 'Undefined';
  String size = 'Undefined';
  String area = 'Undefined';
  String cultureType = 'Undefined';
  final isLoading = false.obs;
  late GlobalKey<FormState> formKey;

  late TextEditingController typeController,
      percentController,
      fatController,
      proteinController,
      moistureController,
      ashController,
      fiberController;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    // var arg = Get.arguments as TestPending;
    // tankId = arg.result.water.first.tankId;
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    name = Get.arguments['Name'];
    size = Get.arguments['Size'];
    area = Get.arguments['Area'];
    cultureType = Get.arguments['CultureType'];

    typeController = TextEditingController();
    percentController = TextEditingController();
    fatController = TextEditingController();
    proteinController = TextEditingController();
    moistureController = TextEditingController();
    ashController = TextEditingController();
    fiberController = TextEditingController();
  }

  // Create feedCreateTest method
  Future<void> feedCreateTest(
    String fat,
    String protein,
    String moisture,
    String ash,
    String fiber,
    int tankId,
    int testId,
  ) async {
    if (tankId.isNaN) {
      Get.snackbar('Missing input', 'TankId needs to be passed.');
      return;
    }

    isLoading(true);

    try {
      final response = await _testServiceImpl.feedCreateTest(
        fat: double.tryParse(fat) ?? 0.0,
        protein: double.tryParse(protein) ?? 0.0,
        moisture: double.tryParse(moisture) ?? 0.0,
        ash: double.tryParse(ash) ?? 0.0,
        fiber: double.tryParse(fiber) ?? 0.0,
        tankId: tankId,
        testId: testId,
      );

      inspect(response);
      print(response);

      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "Feed Test Submitted Successfully" ?? "",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 80),
        );
        Get.offAllNamed(
          Routes.home,
        );
      } else {
        //  Get.toNamed(Routes.tank, arguments: response);
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(
        e.response!.data["RESPONSE"] ?? "",
        e.response!.data["message"] ?? "",
      );
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
