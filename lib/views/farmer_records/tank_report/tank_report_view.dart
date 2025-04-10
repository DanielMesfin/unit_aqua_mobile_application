import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';
import 'package:unity_labs/views/reports/generated_report/pdf/water_pdf.dart';
import 'package:unity_labs/views/reports/report_view/report_view_controller.dart';
import 'package:unity_labs/widgets/report_card.dart';

import '../../../helpers/widget_helpers.dart';
import '../../../themes/theme_text.dart';
import '../../../model/completed/completed_list.dart';
import 'tank_report_controller.dart';

class TankReportView extends GetView<TankReportController> {
  const TankReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportViewController reportController =
        Get.put(ReportViewController());
    final planktonConter = Get.put(PlanktonController());

    //controller.getAllCompletedList();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            " ",
            style: ThemeText.headlineTwo.copyWith(color: Colors.black),
          ),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: WidgetHelpers.pagePadding(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : GetBuilder<TankReportController>(
                          builder: (controller) {
                            var result = controller.completedList.value?.result;

                            var typeidentifier = controller.formType;
                            print(typeidentifier);
                            var dataForFormType = (result as Result)
                                .toJson()[typeidentifier] as List?;

                            var record = dataForFormType?.firstWhere(
                                (result) => result.id == controller.id);

                            if (record != null) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          "Report Detail",
                                          style: ThemeText.headlineTwo
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          controller.isdowloding(true);
                                          PdfPageFormat pageFormat =
                                              PdfPageFormat.a4;
                                          Uint8List pdfBytes =
                                              await generateReportW(
                                            pageFormat,
                                            controller.id,
                                            record.tank!.farmer!.name,
                                            record.tank!.name,
                                            DateTime.parse(record.createdAt),
                                            record.tank!.cultureType,
                                            record.toMap(),
                                            record.tank!.farmer!.user!
                                                .labReportImage,
                                            record.tank!.farmer!.user!.labLogo,
                                            controller.formType,
                                            planktonConter.responseModel,
                                          );
                                          String fileName= '${record.tank!.farmer!.name} and ${record.tank!.name}';
                                          String filePath =
                                              await savePdfToLocalStorage(
                                                  pdfBytes,fileName);
                                          await Share.shareXFiles(
                                              [XFile(filePath)],
                                              text:
                                                  "Generated Report for from unit lab");
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  controller.isdowloding.value
                                      ? LinearProgressIndicator()
                                      : Container(),
                                  Container(
                                    // child: TankReportContainer(
                                    //   id: controller.id,
                                    //   tankName: record.tank!.name,
                                    //   createdAt:
                                    //       DateTime.parse(record.createdAt),
                                    //   updatedAt:
                                    //       DateTime.parse(record.updatedAt),
                                    //   labReportImage: record
                                    //       .tank!.farmer!.user!.labReportImage,
                                    //   labLogo:
                                    //       record.tank!.farmer!.user!.labLogo,
                                    //   cultureType: record.tank!.cultureType,
                                    //   resultdata: record.toMap(),
                                    //   suggestion: record.suggestion,
                                    // ),
                                    child: ReportContainer(
                                      farmerName:
                                          record.tank!.farmer!.name ?? "",
                                      currentReportType:
                                          controller.currentReportType.value,
                                      id: controller.id,
                                      tankName: record.tank!.name,
                                      createdAt:
                                          DateTime.parse(record.createdAt),
                                      //  :
                                      //       DateTime.parse(record.updatedAt),
                                      labReportImage: record
                                          .tank!.farmer!.user!.labReportImage,
                                      labLogo:
                                          record.tank!.farmer!.user!.labLogo,
                                      cultureType: record.tank!.cultureType,
                                      resultdata: record.toMap(),

                                      // suggestion: record.suggestion,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Text("No matching record found.");
                            }
                          },
                        ),
                ),
              ),
            )));
  }
}
