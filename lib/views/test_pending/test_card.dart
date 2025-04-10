import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/themes/theme_button.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../routes/app_pages.dart';
import '../../themes/theme_text.dart';
import 'test_pending_controller.dart';

class TestCard extends StatelessWidget {
  final String name;
  final String size;
  final String area;
  final String cultureType;
  final int tankId;
  final int testId;
  final String formType;
  final String? planktonyesorno;
  final TestPendingController controller;

  const TestCard({
    super.key,
    required this.name,
    required this.size,
    required this.area,
    required this.cultureType,
    required this.tankId,
    required this.testId,
    required this.formType,
    required this.controller,
    required this.planktonyesorno,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name:  $name',
                  style: ThemeText.bodyOne,
                ),
                SizedBox(
              height: 5,
            ),
                Text(
                  'Size:  $size',
                  style: ThemeText.bodyOne,
                ),
                SizedBox(
              height: 5,
            ),
                Text(
                  'Area:  $area',
                  style: ThemeText.bodyOne,
                ),
                SizedBox(
              height: 5,
            ),
                Text(
                  'Culture Type: $cultureType',
                  style: ThemeText.bodyOne,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PrimaryButton(
                      height: 40,
                      width: 80,
                      label: "Work On",
                      onPressed: () {
                        final determinedFormType =
                            RouteMappings.formTypeToRoute[formType];

                        if (determinedFormType != null) {
                          Get.toNamed(determinedFormType, arguments: {
                            'tankId': tankId,
                            'testId': testId,
                            'planktonTest': planktonyesorno,
                            'Name': name,
                            'Size': size,
                            'Area': area,
                            'CultureType': cultureType,
                          });
                        } else {}
                      },
                    ),
                    const SizedBox(width: 60),
                    Obx(
                      () => controller.isLoading.isTrue
                          ? const Center(child: CircularProgressIndicator())
                          : PrimaryButton(
                              height: 40,
                              width: 80,
                              buttonStyle: ThemeButton.redButtonStyle,
                              label: "Delete",
                              onPressed: () {
                                showDeleteConfirmationDialog(
                                    context, testId.toString(), () {
                                  controller.deleteTest(testId.toString());
                                  Get.snackbar(
                                    "Done",
                                    "Deleted Successfully",
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  Get.back();
                                });
                              },
                            ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(
      BuildContext context, String testId, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}

class RouteMappings {
  static final Map<String, String> formTypeToRoute = {
    'water': Routes.watertestreport,
    'fish': Routes.fishtestreport,
    'shrimp': Routes.shrimptestreport,
    'soil': Routes.soiltestreport,
    'pcr': Routes.pcrtestreport,
    'feed': Routes.feedtestreport,
    'culture': Routes.culturetestform,
  };
}
