import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/report_card.dart';
import '../../../model/completed/completed_list.dart';
import '../../../themes/theme_text.dart';
import 'completed_report_view_controller.dart';

class CompletedReportView extends GetView<CompletedReportViewController> {
  const CompletedReportView({super.key});

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
            "Completed Reports",
            style: ThemeText.headlineTwo
                .copyWith(color: ConstantColors.appBarTextColor),
          ),
        ),
        body: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: WidgetHelpers.pagePadding(
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: Center(child: CircularProgressIndicator()))
                      : GetBuilder<CompletedReportViewController>(
                          builder: (controller) {
                            var result = controller.completedList.value?.result;

                            // var dataForFormType = (result as dynamic)
                            //     ?.controller
                            //     .formType as List?;
                            var typeidentifier = controller.formType;
                            var dataForFormType = (result as Result)
                                .toJson()[typeidentifier] as List?;

                            var record = dataForFormType?.firstWhere(
                                (result) => result.id == controller.id);

                            if (record != null) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Report Detail",
                                      style: ThemeText.headlineTwo
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    // child: CompletedReportContainer(
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
                                      farmerName: record.tank!.farmer!.name,
                                      currentReportType: controller
                                          .finshedcurrentReportType.value,
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
