import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../themes/custom_colors.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_text_field.dart';
import 'farmer_controller.dart';

class FarmerView extends GetView<FarmerController> {
  const FarmerView({super.key});

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
            "Tank Registration",
            style: ThemeText.headlineTwo
                .copyWith(color: ConstantColors.appBarTextColor),
          ),
        ),
        body: WidgetHelpers.pagePadding(
          child: Form(
            key: controller.formKeyF,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.farmernameForheader!} & ${controller.farmerareaForheader!}",
                        style: ThemeText.headlineFour,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Previous Tanks',
                        style:
                            ThemeText.headlineFour.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return controller.tanks.isEmpty
                        ? const Center(
                            child: Text('No tanks added'),
                          )
                        : Column(
                            children: <Widget>[
                              for (int i = 0;
                                  i <
                                      (controller.showAllTanks.value
                                          ? controller.tanks.length
                                          : min(3, controller.tanks.length));
                                  i++)
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: Get.height * 0.02),
                                  child: PrimaryButton(
                                    width: Get.width,
                                    label: controller.tanks[i].name,
                                    onPressed: () {
                                      int? specificTankId =
                                          controller.tanks[i].id;
                                      controller.getTankById(
                                          tankId: specificTankId!);
                                      print("############3");
                                    },
                                  ),
                                ),
                              if (controller.tanks.length > 3)
                                GestureDetector(
                                  onTap: () {
                                    controller.showAllTanks.value =
                                        !controller.showAllTanks.value;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        controller.showAllTanks.value
                                            ? 'Show Less Tanks'
                                            : 'Show More Tanks',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Icon(
                                        controller.showAllTanks.value
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                  }),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Or',
                      style:
                          ThemeText.headlineThree.copyWith(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "Culture Type",
                    style: ThemeText.bodyOne,
                  ),
                  const SizedBox(height: 20),
                  GroupButton(
                    // controller: controller.groupButtonController,
                    isRadio: true,
                    onSelected: (value, index, isSelected) {
                      controller.cultureType = value;
                    },
                    buttons: ["Fish", "Shrimp", "Poly"],
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
                  CustomTextField(
                      labelText: "Tank Size in Acres",
                      controller: controller.tankSizeController,
                      validator: (value) => value.toString().validateField(
                            fieldName: "Tank Size in Acres",
                          ),
                      keyboardType: TextInputType.number),
                  CustomTextField(
                      labelText: "Location",
                      controller: controller.areaController,
                      validator: (value) =>
                          value.toString().validateField(fieldName: "Area"),
                      keyboardType: TextInputType.text),
                  const SizedBox(height: 40),
                  Obx(
                    () => controller.isLoading.isTrue
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : PrimaryButton(
                            width: Get.width,
                            isPrimaryButton: false,
                            label: "Add Tank",
                            onPressed: () => controller.registerTank(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
