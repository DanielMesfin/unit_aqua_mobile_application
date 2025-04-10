import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';

import '../../routes/app_pages.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'problem_controller.dart';

class ProblemView extends GetView<ProblemController> {
  const ProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : WidgetHelpers.pagePadding(
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      controller: controller.searchController,
                      labelText: "Search",
                      onChanged: (val) => controller.searchProblem(),
                    ),
                    controller.isSearched.isTrue
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => PrimaryButton(
                              width: 150,
                              label: controller.searchList[i].name ?? "",
                              onPressed: () => Get.toNamed(
                                Routes.treatmentList,
                                arguments: controller.searchList[i].id,
                              ),
                            ),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 20),
                            itemCount: controller.searchList.length,
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => PrimaryButton(
                              width: 150,
                              label: controller.problemList[i].name ?? "",
                              onPressed: () => Get.toNamed(
                                Routes.treatmentList,
                                arguments: controller.problemList[i].id,
                              ),
                            ),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 20),
                            itemCount: controller.problemList.length,
                          )
                  ],
                ),
              ),
      ),
    );
  }
}
