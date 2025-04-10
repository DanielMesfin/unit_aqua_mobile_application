import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import 'create_treatment_farmer_controller.dart';

class CreateTreatmentFramerView
    extends GetView<CreateTreatmentFramerController> {
  const CreateTreatmentFramerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: WidgetHelpers.pagePadding(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Farmers Data',
                  style: ThemeText.headlineThree,
                ),
                Text(
                  '(Who experienced this Treatment)',
                  style: ThemeText.headlineThree,
                ),
                CustomTextField(
                    controller: controller.nameOne,
                    labelText: "Farmer Name 1",
                    validator: (value) => value
                        .toString()
                        .validateField(fieldName: "Farmer Name 1")),
                CustomTextField(
                    controller: controller.tankOne,
                    labelText: "Tank",
                    validator: (value) =>
                        value.toString().validateField(fieldName: "Tank")),
                CustomTextField(
                    controller: controller.phoneOne,
                    labelText: "Mobile No.",
                    validator: (value) =>
                        value.toString().validateField(fieldName: "Tank")),
                CustomTextField(
                  controller: controller.nameTwo,
                  labelText: "Farmer Name 2",
                ),
                CustomTextField(
                  controller: controller.tankTwo,
                  labelText: "Tank",
                ),
                CustomTextField(
                  controller: controller.phoneTwo,
                  labelText: "Mobile No.",
                ),
                CustomTextField(
                  controller: controller.nameThree,
                  labelText: "Farmer Name 3",
                ),
                CustomTextField(
                  controller: controller.tankThree,
                  labelText: "Tank",
                ),
                CustomTextField(
                  controller: controller.phoneThree,
                  labelText: "Mobile No.",
                ),
                Center(
                  child: PrimaryButton(
                    isLoading: controller.isLoading,
                    hasLoading: true,
                    label: "Submit",
                    onPressed: () => controller.createTreatmentFramer(),
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
