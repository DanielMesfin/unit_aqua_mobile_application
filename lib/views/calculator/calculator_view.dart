import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import 'calculator_controller.dart';

class CalculatorView extends GetView<CalculatorController> {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          controller.name,
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                controller: controller.inputOneController,
                labelText: "Input One",
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value.toString().validateField(fieldName: "Input One"),
              ),
              CustomTextField(
                controller: controller.inputTwoController,
                labelText: "Input Two",
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value.toString().validateField(fieldName: "Input Two"),
              ),
              const SizedBox(height: 50),
              PrimaryButton(
                hasLoading: true,
                isLoading: controller.isLoading,
                label: "Submit",
                onPressed: () => controller.onSumbit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
