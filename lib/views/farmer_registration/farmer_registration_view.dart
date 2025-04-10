import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../themes/theme_text.dart';
import 'farmer_registration_controller.dart';

class FarmerRegistrationView extends GetView<FarmerRegistrationController> {
  const FarmerRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    //List<String> states = controller.stateDistricts.keys.toList();
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
        title: Text("Farmer Registration",
            style: ThemeText.bodyOne
                .copyWith(color: ConstantColors.appBarTextColor, fontSize: 20)),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKeyR,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextField(
                  maxLength: 10,
                  labelText: "WhatsApp Number",
                  suffix: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.getTank();
                    },
                  ),
                  controller: controller.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value.toString().validateField(fieldName: "WhatsApp No."),
                ),
                CustomTextField(
                  labelText: "Name of the Farmer",
                  controller: controller.famerNameController,
                  validator: (value) => value
                      .toString()
                      .validateField(fieldName: "Name of the Farmer"),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02,
                  ),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(() => DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                        ),
                        hint: const Text('State'),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        value: controller.selectedState.isEmpty
                            ? null
                            : controller.selectedState.value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedState.value = newValue;

                            controller.selectedDistrict.value =
                                controller.stateDistricts[newValue]?.first ??
                                    '';
                          }
                        },
                        items: controller.states.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'State should be selected';
                          }
                          return null;
                        },
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02,
                  ),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Obx(() => DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle,
                        ),
                        hint: const Text('District'),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        value: controller.selectedDistrict.isEmpty
                            ? null
                            : controller.selectedDistrict.value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedDistrict.value = newValue;
                          }
                        },
                        items: (controller.stateDistricts[
                                    controller.selectedState.value] ??
                                [])
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'District should be selected';
                          }
                          return null;
                        },
                      )),
                ),
                CustomTextField(
                  labelText: "Area",
                  controller: controller.areaController,
                  validator: (value) =>
                      value.toString().validateField(fieldName: "Area"),
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
                  buttons: ["Fish", "Shrimp", "Both", "Poly"],
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
                const SizedBox(height: 30),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          width: Get.width,
                          isPrimaryButton: false,
                          label: "Next",
                          onPressed: () => controller.registerFarmer(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
