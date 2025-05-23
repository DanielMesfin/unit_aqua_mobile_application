import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/my_work_records/chart_data.dart';
import 'package:unity_labs/views/my_work_records/my_work_records_controller.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';
import 'my_completed_work/completed_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyWorkRecordsView extends GetView<MyWorkRecordsController> {
  const MyWorkRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
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
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('No. of Tests',
              style: ThemeText.bodyOne_50.copyWith(
                  fontSize: 18, color: ConstantColors.appBarTextColor)),
          Obx(() {
            return Row(
              children: [
                SizedBox(width: 5),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    DropdownButton<String>(
                      value: controller.selectedFilter.value,
                      onChanged: controller.onFilterChanged,
                      underline: SizedBox(),
                      items: controller.filters
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value.capitalize!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      icon: SizedBox.shrink(),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 30,
                            semanticLabel: 'Arrow Down',
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          })
        ]),
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
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Water',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getWaterTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getWaterTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final waterItem = controller
                                    .completedList.value!.result!.water!
                                    .elementAt(index);

                                return CompletedCard(
                                  name: waterItem.tank!.farmer!.name,
                                  size: waterItem.tank!.size,
                                  area: waterItem.tank!.area,
                                  cultureType: waterItem.tank!.cultureType,
                                  tankId: waterItem.tankId,
                                  testId: waterItem.testId,
                                  id: waterItem.id,
                                  formType: 'water',
                                  controller: controller,
                                  //planktonyesorno: waterItem.planktonTest,
                                );
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fish',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getFishTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getFishTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final fishItem = controller
                                    .completedList.value?.result?.fish
                                    ?.elementAt(index);
                                if (fishItem != null) {
                                  return CompletedCard(
                                    name: fishItem.tank!.farmer!.name,
                                    size: fishItem.tank!.size,
                                    area: fishItem.tank!.area,
                                    cultureType: fishItem.tank!.cultureType,
                                    tankId: fishItem.tankId,
                                    testId: fishItem.testId,
                                    id: fishItem.id,
                                    formType: 'fish',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shrimp',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getShrimpTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getShrimpTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final shrimpItem = controller
                                    .completedList.value?.result?.shrimp
                                    ?.elementAt(index);

                                if (shrimpItem != null) {
                                  return CompletedCard(
                                    name: shrimpItem.tank?.farmer!.name,
                                    size: shrimpItem.tank?.size,
                                    area: shrimpItem.tank?.area,
                                    cultureType: shrimpItem.tank?.cultureType,
                                    tankId: shrimpItem.tankId,
                                    testId: shrimpItem.testId,
                                    id: shrimpItem.id,
                                    formType: 'shrimp',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Soil',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getSoilTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getSoilTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final soilItem = controller
                                    .completedList.value?.result?.soil
                                    ?.elementAt(index);
                                if (soilItem != null) {
                                  return CompletedCard(
                                    name: soilItem.tank!.farmer!.name,
                                    size: soilItem.tank!.size,
                                    area: soilItem.tank!.area,
                                    cultureType: soilItem.tank!.cultureType,
                                    tankId: soilItem.tankId,
                                    testId: soilItem.testId,
                                    id: soilItem.id,
                                    formType: 'soil',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PCR',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getPCRTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getPCRTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final pcrItem = controller
                                    .completedList.value?.result?.pcr
                                    ?.elementAt(index);
                                if (pcrItem != null) {
                                  return CompletedCard(
                                    name: pcrItem.tank!.farmer!.name,
                                    size: pcrItem.tank!.size,
                                    area: pcrItem.tank!.area,
                                    cultureType: pcrItem.tank!.cultureType,
                                    tankId: pcrItem.tankId,
                                    testId: pcrItem.testId,
                                    id: pcrItem.id,
                                    formType: 'pcr',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Feed',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getFeedTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getFeedTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final feedItem = controller
                                    .completedList.value?.result?.feed
                                    ?.elementAt(index);
                                if (feedItem != null) {
                                  return CompletedCard(
                                    name: feedItem.tank!.farmer!.name,
                                    size: feedItem.tank!.size,
                                    area: feedItem.tank!.area,
                                    cultureType: feedItem.tank!.cultureType,
                                    tankId: feedItem.tankId,
                                    testId: feedItem.testId,
                                    id: feedItem.id,
                                    formType: 'feed',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Culture',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getCultureTypeCount(controller.completedList.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getCultureTypeCount(
                                      controller.completedList.value) ??
                                  0,
                              (index) {
                                final cultureItem = controller
                                    .completedList.value?.result?.culture
                                    ?.elementAt(index);
                                if (cultureItem != null) {
                                  return CompletedCard(
                                    name: cultureItem.tank!.farmer!.name,
                                    size: cultureItem.tank!.size,
                                    area: cultureItem.tank!.area,
                                    cultureType: cultureItem.tank!.cultureType,
                                    tankId: cultureItem.tankId,
                                    testId: cultureItem.testId,
                                    id: cultureItem.id,
                                    formType: 'culture',
                                    controller: controller,
                                    //planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // children: List.generate(
                            //   controller.getFeedTypeCount(controller.testPending.value),
                            //   (index) => TestCard(),
                            // ),
                          ),
                        ),
                        Container(
                          height: 1.0,
                          color: Colors.black,
                        ),
                        // Bottom Section (Equal Height)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Test Graph',
                                      style: ThemeText.bodyOne_50
                                          .copyWith(fontSize: 15)),

                                  // Row(
                                  //   children: [
                                  //     Text('Tod',
                                  //         style: ThemeText.bodyOne_50
                                  //             .copyWith(fontSize: 15)),
                                  //     Container(
                                  //       width: 30,
                                  //       height: 30,
                                  //       decoration: const BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         color: Colors.black,
                                  //       ),
                                  //       child: const Center(
                                  //         child: Icon(
                                  //           Icons.arrow_drop_down,
                                  //           color: Colors.white,
                                  //           size: 30,
                                  //           semanticLabel: 'Arrow Down',
                                  //           textDirection: TextDirection.ltr,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     const SizedBox(width: 15),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     Text('Fi',
                                      //         style: ThemeText.bodyOne_50
                                      //             .copyWith(fontSize: 15)),
                                      //     Container(
                                      //       width: 30,
                                      //       height: 30,
                                      //       decoration: const BoxDecoration(
                                      //         shape: BoxShape.circle,
                                      //         color: Colors.black,
                                      //       ),
                                      //       child: const Center(
                                      //         child: Icon(
                                      //           Icons.arrow_drop_down,
                                      //           color: Colors.white,
                                      //           size: 30,
                                      //           semanticLabel: 'Arrow Down',
                                      //           textDirection:
                                      //               TextDirection.ltr,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 5),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SfCartesianChart(
                              primaryYAxis: NumericAxis(
                                minimum: 0,
                                maximum: 40,
                                interval: 10,
                              ),
                              primaryXAxis: CategoryAxis(),
                              tooltipBehavior: controller.tooltip,
                              series: <CartesianSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                    dataSource: controller.data.value,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: 'Gold',
                                    color: Color.fromRGBO(8, 142, 255, 1))
                              ],
                            ),

                            // Center(
                            //   child: Container(
                            //     height: 200,
                            //     margin: const EdgeInsets.only(
                            //         top: 10.0, left: 50.0, right: 50.0),
                            //     color: Colors.grey,
                            //   ),
                            // ),

                            // Align(
                            //   alignment: Alignment.bottomRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(right: 16.0),
                            //     child: Text('Colours = Test Names',
                            //         style: ThemeText.bodyOne_50),
                            //   ),
                            // ),

                            SizedBox(
                              height: 10,
                            ),
                            PoweredByText(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
