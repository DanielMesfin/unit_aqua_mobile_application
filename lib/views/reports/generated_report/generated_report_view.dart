import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/views/reports/generated_report/pdf/water_pdf.dart';
import 'package:unity_labs/views/reports/report_view/report_view_controller.dart';
import 'package:unity_labs/widgets/primary_button.dart';
import 'package:unity_labs/widgets/report_card.dart';

import '../../../themes/theme_text.dart';
import '../../../widgets/custom_text_field.dart';
import 'generated_report_controller.dart';

import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
// import 'pdf_generator.dart';

// ignore: must_be_immutable
class GeneratedReportView extends GetView<GeneratedReportController> {
  GeneratedReportView({super.key});

  GlobalKey reportContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GeneratedReportController>();
    final reportTypt = Get.find<ReportViewController>();
    final planktonControler = Get.find<PlanktonController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            // add to navigate back to home screen
            Get.offAllNamed(
              Routes.home,
            );
          },
        ),
        title: Text("Generated Report",
            style: ThemeText.bodyOne
                .copyWith(color: ConstantColors.appBarTextColor, fontSize: 20)),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: WidgetHelpers.pagePadding(
          child: SingleChildScrollView(
            child: Obx(() => Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: "Pdf",
                          groupValue: controller.selectedOption.value,
                          onChanged: (String? value) {
                            controller.selectedOption.value = value!;
                          },
                        ),
                        Text(
                          "Pdf",
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                        Radio(
                          value: "Jpeg",
                          groupValue: controller.selectedOption.value,
                          onChanged: (String? value) {
                            controller.selectedOption.value = value!;
                          },
                        ),
                        Text(
                          "Jpeg",
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                        Radio(
                          value: "Text",
                          groupValue: controller.selectedOption.value,
                          onChanged: (String? value) {
                            controller.selectedOption.value = value!;
                          },
                        ),
                        Text(
                          "Text",
                          style:
                              ThemeText.bodyOne.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      height: 400,
                      child: GetBuilder<GeneratedReportController>(
                        builder: (controller) {
                          return SingleChildScrollView(
                            child: RepaintBoundary(
                              key: reportContainerKey,
                              child: ReportContainer(
                                farmerName: controller.farmerName,
                                currentReportType:
                                    reportTypt.currentReportType.value,
                                id: controller.id,
                                tankName: controller.tankName,
                                createdAt: controller.createdAt,
                                // status: controller.status,
                                labReportImage: controller.labReportImage,
                                labLogo: controller.labLogo,
                                cultureType: controller.cultureType,
                                resultdata: controller.resultdata,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Share Whatsapp",
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                    ),
                    CustomTextField(
                      labelText: "WhatsApp Number",
                      prefixText: "+91",
                      suffix: IconButton(
                        icon: const Icon(
                          Icons.phone,
                          size: 30,
                        ),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      controller: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: PrimaryButton(
                        isPrimaryButton: false,
                        width: Get.width * .4,
                        height: 50,
                        label: "Download",
                        onPressed: () async {
                          Get.snackbar(
                            "Generating",
                            "Please wait until it finishes",
                          );
                          String phoneNumber =
                              controller.phoneNumberController.text;
                          PdfPageFormat pageFormat = PdfPageFormat.a4;
                          if (controller.selectedOption.value == "Pdf") {
                            Uint8List pdfBytes = await generateReportW(
                              pageFormat,
                              controller.id,
                              controller.farmerName,
                              controller.tankName,
                              controller.createdAt,
                              controller.cultureType,
                              controller.resultdata,
                              controller.labReportImage,
                              controller.labLogo,
                              reportTypt.formType,
                              planktonControler.responseModel,
                            );
                            String fileName=  '${controller.farmerName} and ${controller.tankName}';
                            String filePath =
                                await savePdfToLocalStorage(pdfBytes,fileName);

                            await Share.shareXFiles([XFile(filePath)],
                                text: "Generated Report for $phoneNumber");
                          } else if (controller.selectedOption.value ==
                              "Jpeg") {
                            Uint8List? imageBytes = await controller
                                .captureWidgetToPng(reportContainerKey);
                            await controller.shareCapturedImage(imageBytes);
                                                    } else if (controller.selectedOption.value ==
                              "Text") {
                            await controller.shareGeneratedText();
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
