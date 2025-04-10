import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../model/test/test_pending/test_pending.dart';
import '../../../services/test/test_service_impl.dart';

class ShrimpTestReportController extends GetxController {
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
  final formKey = GlobalKey<FormState>();

  late TextEditingController diagnosedProblemandDiseaseController;

  @override
  void onInit() {
    super.onInit();
    // var arg = Get.arguments as TestPending;
    // tankId = arg.result.water.first.tankId;
    tankId = Get.arguments['tankId'];
    testId = Get.arguments['testId'];
    name = Get.arguments['Name'];
    size = Get.arguments['Size'];
    area = Get.arguments['Area'];
    cultureType = Get.arguments['CultureType'];

    diagnosedProblemandDiseaseController = TextEditingController();
  }

  final RxBool externalAbnormalColor = false.obs;
  final RxBool externalLesionUclers = false.obs;
  final RxBool externalExcessiveMucus = false.obs;
  final RxBool externalMalformations = false.obs;
  final RxBool gillsDiscoloration = false.obs;
  final RxBool gillsParasites = false.obs;
  final RxBool hepatopancreasDiscoloration = false.obs;
  final RxBool hepatopancreasEnlargement = false.obs;
  final RxBool stomachForeignMaterial = false.obs;
  final RxBool stomachAbnormalities = false.obs;
  final RxBool reproductiveAbnormalities = false.obs;
  final RxBool intestineBlockages = false.obs;
  final RxBool intestineParasites = false.obs;
  final RxBool muscleTissueDiscoloration = false.obs;
  final RxBool muscleTissueLesions = false.obs;
  final RxBool nervousSystemAbnormalities = false.obs;
  final RxBool generalBehaviorWeeknessOrLethargy = false.obs;
  final RxBool generalBehaviorReducedFeeding = false.obs;
  final RxBool specificDiseaseWhiteSpotSyndromeVirus = false.obs;
  final RxBool specificDiseaseInfectiousHypodermalVirus = false.obs;
  final RxBool specificDiseaseRunningMortalitySydrome = false.obs;
  final RxBool specificDiseaseTauraSyndromeVirus = false.obs;
  final RxBool specificDiseaseYellowHeadVirus = false.obs;
  final RxBool specificDiseaseEarlyMortalitySydrome = false.obs;
  final RxBool specificDiseaseVibrioInfections = false.obs;
  final RxBool specificDiseaseAeromonasInfections = false.obs;
  final RxBool specificDiseaseEHP = false.obs;
  final RxBool specificDiseaseFungiAndBacteria = false.obs;
  final RxBool externalBodyCramps = false.obs;
  final RxBool externalTailRoot = false.obs;
  final RxBool externalVibrio = false.obs;
  final RxBool gillsBlackGills = false.obs;
  final RxBool gillsBrownGills = false.obs;
  final RxBool hepatopancreasShrinked = false.obs;
  final RxBool intestineFluids = false.obs;
  final RxBool intestineWhiteGut = false.obs;
  final RxBool intestineWhiteFecus = false.obs;
  final RxBool muscleTissueWhiteMuscle = false.obs;

