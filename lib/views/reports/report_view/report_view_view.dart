import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/report_card.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/custom_colors.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/primary_button.dart';
import 'report_view_controller.dart';

class ReportView extends GetView<ReportViewController> {
  const ReportView({super.key});

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
          "Reports",
          style: ThemeText.headlineTwo
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: WidgetHelpers.pagePadding(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => controller.isLoading.isTrue
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 450,
                            child: GetBuilder<ReportViewController>(
                              builder: (controller) {
                                if (controller.currentReport.value != null &&
                                    controller
                                            .currentReport.value!.statusCode ==
                                        200) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ReportContainer(
                                          currentReportType: controller
                                              .currentReportType.value,
                                          id: controller.id,
                                          farmerName: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .name,
                                          tankName: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .name,
                                          createdAt: DateTime.parse(controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .createdAt),
                                          // status: controller
                                          //     .currentReport.value!.result
                                          //     .firstWhere((result) =>
                                          //         result.id == controller.id)
                                          //     .status
                                          //     .toMap(),
                                          labReportImage: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .user
                                              .labReportImage,
                                          labLogo: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .user
                                              .labLogo,
                                          cultureType: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .cultureType,
                                          resultdata: controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .toMap(),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Suggestions:",
                            style: ThemeText.headlineTwo
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.suggestionController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xfff2f2f2),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none,
                                    ),
                                    labelText: "Leave your suggestion here",
                                    labelStyle: ThemeText.bodyOne_50,
                                    errorStyle: ThemeText.bodyThree.copyWith(
                                        color: CustomColors.errorColor),
                                  ),
                                  validator: (value) => value
                                      .toString()
                                      .validateField(fieldName: "Suggestion"),
                                  maxLines: controller.isTextFieldExpanded.value
                                      ? 5
                                      : 1,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      controller.toggleTextFieldExpansion();
                                    },
                                    icon: Icon(
                                      controller.isTextFieldExpanded.value
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      controller.isTextFieldExpanded.value
                                          ? "Collapse Suggestion Field"
                                          : "Expand Suggestion Field",
                                      style: ThemeText.bodyOne
                                          .copyWith(color: Colors.black),
                                    ),
                                    style: ButtonStyle(
                                      side: WidgetStateProperty.all(
                                        const BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Obx(
                        () => controller.isLoading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PrimaryButton(
                                height: 50,
                                width: 200,
                                label: "Generate Report",
                                onPressed: () async {
                                  await controller.addSuggestionToReport(
                                      controller.id,
                                      controller.formType,
                                      controller.testId);
                                  if (controller.canRedirect.isTrue) {
                                    Get.toNamed(Routes.generatedReport,
                                        arguments: {
                                          'farmer': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .name,
                                          'id': controller.id,
                                          'suggetions': controller
                                              .suggestionController.text,
                                          'tankName': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .name,
                                          'createdAt': DateTime.parse(controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .createdAt),
                                          'labReportImage': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .user
                                              .labReportImage,
                                          'labLogo': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .farmer
                                              .user
                                              .labLogo,
                                          'cultureType': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .tank
                                              .cultureType,
                                          'resultdata': controller
                                              .currentReport.value!.result
                                              .firstWhere((result) =>
                                                  result.id == controller.id)
                                              .toMap(),
                                        });
                                  } else {
                                    Get.snackbar(
                                      "Error",
                                      "Failed to Generate Report" ?? "",
                                      backgroundColor: Colors.red[400],
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
