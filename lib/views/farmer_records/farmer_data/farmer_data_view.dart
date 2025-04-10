import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/powered_by_field.dart';
import 'farmer_data_controller.dart';

class FarmerDataView extends GetView<FarmerDataController> {
  const FarmerDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "",
          style: ThemeText.headlineTwo.copyWith(color: Colors.black),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Name: ${controller.farmername}',
                style: ThemeText.headlineThree,
              ),
              const SizedBox(height: 16),
              Text(
                'Area: ${controller.farmerarea}',
                style: ThemeText.headlineThree,
              ),
              const SizedBox(height: 16),
              Text(
                'Culture: ${controller.farmerculture}',
                style: ThemeText.headlineThree,
              ),
              const SizedBox(height: 16),
              Text(
                'Mobile: ${controller.farmermobile}',
                style: ThemeText.headlineThree,
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Obx(() {
                    return controller.tanks.isEmpty
                        ? const Center(
                            child: Text('No tanks added'),
                          )
                        : Column(
                            children: <Widget>[
                              for (int i = 0;
                                  i <
                                      (controller.showAllTanks.value
                                          ? controller.tanks.length
                                          : min(3, controller.tanks.length));
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, bottom: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.tanklist,
                                        arguments: {
                                          'id': controller.tanks[i].id
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          controller.tanks[i].name!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (controller.tanks.length > 3)
                                GestureDetector(
                                  onTap: () {
                                    controller.showAllTanks.value =
                                        !controller.showAllTanks.value;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        controller.showAllTanks.value
                                            ? 'Show Less Tanks'
                                            : 'Show More Tanks',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Icon(
                                        controller.showAllTanks.value
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                  }),
                ],
              ),
              //const Spacer(),
              // const SizedBox(
              //   height: 50,
              // ),
              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(right: 20, bottom: 20),
              //       child: InkWell(
              //         onTap: () {
              //           Get.back();
              //         },
              //         child: Container(
              //           width: double.infinity,
              //           height: 60,
              //           decoration: const BoxDecoration(
              //             color: Colors.blue,
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(10.0),
              //             ),
              //           ),
              //           child: const Center(
              //             child: Text(
              //               "Close",
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 //fontWeight: FontWeight.bold,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 20, bottom: 20),
              //       child: InkWell(
              //         onTap: () {
              //           controller.showDeleteConfirmationDialog(context, () {
              //             //controller.deleteTest(testId.toString());
              //             Get.snackbar(
              //               "Done",
              //               "Deleted Successfully",
              //               backgroundColor: Colors.green,
              //               snackPosition: SnackPosition.BOTTOM,
              //             );
              //             //Get.back();
              //           });
              //         },
              //         child: Container(
              //           width: double.infinity,
              //           height: 60,
              //           decoration: const BoxDecoration(
              //             color: Colors.red,
              //             borderRadius: BorderRadius.all(
              //               Radius.circular(10.0),
              //             ),
              //           ),
              //           child: const Center(
              //             child: Text(
              //               "Delete",
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 //fontWeight: FontWeight.bold,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 20,
              //     ),
              //     const PoweredByText(),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //   ],
              // ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, top: 80, right: 30, bottom: 10),
                  child: PoweredByText(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