  void updateCheckbox(String key, bool? newValue) {
    switch (key) {
      case "Abnormal Color":
        externalAbnormalColor.value = newValue!;
        break;
      case "Lesions or Ulcers":
        externalLesionUclers.value = newValue!;
        break;
      case "Excessive Mucus":
        externalExcessiveMucus.value = newValue!;
        break;
      case "Malformations":
        externalMalformations.value = newValue!;
        break;
      case "Discoloration (Gills)":
        gillsDiscoloration.value = newValue!;
        break;
      case "Parasites (Gills)":
        gillsParasites.value = newValue!;
        break;
      case "Hepatopancreas Discoloration":
        hepatopancreasDiscoloration.value = newValue!;
        break;
      case "Enlargement (Hepatopancreas)":
        hepatopancreasEnlargement.value = newValue!;
        break;
      case "Foreign Material (Stomach)":
        stomachForeignMaterial.value = newValue!;
        break;
      case "Abnormalities (Stomach)":
        stomachAbnormalities.value = newValue!;
        break;
      case "Abnormalities (Reproductive Organs)":
        reproductiveAbnormalities.value = newValue!;
        break;
      case "Blockages (Intestine)":
        intestineBlockages.value = newValue!;
        break;
      case "Parasites (Intestine)":
        intestineParasites.value = newValue!;
        break;
      case "Discoloration (Muscle Tissue)":
        muscleTissueDiscoloration.value = newValue!;
        break;
      case "Lesions (Muscle Tissue)":
        muscleTissueLesions.value = newValue!;
        break;
      case "Abnormalities (Nervous System)":
        nervousSystemAbnormalities.value = newValue!;
        break;
      case "Lethargy or Weakness":
        generalBehaviorWeeknessOrLethargy.value = newValue!;
        break;
      case "Reduced Feeding":
        generalBehaviorReducedFeeding.value = newValue!;
        break;
      case "White Spot Syndrome Virus":
        specificDiseaseWhiteSpotSyndromeVirus.value = newValue!;
        break;
      case "Infectious Hypodermal and Hematopoietic Necrosis Virus":
        specificDiseaseInfectiousHypodermalVirus.value = newValue!;
        break;
      case "Running Mortality Syndrome":
        specificDiseaseRunningMortalitySydrome.value = newValue!;
        break;
      case "Taura Syndrome Virus":
        specificDiseaseTauraSyndromeVirus.value = newValue!;
        break;
      case "Yellow Head Virus":
        specificDiseaseYellowHeadVirus.value = newValue!;
        break;
      case "Early Mortality Syndrome":
        specificDiseaseEarlyMortalitySydrome.value = newValue!;
        break;
      case "Vibrio spp. Infections":
        specificDiseaseVibrioInfections.value = newValue!;
        break;
      case "Aeromonas spp. Infections":
        specificDiseaseAeromonasInfections.value = newValue!;
        break;
      case "EHP (Enterocytozoon hepatopenaei)":
        specificDiseaseEHP.value = newValue!;
        break;
      case "Fungi and Bacteria":
        specificDiseaseFungiAndBacteria.value = newValue!;
        break;
      case "Body Cramps":
        externalBodyCramps.value = newValue!;
        break;
      case "Tail Root":
        externalTailRoot.value = newValue!;
        break;
      case "Vibrio":
        externalVibrio.value = newValue!;
        break;
      case "Black Gills":
        gillsBlackGills.value = newValue!;
        break;
      case "Brown Gills":
        gillsBrownGills.value = newValue!;
        break;
      case "Shrinked":
        hepatopancreasShrinked.value = newValue!;
        break;
      case "Intestine Fluids":
        intestineFluids.value = newValue!;
        break;
      case "Intestine White Gut":
        intestineWhiteGut.value = newValue!;
        break;
      case "Intestine White Fecus":
        intestineWhiteFecus.value = newValue!;
        break;
      case "Muscle Tissue White Muscle":
        muscleTissueWhiteMuscle.value = newValue!;
        break;
    }
    update();
  }

