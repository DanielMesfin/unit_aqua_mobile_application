import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../../themes/theme_text.dart';
import 'fish_test_report_controller.dart';

class FishTestReportView extends GetView<FishTestReportController> {
  FishTestReportView({super.key});
  TextEditingController diagnosedProblemAndDiseaseController =
      TextEditingController();

  // Function to get the entered text
  String getDiagnosedProblemAndDisease() {
    return diagnosedProblemAndDiseaseController.text;
  }

  @override
  Widget build(BuildContext context) {
    List<String> fishTypes = ["Rohu", "Pangus", "Katla", "Roopchand", "Others"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Fish Test Form",
          style: ThemeText.headlineTwo.copyWith(color: Colors.black),
        ),
      ),
      body: WidgetHelpers.pagePadding(
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
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                        Text(
                          controller.size,
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                        Text(
                          controller.area,
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                        Text(
                          controller.cultureType,
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Desected Fish Details",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GroupButton(
                  isRadio: true,
                  onSelected: (index, item, isSelected) {
                    if (isSelected) {
                      controller.setSelectedFishType(fishTypes[item]);
                    }
                  },
                  buttons: const [
                    "Rohu",
                    "Pangus",
                    "Katla",
                    "Roopchand",
                    "Others"
                  ],
                ),

                // Parameter 1: Body Colour

                _buildFormField(
                    "1. Body Colour", ["Normal", "Discoloured", "Dark"]),
                _buildFormField(
                    "2. Body Texture", ["Normal", "Bacterial Rash", "Woonded"]),
                _buildFormField("3. Mucus", ["Normal", "Moderate", "Heavy"]),
                _buildFormField("4. Eyes", ["Normal", "Deep", "Popped out"]),
                _buildFormField(
                    "5. Fins Colour", ["Normal", "Colour Changed", "Damaged"]),
                _buildFormField("6. Gills", ["Red", "Pale", "Damaged"]),
                _buildFormField("7. Intestines", ["Normal", "Empty", "Fluids"]),
                _buildFormField("8. Internal Blood lumps",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("9. Liver", ["Normal", "Fatty", "Damaged"]),
                _buildFormField("10. Gut", ["Normal", "Watery", "Puss"]),
                _buildFormField(
                    "11. GallBladder", ["Normal", "Swell", "Damaged"]),
                _buildFormField("12. Red Disease",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("13. Ulcerative Dropsy",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("14. Abdominal Dropsy",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("15. Body Columnaris",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("16. Gill Columnaris",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("17. Epizootic Ulcerative Syndrome",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("18. Dactylogyrus",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("19. Gyrodactylus",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("20. Trichodina",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("21. Myxobolus",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("22. Anchor worm / Lernaea",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField(
                    "23. Argulus", ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("24. Fin Rot / Tail rot",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("25. Hemorrhagic Septicemia",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                // new add
                _buildFormField("26. Red Mouth",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("27. Bactirial Gill Root",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("28. Egg /Roe Infection",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("29. Ichthyophthirius",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                _buildFormField("30. Fungal Infection",
                    ["Not Found", "Mild", "Moderate", "Severe"]),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "31. Diagnosed Problem and Disease",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      CustomTextField(
                        controller: diagnosedProblemAndDiseaseController,
                        labelText: "Diagnosed Problem and Disease",
                      ),
                    ],
                  ),
                ),

                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: PrimaryButton(
                              isPrimaryButton: false,
                              width: Get.width * 0.9,
                              height: 60,
                              label: "Submit",
                              onPressed: () {
                                final tankId = controller.tankId;
                                final testId = controller.testId;
                                final fishType =
                                    controller.selectedFishType.value;
                                List<String?> values = controller
                                    .selectedParameters.values
                                    .map((value) => value.value)
                                    .toList();
                                printSelectedParameters();
                                controller.fishCreateTest(
                                  tankId,
                                  testId,
                                  fishType,
                                  values[0]!,
                                  values[1]!,
                                  values[2]!,
                                  values[3]!,
                                  values[4]!,
                                  values[5]!,
                                  values[6]!,
                                  values[7]!,
                                  values[8]!,
                                  values[9]!,
                                  values[10]!,
                                  values[11]!,
                                  values[12]!,
                                  values[13]!,
                                  values[14]!,
                                  values[15]!,
                                  values[16]!,
                                  values[17]!,
                                  values[18]!,
                                  values[19]!,
                                  values[20]!,
                                  values[21]!,
                                  values[22]!,
                                  values[23]!,
                                  values[24]!,
                                  values[25]!,
                                  values[26]!,
                                  values[27]!,
                                  values[28]!,
                                  values[29]!,
                                  getDiagnosedProblemAndDisease(),
                                );
                              }),
                        ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, List<String> options) {
    return Column(
      children: [
        Container(
          width: 500.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              for (String option in options)
                Obx(() {
                  final isSelected =
                      controller.selectedParameters[label]?.value == option;

                  return GestureDetector(
                    onTap: () {
                      controller.setSelectedParameter(label, option);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.blue : getButtonColor(option),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.black,
                          width: isSelected ? 3.0 : 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            option,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : getTextColor(option),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isSelected)
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 40,
                            ),
                        ],
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Color getButtonColor(String option) {
    final selectedFishType = controller.getSelectedFishType();

    final colorCategoryMap = {
      const Color.fromARGB(255, 202, 201, 201): ["Not Found"],
      const Color.fromARGB(255, 127, 207, 130): ["Normal", "Red", "Mild"],
      const Color.fromARGB(255, 250, 237, 124): [
        "Discoloured",
        "Bacterial Rash",
        "Moderate",
        "Deep",
        "Colour Changed",
        "Pale",
        "Empty",
        "Fatty",
        "Watery",
        "Swell"
      ],
      const Color.fromARGB(255, 255, 163, 158): [
        "Dark",
        "Woonded",
        "Heavy",
        "Popped out",
        "Damaged",
        "Fluids",
        "Severe",
        "Puss"
      ],
      Colors.black: [],
    };

    final category = colorCategoryMap.entries
        .firstWhere((entry) => entry.value.contains(option),
            orElse: () => MapEntry(Colors.black, []))
        .key;

    return option == selectedFishType ? Colors.brown : category;
  }

  Color getTextColor(String option) {
    if (option == "Not Found") {
      return Colors.black;
    } else if (option == "Normal") {
      return Colors.black;
    } else if (option == "Discoloured") {
      return Colors.black;
    } else if (option == "Dark") {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  void printSelectedParameters() {
    for (var entry in controller.selectedParameters.entries) {
      print("Label: ${entry.key}, Option: ${entry.value.value}");
    }
  }

}
