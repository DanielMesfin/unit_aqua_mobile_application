import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/test/plankton_test_form/plankton_test_form_model.dart';
import '../../../model/test/test_pending/test_pending.dart';
import '../../../routes/app_pages.dart';
import '../../../services/test/test_service_impl.dart';

class PlanktonTestReportController extends GetxController {
  final _testServiceImpl = Get.put(TestServiceImpl());
  final testPending = Rx<TestPending?>(null);

  int tankId = 0;
  //int tankId = Get.arguments['tankId'];
  int testId = 0;
  final isLoading = false.obs;
  RxBool areFieldsFilled = false.obs;
  late GlobalKey<FormState> formKey;

  late TextEditingController usefulChlorellaController,
      usefulOocystsController,
      usefulScenedesmusController,
      usefulEudorinaController,
      usefulTetrasolmisController,
      usefulEutreptiaController,
      usefulPhacusController,
      usefulSpriulinaController,
      usefulChaetocerosController,
      usefulSkeletonemaController,
      usefulCyclotellaController,
      usefulThalassiosiraController,
      usefulCopepodController,
      usefulRotiferController,
      usefulNaupliusController,
      harmfulNoctilucaController,
      harmfulCeratiumController,
      harmfulDinophysisController,
      harmfulZoothamniumController,
      harmfulFavellaController,
      harmfulVorticellaController,
      harmfulGregarinaController,
      harmfulAnabaenaController,
      harmfulOscillatoriaController,
      harmfulMicrocystisController,
      harmfulCoscinodiscusController,
      harmfulNitzschiaController,
      harmfulNaviculaController,
      harmfulPleurosigmaController,
      usefulRhizosoleniaController,
      usefulSpIrulinaController,
      usefulTetraselmisController,
      harmfulFlagellaController,
      harmfulProtoperidiniumController;

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    // var arg = Get.arguments as TestPending;
    // tankId = arg.result.water.first.tankId;
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];

    // Initialize controllers
    usefulChlorellaController = TextEditingController();
    usefulOocystsController = TextEditingController();
    usefulScenedesmusController = TextEditingController();
    usefulEudorinaController = TextEditingController();
    usefulTetrasolmisController = TextEditingController();
    usefulEutreptiaController = TextEditingController();
    usefulPhacusController = TextEditingController();
    usefulSpriulinaController = TextEditingController();
    usefulChaetocerosController = TextEditingController();
    usefulSkeletonemaController = TextEditingController();
    usefulCyclotellaController = TextEditingController();
    usefulThalassiosiraController = TextEditingController();
    usefulCopepodController = TextEditingController();
    usefulRotiferController = TextEditingController();
    usefulNaupliusController = TextEditingController();
    harmfulNoctilucaController = TextEditingController();
    harmfulCeratiumController = TextEditingController();
    harmfulDinophysisController = TextEditingController();
    harmfulZoothamniumController = TextEditingController();
    harmfulFavellaController = TextEditingController();
    harmfulVorticellaController = TextEditingController();
    harmfulGregarinaController = TextEditingController();
    harmfulAnabaenaController = TextEditingController();
    harmfulOscillatoriaController = TextEditingController();
    harmfulMicrocystisController = TextEditingController();
    harmfulCoscinodiscusController = TextEditingController();
    harmfulNitzschiaController = TextEditingController();
    harmfulNaviculaController = TextEditingController();
    harmfulPleurosigmaController = TextEditingController();
    usefulRhizosoleniaController = TextEditingController();
    usefulSpIrulinaController = TextEditingController();
    usefulTetraselmisController = TextEditingController();
    harmfulFlagellaController = TextEditingController();
    harmfulProtoperidiniumController = TextEditingController();
  }

  // Create plankton
  void createPlanktonTest(int tankIdPassed, int testIdPassed) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    isLoading(true);

    try {
      PlanktonTestFormModel planktonform = PlanktonTestFormModel(
        usefulChlorella: double.tryParse(usefulChlorellaController.text.trim()),
        usefulOocysts: double.tryParse(usefulOocystsController.text.trim()),
        usefulScenedesmus:
            double.tryParse(usefulScenedesmusController.text.trim()),
        usefulEudorina: double.tryParse(usefulEudorinaController.text.trim()),
        usefulTetrasolmis:
            double.tryParse(usefulTetrasolmisController.text.trim()),
        usefulEutreptia: double.tryParse(usefulEutreptiaController.text.trim()),
        usefulPhacus: double.tryParse(usefulPhacusController.text.trim()),
        usefulSpriulina: double.tryParse(usefulSpriulinaController.text.trim()),
        usefulChaetoceros:
            double.tryParse(usefulChaetocerosController.text.trim()),
        usefulSkeletonema:
            double.tryParse(usefulSkeletonemaController.text.trim()),
        usefulCyclotella:
            double.tryParse(usefulCyclotellaController.text.trim()),
        usefulThalassiosira:
            double.tryParse(usefulThalassiosiraController.text.trim()),
        usefulCopepod: double.tryParse(usefulCopepodController.text.trim()),
        usefulRotifer: double.tryParse(usefulRotiferController.text.trim()),
        usefulNauplius: double.tryParse(usefulNaupliusController.text.trim()),
        harmfulNoctiluca:
            double.tryParse(harmfulNoctilucaController.text.trim()),
        harmfulCeratium: double.tryParse(harmfulCeratiumController.text.trim()),
        harmfulDinophysis:
            double.tryParse(harmfulDinophysisController.text.trim()),
        harmfulZoothamnium:
            double.tryParse(harmfulZoothamniumController.text.trim()),
        harmfulFavella: double.tryParse(harmfulFavellaController.text.trim()),
        harmfulVorticella:
            double.tryParse(harmfulVorticellaController.text.trim()),
        harmfulGregarina:
            double.tryParse(harmfulGregarinaController.text.trim()),
        harmfulAnabaena: double.tryParse(harmfulAnabaenaController.text.trim()),
        harmfulOscillatoria:
            double.tryParse(harmfulOscillatoriaController.text.trim()),
        harmfulMicrocystis:
            double.tryParse(harmfulMicrocystisController.text.trim()),
        harmfulCoscinodiscus:
            double.tryParse(harmfulCoscinodiscusController.text.trim()),
        harmfulNitzschia:
            double.tryParse(harmfulNitzschiaController.text.trim()),
        harmfulNavicula: double.tryParse(harmfulNaviculaController.text.trim()),
        harmfulPleurosigma:
            double.tryParse(harmfulPleurosigmaController.text.trim()),
        testId: testIdPassed,
        tankId: tankIdPassed,
      );

      final response1 =
          await _testServiceImpl.planktonCreateTest(planktonform: planktonform);

      if (response1.statusCode != 200) {
        Get.snackbar(response1.response ?? "", response1.message ?? "");
      } else {
        if (response1.message == 'OK') {
          Get.snackbar(
            response1.response ?? "",
            "Plankton Test Added Successfully" ?? "",
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
