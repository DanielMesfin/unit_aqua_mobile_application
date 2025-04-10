import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/common/constants/colors.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/powered_by_field.dart';
import 'tank_list_controller.dart';

class TankListView extends GetView<TankListController> {
  const TankListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Report  List',
          style: TextStyle(color: ConstantColors.appBarTextColor),
        ),
        backgroundColor: ConstantColors.appBarBackgroundColor,
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: 100,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 50, right: 20),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Container(
          //       margin: const EdgeInsets.all(10.0),
          //       decoration: BoxDecoration(
          //         color: const Color.fromARGB(255, 221, 216, 216),
          //         borderRadius: BorderRadius.circular(20.0),
          //       ),
          //       child: IconButton(
          //         icon: const Icon(Icons.tune),
          //         onPressed: () {
          //           //   filter functionality
          //         },
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
            child: Obx(() {
              return controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.totalItemCount.value == 0
                      ? Center(
                          child: Text(
                            'No reports available.',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                                child: ListView.builder(
                              itemCount: controller.totalItemCount.value,
                              itemBuilder: (context, index) {
                                int itemIndex = index;

                                for (var list in [
                                  controller
                                      .allTankReports.value!.result!.water,
                                  controller.allTankReports.value!.result!.fish,
                                  controller
                                      .allTankReports.value!.result!.shrimp,
                                  controller.allTankReports.value!.result!.soil,
                                  controller.allTankReports.value!.result!.pcr,
                                  controller.allTankReports.value!.result!.feed,
                                  controller
                                      .allTankReports.value!.result!.culture,
                                ]) {
                                  if (itemIndex < list!.length) {
                                    dynamic item = list[itemIndex];

                                    if (item != null) {
                                      String createdAt = item.createdAt ?? '';
                                      String formattedDate = '';

                                      if (createdAt.isNotEmpty) {
                                        DateTime parsedDate =
                                            DateTime.parse(createdAt);
                                        formattedDate = DateFormat.yMMMMd()
                                            .format(parsedDate);
                                      }

                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              formattedDate,
                                              style: ThemeText.bodyOne.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 100.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[900],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        Routes.tankreport,
                                                        arguments: {
                                                          'tankId': item.tankId,
                                                          'testId': item.testId,
                                                          'id': item.id,
                                                          'formType': item
                                                              .runtimeType
                                                              .toString(),
                                                        });
                                                  },
                                                  child: Text(
                                                    'Report',
                                                    style: ThemeText.bodyOne
                                                        .copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      print(
                                          'Unsupported type: ${item.runtimeType}');
                                      return Container();
                                    }
                                  } else {
                                    itemIndex -= list.length ?? 0;
                                  }
                                }

                                return Container();
                              },
                            )),
                          ],
                        );
            }),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20.0, top: 80, right: 30, bottom: 15),
              child: PoweredByText(),
            ),
          ),
        ],
      ),
    );
  }
}
