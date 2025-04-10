import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/test/test_pending/test_pending.dart';
import '../../../routes/app_pages.dart';
import '../../../services/test/test_service_impl.dart';

class SoilTestReportController extends GetxController {
  //final soilTypeController = TextEditingController();
  var selectedSoilType = "Sandy Soil".obs;
  var selectedSoilNature = "Light".obs;
  final soilTypeOptions = [
    "Sandy Soil",
    "Silt Soil",
    "Clay Soil/Black Cotton",
    "Loamy Soil"
  ];
  final soilNatureOptions = ["Light", "Medium", "Heavy"];
  final soilPhController = TextEditingController();
  var selectedOrganicCarbon = "Low <0.50%".obs;
  final organicCarbonOptions = [
    "Low <0.50%",
    "Medium 0.50% - 0.75%",
    "High >0.75%"
  ];
  final availableNitrogenController = TextEditingController();
  var selectedAProperous = "Low-Medium 20-40 kg/H".obs;
  final aProperousOptions = [
    "Low-Medium 20-40 kg/H",
    "Medium 40-50 kg/H",
    "Mid-High 50-60 kg/H"
  ];
  final aPotashController = TextEditingController();
  var selectedASulphur = "Low 0-10ppm".obs;
  final aSulphurOptions = ["Low 0-10ppm", "Medium 10-15ppm", "High >15ppm"];
  final aZincController = TextEditingController();
  var selectedAIron = "Low <5.0ppm".obs;
  final aIronOptions = ["Low <5.0ppm", "High 5-20ppm", "Extreme >20ppm"];
  final aBoranController = TextEditingController();
  var selectedLimeTest = "Light".obs;
  final limeTestOptions = ["Light", "Medium", "Heavy"];

  void submitForm() {}

  @override
  void onClose() {
    //soilTypeController.dispose();
    soilPhController.dispose();
    availableNitrogenController.dispose();
    aPotashController.dispose();
    aZincController.dispose();
    aBoranController.dispose();
  }

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
  //late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    super.onInit();
    //formKey = GlobalKey<FormState>();
    // var arg = Get.arguments as TestPending;
    // tankId = arg.result.water.first.tankId;
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    name = Get.arguments['Name'];
    size = Get.arguments['Size'];
    area = Get.arguments['Area'];
    cultureType = Get.arguments['CultureType'];
  }

  Future<void> soilCreateTest(
    String soilType,
    String soilNature,
    String soilPh,
    String organicCarbon,
    String availableNitrogen,
    String prosperous,
    String potash,
    String sulphur,
    String zinc,
    String iron,
    String boran,
    String limeTest,
    int tankId,
    int testId,
  ) async {
    if (tankId.isNaN) {
      Get.snackbar('Missing input', 'TankId needs to be passed.');
      return;
    }

    isLoading(true);

    try {
      final response = await _testServiceImpl.soilCreateTest(
        soilType: soilType,
        soilNature: soilNature,
        soilPh: soilPh,
        organicCarbon: organicCarbon,
        availableNitrogen: availableNitrogen,
        prosperous: prosperous,
        potash: potash,
        sulphur: sulphur,
        zinc: zinc,
        iron: iron,
        boran: boran,
        limeTest: limeTest,
        tankId: tankId,
        testId: testId,
      );

      inspect(response);
      print(response);

      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "Soil Test Submitted Successfully" ?? "",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 80),
        );
        Get.offAllNamed(
          Routes.home,
        );
      } else {
        // Get.toNamed(Routes.testPending);
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
      // Get.toNamed(Routes.testPending);
    }
  }
}
