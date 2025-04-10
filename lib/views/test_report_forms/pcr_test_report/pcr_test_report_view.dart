import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../../themes/theme_text.dart';
import 'pcr_test_report_controller.dart';

class PCRTestReportView extends GetView<PCRTestReportController> {
  const PCRTestReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarTextColor,
          iconSize: 30.0,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "PCR Test Form",
          style: ThemeText.headlineTwo
              .copyWith(color: ConstantColors.appBarTextColor),
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
                const SizedBox(height: 25),
                _buildTestForm(controller),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: PrimaryButton(
                            isPrimaryButton: false,
                            width: Get.width * 0.9,
                            height: 60,
                            label: "Submit",
                            onPressed: () {
                              final tankId = controller.tankId;
                              final testId = controller.testId;
                              final rapidPcrTest = controller.rapidPcrTest.value
                                  ? "Positive"
                                  : "Negative";
                              final whiteSpotResult =
                                  controller.whiteSpotResult.value
                                      ? "Positive"
                                      : "Negative";
                              final enterocytozoonResult =
                                  controller.enterocytozoonResult.value
                                      ? "Positive"
                                      : "Negative";
                              final ihhnvResult = controller.ihhnvResult.value
                                  ? "Positive"
                                  : "Negative";
                              final emsResult = controller.emsResult.value
                                  ? "Positive"
                                  : "Negative";

                              final imnvResult = controller.imnvResult.value
                                  ? "Positive"
                                  : "Negative";
                              final vHarveyResult =
                                  controller.vHarveyResult.value
                                      ? "Positive"
                                      : "Negative";
                              final vParahaemolyticusResult =
                                  controller.vParahaemolyticusResult.value
                                      ? "Positive"
                                      : "Negative";

                              final whiteSpotCtValue = double.tryParse(
                                  controller.whiteSpotCtValue.text);

                              final enterocytozoonCtValue = double.tryParse(
                                  controller.enterocytozoonCtValue.text);
                              final ihhnvCtValue =
                                  double.tryParse(controller.ihhnvCtValue.text);
                              final emsCtValue =
                                  double.tryParse(controller.emsCtValue.text);

                              final imnvCtValue =
                                  double.tryParse(controller.imnvCtValue.text);
                              final vHarveyCtValue = double.tryParse(
                                  controller.vHarveyCtValue.text);
                              final vParahaemolyticusCtValue = double.tryParse(
                                  controller.vParahaemolyticusCtValue.text);
                              final remarkText = controller.remarkText.text;

                              controller.validate();
                              if (controller.isEmpty.value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please fill all fields.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                controller.pcrCreateTest(
                                  tankId,
                                  testId,
                                  whiteSpotResult,
                                  whiteSpotCtValue,
                                  enterocytozoonResult,
                                  enterocytozoonCtValue,
                                  ihhnvResult,
                                  ihhnvCtValue,
                                  emsResult,
                                  emsCtValue,
                                  imnvResult,
                                  imnvCtValue,
                                  vHarveyResult,
                                  vHarveyCtValue,
                                  vParahaemolyticusResult,
                                  vParahaemolyticusCtValue,
                                  remarkText,
                                );
                              }
                              //   controller.pcrCreateTest(
                              //     tankId,
                              //     testId,
                              //     whiteSpotResult,
                              //     whiteSpotCtValue,
                              //     enterocytozoonResult,
                              //     enterocytozoonCtValue,
                              //     ihhnvResult,
                              //     ihhnvCtValue,
                              //     emsResult,
                              //     emsCtValue,
                              //     imnvResult,
                              //     imnvCtValue,
                              //     vHarveyResult,
                              //     vHarveyCtValue,
                              //     vParahaemolyticusResult,
                              //     vParahaemolyticusCtValue,
                              //     remarkText,
                              //   );
                            },
                          ),
                        ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTestForm(PCRTestReportController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildHeaderRow(["RESULT", "CT Value"]),
      _buildTestItem(
        "White Spot Syndrome Virus (WSSV)",
        controller.whiteSpotResult,
        controller.whiteSpotCtValue,
      ),
      _buildTestItem(
        "Enterocytozoon Hepatopenaei (EHP)",
        controller.enterocytozoonResult,
        controller.enterocytozoonCtValue,
      ),
      _buildTestItem(
        "Infectious Hypodermal & Haematopoietic Necrosis Virus (IHHNV)",
        controller.ihhnvResult,
        controller.ihhnvCtValue,
      ),
      _buildTestItem(
        "Early Mortality Syndrome (EMS)",
        controller.emsResult,
        controller.emsCtValue,
      ),
      _buildTestItem(
        "Infectious Myonecrosis Virus (IMNV)",
        controller.imnvResult,
        controller.imnvCtValue,
      ),
      _buildTestItem(
        "V.Harvey",
        controller.vHarveyResult,
        controller.vHarveyCtValue,
      ),
      _buildTestItem(
        "V.Parahaemolyticus",
        controller.vParahaemolyticusResult,
        controller.vParahaemolyticusCtValue,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Colors.grey[200],
                ),
                child: const Text(
                  "Remark",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const VerticalDivider(color: Colors.grey),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: controller.remarkText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter remark here...',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildHeaderRow(List<String> headers) {
  return Container(
    color: Colors.lightGreen[900],
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(13),
            child: Center(
              child: Text(
                headers[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Spacer(),
        Container(
          padding:
              const EdgeInsets.only(top: 13, left: 13, bottom: 13, right: 30),
          child: Center(
            child: Text(
              headers[1],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTestItem(String testName, RxBool resultValue,
    TextEditingController ctValueController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10,
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 138, 196, 73),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Text(testName),
      ),
      const SizedBox(height: 1),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                child: _buildResultOption("Positive", "Negative", resultValue,
                    (newValue) {
                  resultValue.value = newValue!;
                }),
              ),
            ),
            Container(
              width: 85,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                ),
              ),
              // child: _buildCTValueField(ctValueController,),
              child: Obx(() =>
                  _buildCTValueField(ctValueController, resultValue.value)),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildResultOption(String yesLabel, String noLabel, RxBool value,
    void Function(bool?) onChanged) {
  return Obx(
    () => Row(
      children: [
        Text(
          yesLabel,
          style: const TextStyle(fontSize: 14),
        ),
        Checkbox(
          value: value.value,
          onChanged: (newValue) {
            value.value = newValue ?? false;
          },
        ),
        Text(
          noLabel,
          style: const TextStyle(fontSize: 14),
        ),
        Checkbox(
          value: !value.value,
          onChanged: (newValue) {
            value.value = !newValue!;
          },
        ),
      ],
    ),
  );
}

// Widget _buildResultOption(String yesLabel, String noLabel, RxBool value,
//     void Function(bool?) onChanged) {
//   return Obx(
//     () => Row(
//       children: [
//         Text(
//           yesLabel,
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//         Checkbox(
//           value: value.value,
//           onChanged: (newValue) {
//             value.value = newValue ?? false;
//           },
//         ),
//         Text(
//           noLabel,
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//         Checkbox(
//           value: !value.value,
//           onChanged: (newValue) {
//             value.value = !newValue! ?? true;
//           },
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildCTValueField(TextEditingController controller) {
//   return TextField(
//     controller: controller,
//     maxLength: 2,
//     keyboardType: TextInputType.number,
//     decoration: const InputDecoration(
//       border: OutlineInputBorder(),
//     ),
//   );
// }

Widget _buildCTValueField(TextEditingController controller, bool isEnabled) {
  if (controller.text.isEmpty) {
    controller.text = "0";
  }
  return TextField(
    controller: controller,
    enabled: isEnabled, // Enable or disable based on checkbox value
    maxLength: 2,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
    ),
  );
}
