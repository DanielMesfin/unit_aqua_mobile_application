import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';

import '../../../themes/theme_text.dart';
import 'water_test_report_controller.dart';
import 'package:flutter/services.dart';

class WaterTestReportView extends GetView<WaterTestReportController> {
  WaterTestReportView({super.key});

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Water Test Form for TankID ${controller.tankId}",
          style: ThemeText.bodyOne.copyWith(color: Colors.black),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plankton Test status:",
                          style: ThemeText.bodyOne.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          controller.planktonTest,
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
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
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        //scrollDirection: Axis.horizontal,
                        child: DataTable(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          dividerThickness: 2,
                          horizontalMargin: 0,

                          columnSpacing: 0,
                          headingRowHeight: 70,

                          //columnSpacing: 0.0,
                          border: TableBorder.all(
                            color: Colors.black,
                          ),
                          headingRowColor:
                              WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return Colors.blue;
                              }
                              return Color.fromARGB(255, 214, 214, 214);
                            },
                          ),

                          columns: [
                            DataColumn(
                              label: Container(
                                color: Colors.green,
                                width: 130,
                                child: Center(
                                    child: Text(
                                  'Parameter',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                )),
                              ),
                              tooltip: 'Parameter',
                              numeric: false,
                            ),
                            DataColumn(
                              label: Container(
                                color: Colors.blue,
                                width: 130,
                                child: Center(
                                  child: Text('Optimum Levels',
                                      style: ThemeText.bodyOne
                                          .copyWith(color: Colors.red)),
                                ),
                              ),
                              numeric: false,
                            ),
                            DataColumn(
                              label: Container(
                                color: Colors.green[200],
                                width: 120,
                                child: Center(
                                    child: Text('Observation',
                                        style: ThemeText.bodyOne
                                            .copyWith(color: Colors.red))),
                              ),
                              numeric: false,
                            ),
                          ],
                          rows: [
                            buildDataRow("pH", controller.phController, "4.5",
                                "11.5", true),
                            buildDataRow(
                                "Temperature",
                                controller.temperatureController,
                                "15",
                                "48",
                                false),
                            buildDataRow(
                                "Salinity",
                                controller.salinityController,
                                "0",
                                "35",
                                false),
                            buildDataRow(
                                "Carbonates (CO3)",
                                controller.carbonatesController,
                                "0",
                                "120",
                                false),
                            buildDataRow(
                                "Bicarbonates (HCO3)",
                                controller.bicarbonatesController,
                                "0",
                                "1000",
                                false),
                            buildDataRow(
                              "Total Alkanility",
                              controller.totalAlkanilityController1,
                              "150",
                              "500",
                              false,
                            ),
                            buildDataRow(
                                "Total Hardness",
                                controller.hardnessController,
                                "0",
                                "6000",
                                true),
                            buildDataRow(
                                "Calcium (Ca)",
                                controller.calciumController,
                                "0",
                                "1500",
                                false),
                            buildDataRow(
                                "Magnesium (Mg)",
                                controller.magnesiumController,
                                "0",
                                "2000",
                                false),
                            buildDataRow(
                                "Potassium (K)",
                                controller.potassiumController,
                                "0",
                                "1500",
                                false),
                            buildDataRow("Iron (Fe)", controller.ironController,
                                "0.0", "10.0", false),
                            buildDataRow(
                                "Sodium (Na)",
                                controller.sodiumController,
                                "0",
                                "8000",
                                false),
                            buildDataRow(
                                "Chlorine (Cl2)",
                                controller.chlorineController,
                                "0.0",
                                "9.9",
                                false),
                            buildDataRow("Total Ammonia (TAN)",
                                controller.ammoniaController, "0", "9.0", true),
                            buildDataRow(
                                "Un-Ionized Ammonia (NH3)",
                                controller.unIonizedAmmoniaController,
                                "0.0",
                                "5.0",
                                true),
                            buildDataRow(
                                "Nitrite (NO2)",
                                controller.nitriteController,
                                "0.0",
                                "8.0",
                                true),
                            buildDataRow(
                                "Hydrozen Sulphide (H2S)",
                                controller.hydrogenSulfideController,
                                "0.00",
                                "1.00",
                                true),
                            buildDataRow(
                                "Carbon Dioxide (CO2)",
                                controller.carbonDioxideController,
                                "0.00",
                                "25.0",
                                false),
                            buildDataRow(
                                "Dissolved Oxygen (D.O)",
                                controller.dissolvedOxygenController,
                                "1.00",
                                "9.0",
                                false),
                            buildDataRow(
                                "Electrical Conductivity (E.C.)",
                                controller.electricalConductivityController,
                                "0",
                                "3600",
                                false),
                            buildDataRow(
                                "Total Dissolved Solids (T.D.S.)",
                                controller.totalDissolvedSolidsController,
                                "10",
                                "600",
                                false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Obx(
                                () => controller.isLoading.isTrue
                                    ? Center(child: CircularProgressIndicator())
                                    : Ink(
                                        decoration: ShapeDecoration(
                                          color: const Color.fromARGB(
                                              255, 207, 205, 205),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            if (controller.formKey.currentState!
                                                .validate()) {
                                              final ph = double.tryParse(
                                                      controller
                                                          .phController.text) ??
                                                  "";
                                              final temperature =
                                                  double.tryParse(controller
                                                          .temperatureController
                                                          .text) ??
                                                      "";
                                              final co3 = double.tryParse(
                                                      controller
                                                          .carbonatesController
                                                          .text) ??
                                                  "";
                                              final hco3 = double.tryParse(
                                                      controller
                                                          .bicarbonatesController
                                                          .text) ??
                                                  "";
                                              final totalAlkanility =
                                                  double.tryParse(controller
                                                          .totalAlkanilityController1
                                                          .text) ??
                                                      "";
                                              final totalHardness =
                                                  double.tryParse(controller
                                                          .hardnessController
                                                          .text) ??
                                                      "";
                                              final ca = double.tryParse(
                                                      controller
                                                          .calciumController
                                                          .text) ??
                                                  "";
                                              final mg = double.tryParse(
                                                      controller
                                                          .magnesiumController
                                                          .text) ??
                                                  "";
                                              final k = double.tryParse(
                                                      controller
                                                          .potassiumController
                                                          .text) ??
                                                  "";
                                              final fe = double.tryParse(
                                                      controller.ironController
                                                          .text) ??
                                                  "";
                                              final na = double.tryParse(
                                                      controller
                                                          .sodiumController
                                                          .text) ??
                                                  "";
                                              final co2 = double.tryParse(
                                                      controller
                                                          .carbonDioxideController
                                                          .text) ??
                                                  "";
                                              final dissolvedOxygen =
                                                  double.tryParse(controller
                                                          .dissolvedOxygenController
                                                          .text) ??
                                                      "";
                                              final tankId = controller.tankId;
                                              final testId = controller.testId;

                                              await controller.waterCreateTest(
                                                controller.phController.text,
                                                controller
                                                    .temperatureController.text,
                                                controller
                                                    .salinityController.text,
                                                controller
                                                    .carbonatesController.text,
                                                controller
                                                    .bicarbonatesController
                                                    .text,
                                                controller
                                                    .totalAlkanilityController1
                                                    .text,
                                                controller
                                                    .hardnessController.text,
                                                controller
                                                    .calciumController.text,
                                                controller
                                                    .magnesiumController.text,
                                                controller
                                                    .potassiumController.text,
                                                controller.ironController.text,
                                                controller
                                                    .sodiumController.text,
                                                controller
                                                    .chlorineController.text,
                                                controller
                                                    .ammoniaController.text,
                                                controller
                                                    .unIonizedAmmoniaController
                                                    .text,
                                                controller
                                                    .nitriteController.text,
                                                controller
                                                    .hydrogenSulfideController
                                                    .text,
                                                controller
                                                    .carbonDioxideController
                                                    .text,
                                                controller
                                                    .dissolvedOxygenController
                                                    .text,
                                                controller
                                                    .electricalConductivityController
                                                    .text,
                                                controller
                                                    .totalDissolvedSolidsController
                                                    .text,
                                                tankId,
                                                testId,
                                              );

                                              const testtype = 'water';

                                              final planktonyesno =
                                                  controller.planktonTest;

                                              if (planktonyesno == 'Yes' &&
                                                  testtype == 'water') {
                                                Get.offAllNamed(
                                                    Routes.planktontestform,
                                                    arguments: {
                                                      'tankId': tankId,
                                                      'testId': testId
                                                    });
                                              } else {}
                                            }
                                          },
                                          child: Container(
                                            width: 350,
                                            height: 60,
                                            alignment: Alignment.center,
                                            child: Text(
                                              controller.planktonTest == 'Yes'
                                                  ? "Next to plankton test"
                                                  : "Submit",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
    String labelText,
    TextEditingController controller,
    String min,
    String max,
    bool isRequired,
  ) {
    var inputText = ''.obs;
    void updateText(String value) {
      if (value.isNotEmpty && value.startsWith('.')) {
        inputText.value = '0$value';
      } else {
        inputText.value = value;
      }

      // Reflect this updated value in the TextEditingController
      controller.value = TextEditingValue(
        text: inputText.value,
        selection: TextSelection.collapsed(offset: inputText.value.length),
      );
    }

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) {
        updateText(value);
      },
      inputFormatters: [
        // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      validator: (value) {
        // logic if the filed is required and have max  and min value limit then check the value else return null
        if (isRequired) {
          if (value!.isEmpty) {
            return 'Please enter $labelText';
          }
        }

        // Check if there's more than one dot
        if (value!.split('.').length > 2) {
          return 'Invalid number format. Only one decimal point is allowed.';
        }

        final double numericValue = double.tryParse(value) ?? 0.0;
        final double minDouble = double.parse(min);
        final double maxDouble = double.parse(max);
        if (isRequired) {
          if (numericValue < minDouble || numericValue > maxDouble) {
            return '$min to $max must be value for $labelText';
          }
        }

        return null;
      },
    );
  }

  DataRow buildDataRow(String parameter, TextEditingController controller,
      String minValue, String maxValue, bool isRequired) {
    String displayValue = '';

    if (parameter == "pH") {
      displayValue = "7.5-8.5";
    } else if (parameter == "Temperature") {
      displayValue = "27-32°C";
    } else if (parameter == "Salinity") {
      displayValue = "0 PPT";
    } else if (parameter == "Carbonates (CO3)") {
      displayValue = "20-40 PPM";
    } else if (parameter == "Bicarbonates (HCO3)") {
      displayValue = "150-400 PPM";
    } else if (parameter == "Total Alkanility") {
      displayValue = "150-500 PPM";
    } else if (parameter == "Total Hardness") {
      displayValue = "150-300 PPM (Based on salinity)";
    } else if (parameter == "Calcium (Ca)") {
      displayValue = ">100 PPM";
    } else if (parameter == "Magnesium (Mg)") {
      displayValue = ">200 PPM";
    } else if (parameter == "Potassium (K)") {
      displayValue = ">100 PPM";
    } else if (parameter == "Iron (Fe)") {
      displayValue = "<1 PPM";
    } else if (parameter == "Sodium (Na)") {
      displayValue = ">1500 PPM";
    } else if (parameter == "Chlorine (Cl2)") {
      displayValue = "0 PPM";
    } else if (parameter == "Total Ammonia (TAN)") {
      displayValue = "<0.5 PPM";
    } else if (parameter == "Un-Ionized Ammonia (NH3)") {
      displayValue = "<0.1 PPM";
    } else if (parameter == "Nitrite (NO2)") {
      displayValue = "<0.25 PPM";
    } else if (parameter == "Hydrozen Sulphide (H2S)") {
      displayValue = "<0.01 PPM";
    } else if (parameter == "Carbon Dioxide (CO2)") {
      displayValue = "<10 PPM";
    } else if (parameter == "Dissolved Oxygen (D.O)") {
      displayValue = ">4 PPM";
    } else if (parameter == "Electrical Conductivity (E.C.)") {
      displayValue = "200-1000 µS/cm";
    } else if (parameter == "Total Dissolved Solids (T.D.S.)") {
      displayValue = ">200mg/Ltr";
    } else {
      displayValue = controller.text;
    }

    return DataRow(
      cells: [
        DataCell(
          Container(
            width: 130,
            color: Colors.green[50],
            child: Center(child: Text(parameter)),
          ),
        ),
        DataCell(
          Container(
            width: 130,
            color: Colors.blue[50],
            child: Center(child: Text(displayValue)),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 120,
              child: buildTextFormField(
                  parameter, controller, minValue, maxValue, isRequired),
            ),
          ),
        ),
      ],
    );
  }
}
