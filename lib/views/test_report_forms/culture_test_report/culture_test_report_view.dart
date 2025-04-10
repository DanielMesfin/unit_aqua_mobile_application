import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../../themes/theme_text.dart';
import 'culture_test_report_controller.dart';

class CultureTestReportView extends GetView<CultureTestReportController> {
  CultureTestReportView({super.key});

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
          "Culture Test Form",
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
                buildFormContainer(
                  labelText: "Yellow Colonies",
                  optimalLabelText: "(0-500 CFU/ML)",
                  controller: controller.yellowColoniesController,
                  imageAssetPath: 'assets/images/yellowCulture.jpeg',
                  maximaLength: 3,
                ),
                const SizedBox(
                  height: 15,
                ),
                buildFormContainer(
                    labelText: "Green Colonies",
                    optimalLabelText: "(0-50 CFU/ML)",
                    controller: controller.greenColoniesController,
                    imageAssetPath: 'assets/images/greenCulture.jpeg',
                    maximaLength: 2),
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
                            isPrimaryButton: false,
                            width: Get.width * 0.9,
                            height: 60,
                            label: "Submit",
                            onPressed: () {
                              print("here");
                              final yellowColonies = double.tryParse(controller
                                      .yellowColoniesController.text) ??
                                  0.0;
                              final greenColonies = double.tryParse(controller
                                      .greenColoniesController.text) ??
                                  0.0;

                              final tankId = controller.tankId;
                              final testId = controller.testId;

                              controller.cultureCreateTest(
                                controller.yellowColoniesController.text,
                                controller.greenColoniesController.text,
                                tankId,
                                testId,
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
    );
  }

  Widget buildTextFormField(
      String labelText, TextEditingController controller, int maximaLength) {
    return TextFormField(
      controller: controller,
      maxLength: maximaLength,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(vertical: 35),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null; // Validation passed
      },
    );
  }

  Widget buildFormContainer({
    required String labelText,
    required String optimalLabelText,
    required TextEditingController controller,
    required String imageAssetPath,
    required int maximaLength,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$labelText $optimalLabelText",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset(
                imageAssetPath,
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 16),
              Container(
                width: 1,
                height: 100,
                color: Colors.black,
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Container(
                  child:
                      buildTextFormField(labelText, controller, maximaLength),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
