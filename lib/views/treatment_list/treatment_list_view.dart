import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';

import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'treatment_list_controller.dart';

class TreatmentListView extends GetView<TreatmentListController> {
  const TreatmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget treatmentCard(i) {
      return Column(
        children: [
          InkWell(
            onTap: () => Get.toNamed(
              Routes.treatmentDetail,
              arguments: {
                'treatment': controller.treatmenList[i],
                'type': controller.type,
              },
            ),
            child: Container(
              height: Get.height * 0.2,
              padding: EdgeInsets.all(
                Get.height * 0.03,
              ),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          controller.treatmenList[i].problem!.name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('MMM dd, yyyy').format(
                            controller.treatmenList[i].createdAt ??
                                DateTime.now()),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.010,
                  ),
                  Expanded(
                    child: Text(
                      controller.treatmenList[i].name.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.010,
                  ),
                  // on the second line
                ],
              ),
            ),
          ),
          if (controller.type != 'global' && controller.indexValue == 2)
            Container(
              height: Get.height * 0.05,
              padding: EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.eiditTeatement,
                        arguments: {
                          'treatment': controller.treatmenList[i],
                          'id': controller.sectorId,
                          'type': controller.type,
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: Get.width * 0.028,
                        ),
                        Text(
                          "Edit",
                          style: ThemeText.bodyWhiteOne,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Get.width * 0.028,
                      ),
                      Text(
                        controller.treatmenList[i].importCount.toString(),
                        style: ThemeText.bodyWhiteOne,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (controller.type != 'global' && controller.indexValue != 2)
            Container(
              height: Get.height * 0.05,
              padding: EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Get.width * 0.028,
                  ),
                  Text(
                    controller.treatmenList[i].importCount.toString(),
                    style: ThemeText.bodyWhiteOne,
                  ),
                ],
              ),
            ),
          if (controller.type == 'global')
            Container(
              height: Get.height * 0.05,
              padding: EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      'Posted By ${controller.treatmenList[i].name.toString()}',
                      style: TextStyle(color: Colors.white, fontSize: 16,),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Get.width * 0.028,
                  ),
                  Text(
                    controller.treatmenList[i].importCount.toString(),
                    style: ThemeText.bodyWhiteOne,
                  ),
                ],
              ),
            )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : WidgetHelpers.pagePadding(
                  child: Column(
                    children: <Widget>[
                      (controller.type == 'global')
                          ? CustomTextField(
                              controller: controller.searchController,
                              labelText: "Search",
                              onChanged: (val) => controller.searchTreatment(),
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                bottom: Get.height * 0.01,
                              ),
                              child: WidgetHelpers.clipRRectWithMaterial(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  width: Get.width,
                                  decoration: WidgetHelpers.allRoundedRectangle(
                                    color: const Color(0xff1349B2),
                                  ),
                                  child: Text(
                                    'My Treatments',
                                    style: ThemeText.bodyWhiteOne,
                                  ),
                                ),
                              ),
                            ),
                      controller.isSearched.isTrue
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) => treatmentCard(i),
                              // PrimaryButton(
                              //   width: 150,
                              //   label: controller.searchList[i].name ?? "",
                              //   onPressed: () => Get.toNamed(
                              //     Routes.treatmentDetail,
                              //     arguments: controller.treatmenList[i],
                              //   ),
                              // ),
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20),
                              itemCount: controller.searchList.length,
                            )
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) => treatmentCard(i),
                              // PrimaryButton(
                              //   width: 150,
                              //   label: controller.treatmenList[i].name ?? "",
                              //   onPressed: () => Get.toNamed(
                              //     Routes.treatmentDetail,
                              //     arguments: controller.treatmenList[i],
                              //   ),
                              // ),
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20),
                              itemCount: controller.treatmenList.length,
                            )
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: (controller.type == 'global')
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: PrimaryButton(
                width: 150,
                label: "Post my Treatment",
                onPressed: () => Get.toNamed(
                  Routes.createTreatment,
                  arguments: {
                    'id': controller.sectorId,
                    'type': controller.type,
                  },
                ),
              ),
            )
          : null,
    );
  }
}
