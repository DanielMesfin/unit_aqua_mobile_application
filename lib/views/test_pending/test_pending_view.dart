import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/views/test_pending/test_card.dart';
import 'package:unity_labs/views/test_pending/test_pending_controller.dart';

import '../../themes/theme_text.dart';

class TestPendingView extends GetView<TestPendingController> {
  const TestPendingView({super.key});
  
  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> scaffoldKeyB = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKeyB,
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarTextColor,
          iconSize: 30.0,
          onPressed: () {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   Get.toNamed(Routes.home);
            // });
            
            Navigator.pop(context);
          
          },
        ),
        title: Text("Test Pending",
            style: ThemeText.bodyOne
                .copyWith(color: ConstantColors.appBarTextColor, fontSize: 20)),
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
                                  '${controller.getWaterTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getWaterTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final waterItem = controller
                                    .testPending.value?.result.water
                                    .elementAt(index);

                                if (waterItem != null) {
                                  return TestCard(
                                    //name: waterItem.tank!.name,
                                    name: waterItem.tank!.farmer.name,
                                    size: waterItem.tank!.size,
                                    area: waterItem.tank!.area,
                                    cultureType: waterItem.tank!.cultureType,
                                    tankId: waterItem.tankId,
                                    testId: waterItem.id,
                                    formType: 'water',
                                    controller: controller,
                                    planktonyesorno: waterItem.planktonTest,
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
                                  'Fish',
                                  style: ThemeText.bodyOne,
                                ),
                                Text(
                                  '${controller.getFishTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getFishTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final fishItem = controller
                                    .testPending.value?.result.fish
                                    .elementAt(index);
                                if (fishItem != null) {
                                  return TestCard(
                                    name: fishItem.tank!.farmer.name,
                                    size: fishItem.tank!.size,
                                    area: fishItem.tank!.area,
                                    cultureType: fishItem.tank!.cultureType,
                                    tankId: fishItem.tankId,
                                    testId: fishItem.id,
                                    formType: 'fish',
                                    controller: controller,
                                    planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // children: List.generate(
                            //   controller.getFishTypeCount(controller.testPending.value),
                            //   (index) => TestCard(),
                            // ),
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
                                  '${controller.getShrimpTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getShrimpTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final shrimpItem = controller
                                    .testPending.value?.result.shrimp
                                    .elementAt(index);
                                if (shrimpItem != null) {
                                  return TestCard(
                                    name: shrimpItem.tank!.farmer.name,
                                    size: shrimpItem.tank!.size,
                                    area: shrimpItem.tank!.area,
                                    cultureType: shrimpItem.tank!.cultureType,
                                    tankId: shrimpItem.tankId,
                                    testId: shrimpItem.id,
                                    formType: 'shrimp',
                                    controller: controller,
                                    planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // children: List.generate(
                            //   controller
                            //       .getShrimpTypeCount(controller.testPending.value),
                            //   (index) => TestCard(),
                            // ),
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
                                  '${controller.getSoilTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getSoilTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final soilItem = controller
                                    .testPending.value?.result.soil
                                    .elementAt(index);
                                if (soilItem != null) {
                                  return TestCard(
                                    name: soilItem.tank!.farmer.name,
                                    size: soilItem.tank!.size,
                                    area: soilItem.tank!.area,
                                    cultureType: soilItem.tank!.cultureType,
                                    tankId: soilItem.tankId,
                                    testId: soilItem.id,
                                    formType: 'soil',
                                    controller: controller,
                                    planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // children: List.generate(
                            //   controller.getSoilTypeCount(controller.testPending.value),
                            //   (index) => TestCard(),
                            // ),
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
                                  '${controller.getPCRTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getPCRTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final pcrItem = controller
                                    .testPending.value?.result.pcr
                                    .elementAt(index);
                                if (pcrItem != null) {
                                  return TestCard(
                                    name: pcrItem.tank!.farmer.name,
                                    size: pcrItem.tank!.size,
                                    area: pcrItem.tank!.area,
                                    cultureType: pcrItem.tank!.cultureType,
                                    tankId: pcrItem.tankId,
                                    testId: pcrItem.id,
                                    formType: 'pcr',
                                    controller: controller,
                                    planktonyesorno: 'No',
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                            // children: List.generate(
                            //   controller.getSoilTypeCount(controller.testPending.value),
                            //   (index) => TestCard(),
                            // ),
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
                                  '${controller.getFeedTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getFeedTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final feedItem = controller
                                    .testPending.value?.result.feed
                                    .elementAt(index);
                                if (feedItem != null) {
                                  return TestCard(
                                    name: feedItem.tank!.farmer.name,
                                    size: feedItem.tank!.size,
                                    area: feedItem.tank!.area,
                                    cultureType: feedItem.tank!.cultureType,
                                    tankId: feedItem.tankId,
                                    testId: feedItem.id,
                                    formType: 'feed',
                                    controller: controller,
                                    planktonyesorno: 'No',
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
                                  '${controller.getCultureTypeCount(controller.testPending.value)}',
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                            children: List.generate(
                              controller.getCultureTypeCount(
                                      controller.testPending.value) ??
                                  0,
                              (index) {
                                final cultureItem = controller
                                    .testPending.value?.result.culture
                                    .elementAt(index);
                                if (cultureItem != null) {
                                  return TestCard(
                                    name: cultureItem.tank!.farmer.name,
                                    size: cultureItem.tank!.size,
                                    area: cultureItem.tank!.area,
                                    cultureType: cultureItem.tank!.cultureType,
                                    tankId: cultureItem.tankId,
                                    testId: cultureItem.id,
                                    formType: 'culture',
                                    controller: controller,
                                    planktonyesorno: 'No',
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
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
