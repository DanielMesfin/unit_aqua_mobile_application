import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../services/test/test_service_impl.dart';

class PCRTestReportController extends GetxController {
  final _testServiceImpl = Get.put(TestServiceImpl());

  int tankId = 0;
  //int tankId = Get.arguments['tankId'];
  int testId = 0;
  String name = 'Undefined';
  String size = 'Undefined';
  String area = 'Undefined';
  String cultureType = 'Undefined';
  final isLoading = false.obs;
  //late GlobalKey<FormState> formKey;
  final formKey = GlobalKey<FormState>();

  // Result controllers
  late final RxBool whiteSpotResult;
  late final RxBool enterocytozoonResult;
  late final RxBool ihhnvResult;
  late final RxBool emsResult;
  late final RxBool imnvResult;
  late final RxBool vHarveyResult;
  late final RxBool vParahaemolyticusResult;

  // CT value controllers
  late TextEditingController whiteSpotCtValue;
  late TextEditingController enterocytozoonCtValue;
  late TextEditingController ihhnvCtValue;
  late TextEditingController emsCtValue;
  late TextEditingController imnvCtValue;
  late TextEditingController vHarveyCtValue;
  late TextEditingController vParahaemolyticusCtValue;
  late TextEditingController remarkText;

  @override
  void onInit() {
    super.onInit();

    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    name = Get.arguments['Name'];
    size = Get.arguments['Size'];
    area = Get.arguments['Area'];
    cultureType = Get.arguments['CultureType'];

    // Initialize result controllers
    whiteSpotResult = RxBool(false);
    enterocytozoonResult = RxBool(false);
    ihhnvResult = RxBool(false);
    emsResult = RxBool(false);
    imnvResult = RxBool(false);
    vHarveyResult = RxBool(false);
    vParahaemolyticusResult = RxBool(false);

    whiteSpotCtValue = TextEditingController();
    enterocytozoonCtValue = TextEditingController();
    ihhnvCtValue = TextEditingController();
    emsCtValue = TextEditingController();
    imnvCtValue = TextEditingController();
    vHarveyCtValue = TextEditingController();
    vParahaemolyticusCtValue = TextEditingController();
    remarkText = TextEditingController();
  }

  final RxBool rapidPcrTest = false.obs;
  var isEmpty = false.obs;
  void validate() {
    isEmpty.value = whiteSpotCtValue.text.isEmpty ||
        enterocytozoonCtValue.text.isEmpty ||
        ihhnvCtValue.text.isEmpty ||
        emsCtValue.text.isEmpty ||
        imnvCtValue.text.isEmpty ||
        vHarveyCtValue.text.isEmpty ||
        vParahaemolyticusCtValue.text.isEmpty;
    // remarkText.text.isEmpty;
  }

  void onSubmitOfPCR() {
    isLoading(true);
  }

  Future<void> pcrCreateTest(
    int tankId,
    int testId,
    String whiteSpotResult,
    double? whiteSpotCtValue,
    String enterocytozoonResult,
    double? enterocytozoonCtValue,
    String ihhnvResult,
    double? ihhnvCtValue,
    String emsResult,
    double? emsCtValue,
    String imnvResult,
    double? imnvCtValue,
    String vHarveyResult,
    double? vHarveyCtValue,
    String vParahaemolyticusResult,
    double? vParahaemolyticusCtValue,
    String remarkText,
  ) async {
    if (tankId.isNaN || testId.isNaN) {
      Get.snackbar('Missing input', 'TankId and TestId need to be provided.');
      return;
    }

    isLoading(true);

    try {
      final response = await _testServiceImpl.pcrCreateTest(
        tankId: tankId,
        testId: testId,
        whiteSpotResult: whiteSpotResult,
        whiteSpotCtValue: whiteSpotCtValue,
        enterocytozoonResult: enterocytozoonResult,
        enterocytozoonCtValue: enterocytozoonCtValue,
        ihhnvResult: ihhnvResult,
        ihhnvCtValue: ihhnvCtValue,
        emsResult: emsResult,
        emsCtValue: emsCtValue,
        imnvResult: imnvResult,
        imnvCtValue: imnvCtValue,
        vHarveyResult: vHarveyResult,
        vHarveyCtValue: vHarveyCtValue,
        vParahaemolyticusResult: vParahaemolyticusResult,
        vParahaemolyticusCtValue: vParahaemolyticusCtValue,
        remarkText: remarkText,
      );

      inspect(response);
      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "PCR Test Submitted Successfully" ?? "",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 80),
        );
        Get.offAllNamed(
          Routes.home,
        );
      } else {
        // Get.toNamed(Routes.tank, arguments: response);
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
