import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import 'treatment_controller.dart';

class TreatmentView extends GetView<TreatmentController> {
  const TreatmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            toolbarHeight: 10,
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: TabBar(
              controller: controller.tabController,
              indicatorColor: Colors.transparent,
              onTap: (i) => controller.changeTab(i),
              tabs: [
                Tab(
                  child: PrimaryButton(
                    width: 120,
                    isPrimaryButton: controller.currentIndex.value == 0,
                    label: "Global Treatments",
                    onPressed: () {
                      controller.isMyTreatment(false);
                      controller.changeTab(0);
                    },
                  ),
                ),
                Tab(
                  child: PrimaryButton(
                    isPrimaryButton: controller.currentIndex.value == 1,
                    label: "My Treatments",
                    onPressed: () => controller.changeTab(1),
                  ),
                ),
                Tab(
                  child: PrimaryButton(
                    width: 120,
                    isPrimaryButton: controller.currentIndex.value == 2,
                    label: "My Post",
                    onPressed: () {
                      controller.isMyTreatment(false);
                      controller.changeTab(2);
                    },
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: controller.currentIndex.value == 0
                  ? controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemBuilder: (ctx, i) => PrimaryButton(
                            width: 150,
                            label: controller.sectorList[i].name ?? "",
                            onPressed: () => Get.toNamed(
                              Routes.treatmentList,
                              arguments: {
                                'id': controller.sectorList[i].id,
                                'type': 'global',
                                'index': controller.currentIndex.value
                              },
                            ),
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                          itemCount: controller.sectorList.length,
                        )
                  : controller.isMyTreatmentLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : controller.isMyTreatment.isTrue
                          ? Column(
                              children: [
                                WidgetHelpers.clipRRectWithMaterial(
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    width: Get.width,
                                    decoration:
                                        WidgetHelpers.allRoundedRectangle(
                                      color: const Color(0xff1349B2),
                                    ),
                                    child: Text(
                                      'My Treatments',
                                      style: ThemeText.bodyWhiteOne,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, i) => InkWell(
                                    onTap: () => Get.toNamed(
                                      Routes.treatmentDetail,
                                      arguments:
                                          controller.selectedTreatmentList[i],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child:
                                          WidgetHelpers.clipRRectWithMaterial(
                                        borderRadius: 3,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                controller
                                                        .selectedTreatmentList[
                                                            i]
                                                        .name ??
                                                    "",
                                                style: ThemeText.headlineThree,
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                controller
                                                        .selectedTreatmentList[
                                                            i]
                                                        .description ??
                                                    "",
                                                style: ThemeText.bodyOne,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 20),
                                  itemCount:
                                      controller.selectedTreatmentList.length,
                                ),
                              ],
                            )
                          : ListView.separated(
                              itemBuilder: (ctx, i) => PrimaryButton(
                                width: 150,
                                label: controller.sectorList[i].name ?? "",
                                onPressed: () => Get.toNamed(
                                  Routes.treatmentList,
                                  arguments: {
                                    'id': controller.sectorList[i].id,
                                    'type': 'my',
                                    'index': controller.currentIndex.value
                                  },
                                ),
                                // onPressed: () {
                                //   controller.isMyTreatment.value = true;
                                //   controller.selectedTreatmentList.clear();
                                //   controller.selectedTreatmentList.addAll(
                                //     controller.treatmentList
                                //         .where((element) =>
                                //             element.problem!.sectorId ==
                                //             controller.sectorList[i].id)
                                //         .toList(),
                                //   );
                                // },
                              ),
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20),
                              itemCount: controller.sectorList.length,
                            )),
        ),
      ),
    );
  }
}
