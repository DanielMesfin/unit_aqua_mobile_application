import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../model/test/test_pending/test_pending.dart';
import '../../../services/test/test_service_impl.dart';

class FishTestReportController extends GetxController {
  // //final formKey = GlobalKey<FormState>();
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

    initializeParameters();
  }

  final RxMap<String, String> parameters = <String, String>{}.obs;
  final RxString selectedFishType = ''.obs;
  Map<String, RxString> selectedParameters = {};

  void updateParameter(String parameterName, String selectedOption) {
    parameters[parameterName] = selectedOption;

    print("########### first update 1");
  }

  String getSelectedParameter(String parameterName) {
    print("########### first update 2");
    return parameters[parameterName] ?? "";
  }

  void setSelectedFishType(String fishType) {
    selectedFishType.value = fishType;

    print("########### first update 3");
  }

  String getSelectedFishType() {
    return selectedFishType.value;
  }

  void initializeParameters() {
    List<String> categories = [
      "1. Body Colour",
      "2. Body Texture",
      "3. Mucus",
      "4. Eyes",
      "5. Fins Colour",
      "6. Gills",
      "7. Intestines",
      "8. Internal Blood lumps",
      "9. Liver",
      "10. Gut",
      "11. GallBladder",
      "12. Red Disease",
      "13. Ulcerative Dropsy",
      "14. Abdominal Dropsy",
      "15. Body Columnaris",
      "16. Gill Columnaris",
      "17. Epizootic Ulcerative Syndrome",
      "18. Dactylogyrus",
      "19. Gyrodactylus",
      "20. Trichodina",
      "21. Myxobolus",
      "22. Anchor worm / Lernaea",
      "23. Argulus",
      "24. Fin Rot / Tail rot",
      "25. Hemorrhagic Septicemia",
      "26. Red Mouth",
      "27. Bactirial Gill Root",
      "28. Egg /Roe Infection",
      "29. Ichthyophthirius",
      "30. Fungal Infection",
    ];

    for (String category in categories) {
      selectedParameters[category] = ''.obs;
    }

    print("########### first update 4");
  }

  void setSelectedParameter(String label, String option) {
    if (!selectedParameters.containsKey(label)) {
      selectedParameters[label] = ''.obs;
    }

    selectedParameters[label]?.value = option;
    print("Selected parameter for $label: $option");

    print("########### first update 5");
  }
    
    Future<void> fishCreateTest(
  int tankId,
  int testId,
  String fishDetails,
  String bodyColour,
  String bodyTexture,
  String mucus,
  String eyes,
  String finsColour,
  String gills,
  String intestines,
  String internalBloodLumps,
  String liver,
  String gut,
  String gallBladder,
  String redDisease,
  String ulcerativeDropsy,
  String abdominalDropsy,
  String bodyColumnaris,
  String gillColumnaris,
  String epizooticUlcerativeSyndrome,
  String dactylogyrus,
  String gyrodactylus,
  String trichodina,
  String myxobolus,
  String anchorWormORLernaea,
  String argulus,
  String finRotORTailrot,
  String hemorrhagicSepticemia,
  String redMouth,
  String bactirialGillRoot,
  String eggORRoleInfection,
  String ichthyophthirius,
  String fungalInfection,
  String diagnosedProblemAndDisease,
) async {
  // Validate inputs
  if (fishDetails.isEmpty ||
      bodyColour.isEmpty ||
      bodyTexture.isEmpty ||
      mucus.isEmpty ||
      eyes.isEmpty ||
      finsColour.isEmpty ||
      gills.isEmpty ||
      intestines.isEmpty ||
      internalBloodLumps.isEmpty ||
      liver.isEmpty ||
      gut.isEmpty ||
      gallBladder.isEmpty ||
      redDisease.isEmpty ||
      ulcerativeDropsy.isEmpty ||
      abdominalDropsy.isEmpty ||
      bodyColumnaris.isEmpty ||
      gillColumnaris.isEmpty ||
      epizooticUlcerativeSyndrome.isEmpty ||
      dactylogyrus.isEmpty ||
      gyrodactylus.isEmpty ||
      trichodina.isEmpty ||
      myxobolus.isEmpty ||
      anchorWormORLernaea.isEmpty ||
      argulus.isEmpty ||
      finRotORTailrot.isEmpty ||
      hemorrhagicSepticemia.isEmpty ||
      redMouth.isEmpty ||
      bactirialGillRoot.isEmpty ||
      eggORRoleInfection.isEmpty ||
      ichthyophthirius.isEmpty ||
      fungalInfection.isEmpty ||
      diagnosedProblemAndDisease.isEmpty) {
    Get.snackbar(
      "Error",
      "Please fill in all required fields.",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(bottom: 80),
    );
    return;
  }

  isLoading(true);

  try {
    final response = await _testServiceImpl.fishCreateTest(
      tankId: tankId,
      testId: testId,
      fishDetails: fishDetails,
      bodyColour: bodyColour,
      bodyTexture: bodyTexture,
      mucus: mucus,
      eyes: eyes,
      finsColour: finsColour,
      gills: gills,
      intestines: intestines,
      internalBloodLumps: internalBloodLumps,
      liver: liver,
      gut: gut,
      gallBladder: gallBladder,
      redDisease: redDisease,
      ulcerativeDropsy: ulcerativeDropsy,
      abdominalDropsy: abdominalDropsy,
      bodyColumnaris: bodyColumnaris,
      gillColumnaris: gillColumnaris,
      epizooticUlcerativeSyndrome: epizooticUlcerativeSyndrome,
      dactylogyrus: dactylogyrus,
      gyrodactylus: gyrodactylus,
      trichodina: trichodina,
      myxobolus: myxobolus,
      anchorWormORLernaea: anchorWormORLernaea,
      argulus: argulus,
      finRotORTailrot: finRotORTailrot,
      hemorrhagicSepticemia: hemorrhagicSepticemia,
      redMouth: redMouth,
      bactirialGillRoot: bactirialGillRoot,
      eggORRoleInfection: eggORRoleInfection,
      ichthyophthirius: ichthyophthirius,
      fungalInfection: fungalInfection,
      diagnosedProblemAndDisease: diagnosedProblemAndDisease,
    );

    inspect(response);
    print(response);

    if (response.message == 'OK') {
      Get.snackbar(
        response.response ?? "",
        "Fish Test Submitted Successfully",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 80),
      );
      Get.offAllNamed(
        Routes.home,
      );
    } else {
      Get.snackbar(
        response.response ?? "",
        "Fish not submitted. Please try again.",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(bottom: 80),
      );
      Get.offAllNamed(
        Routes.testPending,
      );
    }
  } on DioException catch (e) {
    inspect(e);
    Get.snackbar(
      e.response?.data["RESPONSE"] ?? "Error",
      e.response?.data["message"] ?? "An error occurred.",
    );
  } catch (e) {
    inspect(e);
  } finally {
    isLoading(false);
  }
}
}