  Future<void> shrimpCreateTest(
    int tankId,
    int testId,
    String externalAbnormalColor,
    String externalLesionUclers,
    String externalExcessiveMucus,
    String externalMalformations,
    String gillsDiscoloration,
    String gillsParasites,
    String hepatopancreasDiscoloration,
    String hepatopancreasEnlargement,
    String stomachForeignMaterial,
    String stomachAbnormalities,
    String reproductiveAbnormalities,
    String intestineBlockages,
    String intestineParasites,
    String muscleTissueDiscoloration,
    String muscleTissueLesions,
    String nervousSystemAbnormalities,
    String generalBehaviorWeeknessOrLethargy,
    String generalBehaviorReducedFeeding,
    String specificDiseaseWhiteSpotSyndromeVirus,
    String specificDiseaseInfectiousHypodermalVirus,
    String specificDiseaseRunningMortalitySydrome,
    String specificDiseaseTauraSyndromeVirus,
    String specificDiseaseYellowHeadVirus,
    String specificDiseaseEarlyMortalitySydrome,
    String specificDiseaseVibrioInfections,
    String specificDiseaseAeromonasInfections,
    String specificDiseaseEHP,
    String specificDiseaseFungiAndBacteria,
    String externalBodyCramps,
    String externalTailRoot,
    String externalVibrio,
    String gillsBlackGills,
    String gillsBrownGills,
    String hepatopancreasShrinked,
    String intestineFluids,
    String intestineWhiteGut,
    String intestineWhiteFecus,
    String muscleTissueWhiteMuscle,
    String diagnosedProblemAndDisease,
  ) async {
    if (tankId.isNaN || testId.isNaN) {
      Get.snackbar('Missing input', 'TankId and TestId need to be provided.');
      return;
    }

    isLoading(true);
    print(diagnosedProblemAndDisease);
    print(diagnosedProblemandDiseaseController.text.trim());
    try {
      final response = await _testServiceImpl.shrimpCreateTest(
          tankId: tankId,
          testId: testId,
          externalAbnormalColor: externalAbnormalColor,
          externalLesionUclers: externalLesionUclers,
          externalExcessiveMucus: externalExcessiveMucus,
          externalMalformations: externalExcessiveMucus,
          gillsDiscoloration: externalExcessiveMucus,
          gillsParasites: gillsParasites,
          hepatopancreasDiscoloration: hepatopancreasDiscoloration,
          hepatopancreasEnlargement: hepatopancreasEnlargement,
          stomachForeignMaterial: stomachForeignMaterial,
          stomachAbnormalities: stomachAbnormalities,
          reproductiveAbnormalities: reproductiveAbnormalities,
          intestineBlockages: intestineBlockages,
          intestineParasites: intestineParasites,
          muscleTissueDiscoloration: muscleTissueDiscoloration,
          muscleTissueLesions: muscleTissueLesions,
          nervousSystemAbnormalities: nervousSystemAbnormalities,
          generalBehaviorWeeknessOrLethargy: generalBehaviorWeeknessOrLethargy,
          generalBehaviorReducedFeeding: generalBehaviorReducedFeeding,
          specificDiseaseWhiteSpotSyndromeVirus:
              specificDiseaseWhiteSpotSyndromeVirus,
          specificDiseaseInfectiousHypodermalVirus:
              specificDiseaseInfectiousHypodermalVirus,
          specificDiseaseRunningMortalitySydrome:
              specificDiseaseRunningMortalitySydrome,
          specificDiseaseTauraSyndromeVirus: specificDiseaseTauraSyndromeVirus,
          specificDiseaseYellowHeadVirus: specificDiseaseYellowHeadVirus,
          specificDiseaseEarlyMortalitySydrome:
              specificDiseaseEarlyMortalitySydrome,
          specificDiseaseVibrioInfections: specificDiseaseVibrioInfections,
          specificDiseaseAeromonasInfections:
              specificDiseaseAeromonasInfections,
          specificDiseaseEHP: specificDiseaseEHP,
          specificDiseaseFungiAndBacteria: specificDiseaseFungiAndBacteria,
          externalBodyCramps: externalBodyCramps,
          externalTailRoot: externalTailRoot,
          externalVibrio: externalVibrio,
          gillsBlackGills: gillsBlackGills,
          gillsBrownGills: gillsBrownGills,
          hepatopancreasShrinked: hepatopancreasShrinked,
          intestineFluids: intestineFluids,
          intestineWhiteGut: intestineWhiteGut,
          intestineWhiteFecus: intestineWhiteFecus,
          muscleTissueWhiteMuscle: muscleTissueWhiteMuscle,
          diagnosedProblemAndDisease: diagnosedProblemAndDisease);

      inspect(response);
      print(response);

      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "Shrimp Test Submitted Successfully" ?? "",
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
