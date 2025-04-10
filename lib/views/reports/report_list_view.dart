import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/views/reports/report_list_card.dart';

import '../../themes/theme_text.dart';
import 'report_list_controller.dart';

class ReportListView extends GetView<ReportListController> {
  const ReportListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ConstantColors.appBarBackgroundColor,
        title: Text(
          "Reports",
          style: ThemeText.headlineTwo
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: WidgetHelpers.pagePadding(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Water',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getWaterTypeCount(controller.waterReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getWaterTypeCount(
                                    controller.waterReport.value) ??
                                0,
                            (index) {
                              final waterItem = controller
                                  .waterReport.value?.result
                                  .where(
                                      (report) => report.alltest?.status == "2")
                                  .elementAt(index);

                              if (waterItem != null) {
                                return ReportListCard(
                                  name: waterItem.tank.farmer.name,
                                  size: waterItem.tank.size,
                                  area: waterItem.tank.area,
                                  cultureType: waterItem.tank.cultureType,
                                  tankId: waterItem.tankId,
                                  testId: waterItem.testId,
                                  id: waterItem.id,
                                  formType: 'water',
                                  controller: controller,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fish',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getFishTypeCount(controller.fishReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getFishTypeCount(
                                    controller.fishReport.value) ??
                                0,
                            (index) {
                              final fishItem = controller
                                  .fishReport.value?.result
                                  .where(
                                      (report) => report.alltest?.status == "2")
                                  .elementAt(index);

                              if (fishItem != null) {
                                return ReportListCard(
                                    name: fishItem.tank.farmer.name,
                                    size: fishItem.tank.size,
                                    area: fishItem.tank.area,
                                    cultureType: fishItem.tank.cultureType,
                                    tankId: fishItem.tankId,
                                    testId: fishItem.testId,
                                    id: fishItem.id,
                                    formType: 'fish',
                                    controller: controller);
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shrimp',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getShrimpTypeCount(controller.shrimpReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getShrimpTypeCount(
                                    controller.shrimpReport.value) ??
                                0,
                            (index) {
                              final shrimpItem = controller
                                  .shrimpReport.value!.result!
                                  .where(
                                      (report) => report.alltest?.status == "2")
                                  .elementAt(index);

                              return ReportListCard(
                                name: shrimpItem.tank!.farmer!.name!,
                                size: shrimpItem.tank!.size!,
                                area: shrimpItem.tank!.area!,
                                cultureType: shrimpItem.tank!.cultureType!,
                                tankId: shrimpItem.tankId!,
                                testId: shrimpItem.testId!,
                                id: shrimpItem.id!,
                                formType: 'shrimp',
                                controller: controller,
                              );
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Soil',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getSoilTypeCount(controller.soilReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getSoilTypeCount(
                                    controller.soilReport.value) ??
                                0,
                            (index) {
                              final soilItem = controller
                                  .soilReport.value?.result
                                  .where(
                                      (report) => report.alltest.status == "2")
                                  .elementAt(index);

                              if (soilItem != null) {
                                return ReportListCard(
                                  name: soilItem.tank.farmer.name,
                                  size: soilItem.tank.size,
                                  area: soilItem.tank.area,
                                  cultureType: soilItem.tank.cultureType,
                                  tankId: soilItem.tankId,
                                  testId: soilItem.testId,
                                  id: soilItem.id,
                                  formType: 'soil',
                                  controller: controller,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PCR',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getPcrTypeCount(controller.pcrReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getPcrTypeCount(
                                    controller.pcrReport.value) ??
                                0,
                            (index) {
                              final pcrItem = controller.pcrReport.value?.result
                                  ?.where(
                                      (report) => report.alltest?.status == "2")
                                  .elementAt(index);

                              if (pcrItem != null) {
                                return ReportListCard(
                                  name: pcrItem.tank!.farmer!.name!,
                                  size: pcrItem.tank!.size!,
                                  area: pcrItem.tank!.area!,
                                  cultureType: pcrItem.tank!.cultureType!,
                                  tankId: pcrItem.tankId!,
                                  testId: pcrItem.testId!,
                                  id: pcrItem.id!,
                                  formType: 'pcr',
                                  controller: controller,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Feed',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getFeedTypeCount(controller.feedReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getFeedTypeCount(
                                    controller.feedReport.value) ??
                                0,
                            (index) {
                              final feedItem = controller
                                  .feedReport.value?.result
                                  .where(
                                      (report) => report.alltest.status == "2")
                                  .elementAt(index);

                              if (feedItem != null) {
                                return ReportListCard(
                                  name: feedItem.tank.farmer.name,
                                  size: feedItem.tank.size,
                                  area: feedItem.tank.area,
                                  cultureType: feedItem.tank.cultureType,
                                  tankId: feedItem.tankId,
                                  testId: feedItem.testId,
                                  id: feedItem.id,
                                  formType: 'feed',
                                  controller: controller,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Culture',
                                style: ThemeText.bodyOne,
                              ),
                              Text(
                                '${controller.getCultureTypeCount(controller.cultureReport.value)}',
                                style: ThemeText.bodyOne
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          children: List.generate(
                            controller.getCultureTypeCount(
                                    controller.cultureReport.value) ??
                                0,
                            (index) {
                              final cultureItem = controller
                                  .cultureReport.value?.result
                                  .where(
                                      (report) => report.alltest.status == "2")
                                  .elementAt(index);

                              if (cultureItem != null) {
                                return ReportListCard(
                                  name: cultureItem.tank.farmer.name,
                                  size: cultureItem.tank.size,
                                  area: cultureItem.tank.area,
                                  cultureType: cultureItem.tank.cultureType,
                                  tankId: cultureItem.tankId,
                                  testId: cultureItem.testId,
                                  id: cultureItem.id,
                                  formType: 'culture',
                                  controller: controller,
                                );
                              } else {
                                return Container();
                              }
                            },
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
