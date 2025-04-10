import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import '../../themes/custom_colors.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'tank_controller.dart';

class TankView extends GetView<TankController> {
  const TankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "Sample Registration",
          style: ThemeText.headlineThree
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKeyTestk,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  controller.tankName,
                  style: ThemeText.headlineTwo.copyWith(color: Colors.black),
                ),
                Text(
                  "Sample Data",
                  style: ThemeText.bodyOne.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                GroupButton(
                  // controller: controller.groupButtonController,
                  isRadio: true,
                  onSelected: (value, index, isSelected) {
                    controller.selectedButtonIndex.value = index;
                  },

                  buttons: [
                    "Water",
                    "Fish",
                    "Shrimp",
                    "Soil",
                    "PCR",
                    "Culture",
                    "Feed",
                  ],
                  options: GroupButtonOptions(
                    mainGroupAlignment: MainGroupAlignment.start,
                    selectedColor: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    unselectedTextStyle: ThemeText.bodyTwo,
                    selectedTextStyle:
                        ThemeText.bodyTwo.copyWith(color: Colors.white),
                    unselectedBorderColor: Colors.grey[300],
                    unselectedColor: Colors.transparent,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Visibility(
                    visible: controller.selectedButtonIndex == 0,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text("Need Plankton Test",
                                  style: ThemeText.headlineTwo),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.setYesNoButtonIndex(1);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          controller.yesNoButtonIndex.value == 1
                                              ? CustomColors.primaryColor
                                              : Colors.grey[300],
                                    ),
                                    child: Text(
                                      "Yes",
                                      style: ThemeText.bodyTwo,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.setYesNoButtonIndex(2);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          controller.yesNoButtonIndex.value == 2
                                              ? CustomColors.primaryColor
                                              : Colors.grey[300],
                                    ),
                                    child: Text(
                                      "No",
                                      style: ThemeText.bodyTwo,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: [1, 2]
                                .contains(controller.yesNoButtonIndex.value),
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  "Add some more data",
                                  style: ThemeText.headlineTwo,
                                ),
                                const SizedBox(height: 20),
                                CustomTextField(
                                  labelText: "Tank depth in feet",
                                  controller: controller.depthController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) => value
                                      .toString()
                                      .validateField(
                                          fieldName: "Tank depth in feet"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Obx(
                        //   () => Visibility(
                        //     visible:
                        //         [1].contains(controller.yesNoButtonIndex.value),
                        //     child: Column(
                        //       children: [
                        //         const SizedBox(height: 30),
                        //         Text(
                        //           "Plankton Test",
                        //           style: ThemeText.headlineTwo,
                        //         ),
                        //         const SizedBox(height: 20),
                        //         CustomTextField(
                        //             labelText: "Fat",
                        //             controller: controller.plakfatController,
                        //             keyboardType: TextInputType.number),
                        //         CustomTextField(
                        //             labelText: "Protein",
                        //             controller: controller.plankProteinController,
                        //             keyboardType: TextInputType.number),
                        //         CustomTextField(
                        //             labelText: "Moisture",
                        //             controller:
                        //                 controller.plankMoistureController,
                        //             keyboardType: TextInputType.number),
                        //         CustomTextField(
                        //             labelText: "Ash",
                        //             controller: controller.plankAshController,
                        //             keyboardType: TextInputType.number),
                        //         CustomTextField(
                        //             labelText: "fiber",
                        //             controller: controller.fiberController,
                        //             keyboardType: TextInputType.number),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

                Obx(
                  () => Visibility(
                    visible: controller.selectedButtonIndex.value == 1,
                    child: Column(
                      children: [
                        Text(
                          "Add some more data",
                          style: ThemeText.headlineTwo,
                        ),
                        const SizedBox(height: 20),
                        // CustomDropdown<String>(
                        //   labelText: 'Fish type',
                        //   items: controller.getFishDropdownItems(),
                        //   onChanged: controller.onFishTypeChanged,
                        //   hintText: 'Select a fish type',
                        // ),
                        CustomTextField(
                          labelText: "Tank depth in feet",
                          controller: controller.depthController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Tank depth in feet"),
                        ),
                        CustomTextField(
                          labelText: "Total Biomass in Kgs",
                          controller: controller.biomassController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Total Biomas"),
                        ),
                        CustomTextField(
                          labelText: "Average weight in Gms",
                          controller: controller.weightController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value.toString().validateField(
                              fieldName: "Average weight in Gms"),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: [2].contains(controller.selectedButtonIndex.value),
                    child: Column(
                      children: [
                        Text(
                          "Add some more data",
                          style: ThemeText.headlineTwo,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: "DOC",
                          controller: controller.docController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value.toString().validateField(fieldName: "DOC"),
                        ),
                        CustomTextField(
                          labelText: "Avg Body Wt",
                          controller: controller.avgBodyWitController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Avg Body Wt"),
                        ),
                        CustomTextField(
                          labelText: "Total Biomass",
                          controller: controller.totalbioController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Total Biomass"),
                        ),
                        CustomTextField(
                          labelText: "Total Feeding per day",
                          controller: controller.totalfeedingperdayController,
                          keyboardType: TextInputType.number,
                          validator: (value) => value.toString().validateField(
                              fieldName: "Total Feeding per day"),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text(
                //   "Add some more data",
                //   style: ThemeText.headlineTwo,
                // ),
                // const SizedBox(height: 20),
                // CustomTextField(
                //   labelText: "Tank depth in feet",
                //   controller: controller.depthController,
                // ),
                // CustomTextField(
                //   labelText: "Total Biomas",
                //   controller: controller.biomassController,
                // ),
                // CustomTextField(
                //   labelText: "Average weight in Gms",
                //   controller: controller.weightController,
                // ),
                const SizedBox(height: 50),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          width: Get.width,
                          isPrimaryButton: false,
                          label: "Create Test",
                          onPressed: () {
                            final type = controller.selectedButtonIndex == 0
                                ? "Water"
                                : controller.selectedButtonIndex == 1
                                    ? "Fish"
                                    : controller.selectedButtonIndex == 2
                                        ? "Shrimp"
                                        : controller.selectedButtonIndex == 3
                                            ? "Soil"
                                            : controller.selectedButtonIndex ==
                                                    4
                                                ? "PCR"
                                                : controller.selectedButtonIndex ==
                                                        5
                                                    ? "Culture"
                                                    : controller.selectedButtonIndex ==
                                                            6
                                                        ? "Feed"
                                                        : "Water";
                            final depth = controller.depthController.text;
                            final biomass = controller.biomassController.text;
                            final weight = controller.weightController.text;

                            final planktonTest =
                                controller.yesNoButtonIndex.value == 1
                                    ? 'Yes'
                                    : 'No';

                            controller.createTest(
                                type, depth, biomass, weight, planktonTest);
                          },
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
