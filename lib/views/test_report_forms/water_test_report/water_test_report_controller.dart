import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../model/test/test_pending/test_pending.dart';
import '../../../services/test/test_service_impl.dart';

class WaterTestReportController extends GetxController {
  final TestServiceImpl _testService = Get.put(TestServiceImpl());
  final _testServiceImpl = Get.put(TestServiceImpl());
  final testPending = Rx<TestPending?>(null);

  int tankId = 0;
  //int tankId = Get.arguments['tankId'];
  int testId = 0;
  String planktonTest = 'No';
  String name = 'Undefined';
  String size = 'Undefined';
  String area = 'Undefined';
  String cultureType = 'Undefined';

  final isLoading = false.obs;
  RxString totalAlkalinity = "".obs;

  late TextEditingController phController,
      temperatureController,
      salinityController,
      carbonatesController,
      bicarbonatesController,
      totalAlkanilityController1,
      hardnessController,
      calciumController,
      magnesiumController,
      potassiumController,
      ironController,
      sodiumController,
      chlorineController,
      ammoniaController,
      unIonizedAmmoniaController,
      nitriteController,
      hydrogenSulfideController,
      carbonDioxideController,
      dissolvedOxygenController,
      electricalConductivityController,
      totalDissolvedSolidsController;

  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    // var arg = Get.arguments as TestPending;
    // tankId = arg.result.water.first.tankId;
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    planktonTest = Get.arguments['planktonTest'];
    name = Get.arguments['Name'];
    size = Get.arguments['Size'];
    area = Get.arguments['Area'];
    cultureType = Get.arguments['CultureType'];

    phController = TextEditingController();
    temperatureController = TextEditingController();
    salinityController = TextEditingController();
    carbonatesController = TextEditingController();
    bicarbonatesController = TextEditingController();
    totalAlkanilityController1 = TextEditingController();
    hardnessController = TextEditingController();
    calciumController = TextEditingController();
    magnesiumController = TextEditingController();
    potassiumController = TextEditingController();
    ironController = TextEditingController();
    sodiumController = TextEditingController();
    chlorineController = TextEditingController();
    ammoniaController = TextEditingController();
    unIonizedAmmoniaController = TextEditingController();
    nitriteController = TextEditingController();
    hydrogenSulfideController = TextEditingController();
    carbonDioxideController = TextEditingController();
    dissolvedOxygenController = TextEditingController();
    electricalConductivityController = TextEditingController();
    totalDissolvedSolidsController = TextEditingController();
    totalAlkanilityController1 = TextEditingController();
    // some controler is updated Daniel
    carbonatesController.addListener(updateTotalAlkalinity);
    bicarbonatesController.addListener(updateTotalAlkalinity);
  }

  void updateTotalAlkalinity() {
    double carbonatesValue = double.tryParse(carbonatesController.text) ?? 0.0;
    double bicarbonatesValue =
        double.tryParse(bicarbonatesController.text) ?? 0.0;

    double totalAlkalinityValue = carbonatesValue + bicarbonatesValue;
    // totalAlkanilityController1.text = totalAlkalinityValue.toString();
String totalAlkalinityString = totalAlkalinityValue.toString();
if (totalAlkalinityString.endsWith('.0')) {
  totalAlkalinityString = totalAlkalinityString.substring(0, totalAlkalinityString.length - 2);
}
totalAlkanilityController1.text = totalAlkalinityString;

  }

  Future<void> waterCreateTest(
    String ph,
    String temperature,
    String salinity,
    String co3,
    String hco3,
    String totalAlkanility,
    String totalHardness,
    String ca,
    String mg,
    String k,
    String fe,
    String na,
    String cl2,
    String tan,
    String nh3,
    String no,
    String h2s,
    String co2,
    String dissolvedOxygen,
    String electricalConductivity,
    String totalDissolvedSolids,
    int tankId,
    int testId,
  ) async {
    if (tankId.isNaN) {
      Get.snackbar('Missing input', 'TankId needs to be passed.');
      return;
    }

    isLoading(true);

    try {
      final response = await _testServiceImpl.waterCreateTest(
        ph: double.tryParse(ph) ?? "",
        temprature: double.tryParse(temperature) ?? "",
        salinity: double.tryParse(salinity) ?? "",
        co3: double.tryParse(co3) ?? "",
        hco3: double.tryParse(hco3) ?? "",
        totalAlkanility: double.tryParse(totalAlkanility) ?? "",
        totalHardness: double.tryParse(totalHardness) ?? "",
        ca: double.tryParse(ca) ?? "",
        mg: double.tryParse(mg) ?? "",
        k: double.tryParse(k) ?? "",
        fe: double.tryParse(fe) ?? "",
        na: double.tryParse(na) ?? "",
        cl2: double.tryParse(cl2) ?? "",
        tan: double.tryParse(tan) ?? "",
        nh3: double.tryParse(nh3) ?? "",
        no2: double.tryParse(no) ?? "",
        h2s: double.tryParse(h2s) ?? "",
        co2: double.tryParse(co2) ?? "",
        dissolvedOxygen: double.tryParse(dissolvedOxygen) ?? "",
        electricalConductivity: double.tryParse(electricalConductivity) ?? "",
        totalDissolvedSolids: double.tryParse(totalDissolvedSolids) ?? "",
        tankId: tankId,
        testId: testId,
      );
      inspect(response);
      print(response);

      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "Water Test Submitted Successfully" ?? "",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 80),
        );
        Get.offAllNamed(
          Routes.home,
        );
      } else {
        //Get.toNamed(Routes.tank, arguments: response);
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
