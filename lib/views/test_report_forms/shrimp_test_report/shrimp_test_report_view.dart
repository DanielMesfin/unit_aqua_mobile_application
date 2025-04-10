import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import 'shrimp_test_report_controller.dart';

class ShrimpTestReportView extends GetView<ShrimpTestReportController> {
  const ShrimpTestReportView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShrimpTestReportController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Shrimp Test Form",
            style: ThemeText.headlineTwo.copyWith(color: Colors.black),
          ),
        ),
        body: WidgetHelpers.pagePadding(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name:",
                              style: ThemeText.bodyOne.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Size:",
                              style: ThemeText.bodyOne.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Area:",
                              style: ThemeText.bodyOne.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Culture Type:",
                              style: ThemeText.bodyOne.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.name,
                              style: ThemeText.bodyOne
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              controller.size,
                              style: ThemeText.bodyOne
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              controller.area,
                              style: ThemeText.bodyOne
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              controller.cultureType,
                              style: ThemeText.bodyOne
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildHeader("External Examination"),
                    _buildCheckbox("Abnormal Color", "Yes", "No",
                        controller.externalAbnormalColor),
                    _buildCheckbox("Lesions or Ulcers", "Yes", "No",
                        controller.externalLesionUclers),
                    _buildCheckbox("Excessive Mucus", "Yes", "No",
                        controller.externalExcessiveMucus),
                    _buildCheckbox("Malformations", "Yes", "No",
                        controller.externalMalformations),
                    _buildCheckbox("Body Cramps", "Yes", "No",
                        controller.externalBodyCramps),
                    _buildCheckbox(
                        "Tail Root", "Yes", "No", controller.externalTailRoot),
                    _buildCheckbox(
                        "Vibrio", "Yes", "No", controller.externalVibrio),

                    // Gills
                    _buildHeader("Gills"),
                    _buildCheckbox("Discoloration", "Yes", "No",
                        controller.gillsDiscoloration),
                    _buildCheckbox(
                        "Parasites", "Yes", "No", controller.gillsParasites),
                    _buildCheckbox(
                        "Black Gills", "Yes", "No", controller.gillsBlackGills),
                    _buildCheckbox(
                        "Brown Gills", "Yes", "No", controller.gillsBrownGills),

                    // Hepatopancreas
                    _buildHeader("Hepatopancreas"),
                    _buildCheckbox("Discoloration", "Yes", "No",
                        controller.hepatopancreasDiscoloration),
                    _buildCheckbox("Enlargement", "Yes", "No",
                        controller.hepatopancreasEnlargement),
                    _buildCheckbox("Shrinked", "Yes", "No",
                        controller.hepatopancreasShrinked),

                    // Stomach
                    _buildHeader("Stomach"),
                    _buildCheckbox("Foreign Material", "Yes", "No",
                        controller.stomachForeignMaterial),
                    _buildCheckbox("Abnormalities", "Yes", "No",
                        controller.stomachAbnormalities),

                    // Reproductive Organs
                    _buildHeader("Reproductive Organs"),
                    _buildCheckbox("Abnormalities", "Yes", "No",
                        controller.reproductiveAbnormalities),

                    // Intestine
                    _buildHeader("Intestine"),
                    _buildCheckbox("Blockages", "Yes", "No",
                        controller.intestineBlockages),
                    _buildCheckbox("Parasites", "Yes", "No",
                        controller.intestineParasites),
                    _buildCheckbox(
                        "Fluids", "Yes", "No", controller.intestineFluids),
                    _buildCheckbox(
                        "White Gut", "Yes", "No", controller.intestineWhiteGut),
                    _buildCheckbox("White Fecus", "Yes", "No",
                        controller.intestineWhiteFecus),

                    // Muscle Tissue
                    _buildHeader("Muscle Tissue"),
                    _buildCheckbox("Discoloration", "Yes", "No",
                        controller.muscleTissueDiscoloration),
                    _buildCheckbox(
                        "Lesions", "Yes", "No", controller.muscleTissueLesions),
                    _buildCheckbox("White Muscle", "Yes", "No",
                        controller.muscleTissueWhiteMuscle),

                    // Nervous System
                    _buildHeader("Nervous System"),
                    _buildCheckbox("Abnormalities", "Yes", "No",
                        controller.nervousSystemAbnormalities),

                    // General Behavior
                    _buildHeader("General Behavior"),
                    _buildCheckbox("Lethargy or Weakness", "Yes", "No",
                        controller.generalBehaviorWeeknessOrLethargy),
                    _buildCheckbox("Reduced Feeding", "Yes", "No",
                        controller.generalBehaviorReducedFeeding),

                    // Specific Diseases
                    _buildHeader("Specific Diseases"),
                    _buildCheckbox("White Spot Syndrome Virus", "Yes", "No",
                        controller.specificDiseaseWhiteSpotSyndromeVirus),
                    _buildCheckbox("Hematopoietic Necrosis Virus", "Yes", "No",
                        controller.specificDiseaseInfectiousHypodermalVirus),
                    _buildCheckbox("Running Mortality Syndrome", "Yes", "No",
                        controller.specificDiseaseRunningMortalitySydrome),
                    _buildCheckbox("Taura Syndrome Virus", "Yes", "No",
                        controller.specificDiseaseTauraSyndromeVirus),
                    _buildCheckbox("Yellow Head Virus", "Yes", "No",
                        controller.specificDiseaseYellowHeadVirus),
                    _buildCheckbox("Early Mortality Syndrome", "Yes", "No",
                        controller.specificDiseaseEarlyMortalitySydrome),
                    _buildCheckbox("Vibrio spp. Infections", "Yes", "No",
                        controller.specificDiseaseVibrioInfections),
                    _buildCheckbox("Aeromonas spp. Infections", "Yes", "No",
                        controller.specificDiseaseAeromonasInfections),
                    _buildCheckbox("EHP (Enterocytozoon hepatopenaei)", "Yes",
                        "No", controller.specificDiseaseEHP),
                    _buildCheckbox("Fungi and Bacteria", "Yes", "No",
                        controller.specificDiseaseFungiAndBacteria),

                    CustomTextField(
                      controller:
                          controller.diagnosedProblemandDiseaseController,
                      labelText: "Diagnosed Problem and Disease",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => controller.isLoading.isTrue
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center(
                              child: PrimaryButton(
                                //hasLoading: true,
                                //isLoading: controller.isLoading,
                                isPrimaryButton: false,
                                width: Get.width * 0.9,
                                height: 60,
                                label: "Submit",
                                onPressed: () {
                                  final tankId = controller.tankId;
                                  final testId = controller.testId;
                                  final externalAbnormalColor =
                                      controller.externalAbnormalColor.value
                                          ? "Yes"
                                          : "No";
                                  final externalLesionUclers =
                                      controller.externalLesionUclers.value
                                          ? "Yes"
                                          : "No";
                                  final externalExcessiveMucus =
                                      controller.externalExcessiveMucus.value
                                          ? "Yes"
                                          : "No";
                                  final externalMalformations =
                                      controller.externalMalformations.value
                                          ? "Yes"
                                          : "No";
                                  final gillsDiscoloration =
                                      controller.gillsDiscoloration.value
                                          ? "Yes"
                                          : "No";
                                  final gillsParasites =
                                      controller.gillsParasites.value
                                          ? "Yes"
                                          : "No";
                                  final hepatopancreasDiscoloration = controller
                                          .hepatopancreasDiscoloration.value
                                      ? "Yes"
                                      : "No";
                                  final hepatopancreasEnlargement =
                                      controller.hepatopancreasEnlargement.value
                                          ? "Yes"
                                          : "No";
                                  final stomachForeignMaterial =
                                      controller.stomachForeignMaterial.value
                                          ? "Yes"
                                          : "No";
                                  final stomachAbnormalities =
                                      controller.stomachAbnormalities.value
                                          ? "Yes"
                                          : "No";
                                  final reproductiveAbnormalities =
                                      controller.reproductiveAbnormalities.value
                                          ? "Yes"
                                          : "No";
                                  final intestineBlockages =
                                      controller.intestineBlockages.value
                                          ? "Yes"
                                          : "No";
                                  final intestineParasites =
                                      controller.intestineParasites.value
                                          ? "Yes"
                                          : "No";
                                  final muscleTissueDiscoloration =
                                      controller.muscleTissueDiscoloration.value
                                          ? "Yes"
                                          : "No";
                                  final muscleTissueLesions =
                                      controller.muscleTissueLesions.value
                                          ? "Yes"
                                          : "No";
                                  final nervousSystemAbnormalities = controller
                                          .nervousSystemAbnormalities.value
                                      ? "Yes"
                                      : "No";
                                  final generalBehaviorWeeknessOrLethargy =
                                      controller
                                              .generalBehaviorWeeknessOrLethargy
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final generalBehaviorReducedFeeding =
                                      controller.generalBehaviorReducedFeeding
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseWhiteSpotSyndromeVirus =
                                      controller
                                              .specificDiseaseWhiteSpotSyndromeVirus
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseInfectiousHypodermalVirus =
                                      controller
                                              .specificDiseaseInfectiousHypodermalVirus
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseRunningMortalitySydrome =
                                      controller
                                              .specificDiseaseRunningMortalitySydrome
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseTauraSyndromeVirus =
                                      controller
                                              .specificDiseaseTauraSyndromeVirus
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseYellowHeadVirus =
                                      controller.specificDiseaseYellowHeadVirus
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseEarlyMortalitySydrome =
                                      controller
                                              .specificDiseaseEarlyMortalitySydrome
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseVibrioInfections =
                                      controller.specificDiseaseVibrioInfections
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseAeromonasInfections =
                                      controller
                                              .specificDiseaseAeromonasInfections
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseEHP =
                                      controller.specificDiseaseEHP.value
                                          ? "Yes"
                                          : "No";
                                  final specificDiseaseFungiAndBacteria =
                                      controller.specificDiseaseFungiAndBacteria
                                              .value
                                          ? "Yes"
                                          : "No";
                                  final externalBodyCramps =
                                      controller.externalBodyCramps.value
                                          ? "Yes"
                                          : "No";
                                  final externalTailRoot =
                                      controller.externalTailRoot.value
                                          ? "Yes"
                                          : "No";
                                  final externalVibrio =
                                      controller.externalVibrio.value
                                          ? "Yes"
                                          : "No";
                                  final gillsBlackGills =
                                      controller.gillsBlackGills.value
                                          ? "Yes"
                                          : "No";
                                  final gillsBrownGills =
                                      controller.gillsBrownGills.value
                                          ? "Yes"
                                          : "No";
                                  final hepatopancreasShrinked =
                                      controller.hepatopancreasShrinked.value
                                          ? "Yes"
                                          : "No";
                                  final intestineFluids =
                                      controller.intestineFluids.value
                                          ? "Yes"
                                          : "No";
                                  final intestineWhiteGut =
                                      controller.intestineWhiteGut.value
                                          ? "Yes"
                                          : "No";
                                  final intestineWhiteFecus =
                                      controller.intestineWhiteFecus.value
                                          ? "Yes"
                                          : "No";
                                  final muscleTissueWhiteMuscle =
                                      controller.muscleTissueWhiteMuscle.value
                                          ? "Yes"
                                          : "No";
                                  final diagnosedProblemAndDisease = controller
                                      .diagnosedProblemandDiseaseController.text
                                      .trim();

                                  controller.shrimpCreateTest(
                                    tankId,
                                    testId,
                                    externalAbnormalColor,
                                    externalLesionUclers,
                                    externalExcessiveMucus,
                                    externalMalformations,
                                    gillsDiscoloration,
                                    gillsParasites,
                                    hepatopancreasDiscoloration,
                                    hepatopancreasEnlargement,
                                    stomachForeignMaterial,
                                    stomachAbnormalities,
                                    reproductiveAbnormalities,
                                    intestineBlockages,
                                    intestineParasites,
                                    muscleTissueDiscoloration,
                                    muscleTissueLesions,
                                    nervousSystemAbnormalities,
                                    generalBehaviorWeeknessOrLethargy,
                                    generalBehaviorReducedFeeding,
                                    specificDiseaseWhiteSpotSyndromeVirus,
                                    specificDiseaseInfectiousHypodermalVirus,
                                    specificDiseaseRunningMortalitySydrome,
                                    specificDiseaseTauraSyndromeVirus,
                                    specificDiseaseYellowHeadVirus,
                                    specificDiseaseEarlyMortalitySydrome,
                                    specificDiseaseVibrioInfections,
                                    specificDiseaseAeromonasInfections,
                                    specificDiseaseEHP,
                                    specificDiseaseFungiAndBacteria,
                                    externalBodyCramps,
                                    externalTailRoot,
                                    externalVibrio,
                                    gillsBlackGills,
                                    gillsBrownGills,
                                    hepatopancreasShrinked,
                                    intestineFluids,
                                    intestineWhiteGut,
                                    intestineWhiteFecus,
                                    muscleTissueWhiteMuscle,
                                    diagnosedProblemAndDisease,
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildCheckbox(
    String label,
    String yesLabel,
    String noLabel,
    RxBool value,
  ) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text(
                    yesLabel,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Checkbox(
                    value: value.value,
                    onChanged: (newValue) {
                      value.value = newValue ?? false;
                    },
                  ),
                  Text(
                    noLabel,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Checkbox(
                    value: !value.value,
                    onChanged: (newValue) {
                      value.value = !newValue! ?? true;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHeader(String title) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        color: const Color.fromARGB(255, 124, 172, 126),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "** $title **",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
