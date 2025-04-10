import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../../themes/theme_text.dart';
import 'feed_test_report_controller.dart';

class FeedTestReportView extends GetView<FeedTestReportController> {
  FeedTestReportView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Feed Test Form",
          style: ThemeText.headlineTwo.copyWith(
            color: ConstantColors.appBarTextColor,
          ),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: _formKey,
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
                const SizedBox(
                  height: 15,
                ),
                buildTextFormField("Fat %", controller.fatController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormField("Protein %", controller.proteinController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormField("Moisture %", controller.moistureController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormField("Ash %", controller.ashController),
                const SizedBox(
                  height: 15,
                ),
                buildTextFormField("Fiber %", controller.fiberController),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          // hasLoading: true,
                          // isLoading: controller.isLoading,
                          isPrimaryButton: false,
                          width: Get.width * 0.9,
                          height: 60,
                          label: "Submit",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("here");
                              final fat = double.tryParse(
                                      controller.fatController.text) ??
                                  0.0;
                              final protein = double.tryParse(
                                      controller.proteinController.text) ??
                                  0.0;
                              final moisture = double.tryParse(
                                      controller.moistureController.text) ??
                                  0.0;
                              final ash = double.tryParse(
                                      controller.ashController.text) ??
                                  0.0;
                              final fiber = double.tryParse(
                                      controller.fiberController.text) ??
                                  0.0;
                              final tankId = controller.tankId;
                              final testId = controller.testId;

                              controller.feedCreateTest(
                                controller.fatController.text,
                                controller.proteinController.text,
                                controller.moistureController.text,
                                controller.ashController.text,
                                controller.fiberController.text,
                                tankId,
                                testId,
                              );
                            }
                          },
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
      String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }

        double enteredValue = double.tryParse(value) ?? 0.0;

        if (enteredValue > 100) {
          return '$labelText cannot be more than 100%';
        }

        return null; // Validation passed
      },
    );
  }
}
