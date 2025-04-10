import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/report/plankton_report/plankton_controller.dart';
import 'package:unity_labs/themes/theme_button.dart';
import 'package:unity_labs/views/reports/report_list_controller.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../routes/app_pages.dart';
import '../../themes/theme_text.dart';

class ReportListCard extends StatelessWidget {
  final String name;
  final String size;
  final String area;
  final String cultureType;
  final int tankId;
  final int testId;
  final int id;
  final String formType;
  final ReportListController controller;

  const ReportListCard({
    super.key,
    required this.name,
    required this.size,
    required this.area,
    required this.cultureType,
    required this.tankId,
    required this.testId,
    required this.id,
    required this.formType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final PlanktonController planktonController = Get.put(PlanktonController());
    return Material(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name: $name',
              style: ThemeText.bodyOne,
            ),
            Text(
              'Size: $size',
              style: ThemeText.bodyOne,
            ),
            Text(
              'Area: $area',
              style: ThemeText.bodyOne,
            ),
            Text(
              'Culture Type: $cultureType',
              style: ThemeText.bodyOne,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                PrimaryButton(
                  height: 40,
                  width: 80,
                  label: "Preview",
                  onPressed: () {
                    // updating the feachint
                    if (formType == 'water') {
                      planktonController.faching(testId);
                    }

                    Get.toNamed(Routes.reportView, arguments: {
                      'farmer': name,
                      'tankId': tankId,
                      'testId': testId,
                      'id': id,
                      'formType': formType
                    });
                  },
                ),
                const SizedBox(width: 10),
                PrimaryButton(
                  height: 40,
                  width: 80,
                  buttonStyle: ThemeButton.redButtonStyle,
                  label: "Delete",
                  onPressed: () {
                    //  showDeleteConfirmationDialog(
                    //                 context, testId.toString(), () {
                    //               controller.deleteReport(testId.toString());

                    //               Get.snackbar(
                    //                 "Done",
                    //                 "Deleted Successfully",
                    //                 backgroundColor: Colors.green,
                    //                 snackPosition: SnackPosition.BOTTOM,
                    //               );
                    //               Get.back();
                    //             });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
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

class RouteMappings {
  static final Map<String, String> formTypeToRoute = {
    'water': Routes.watertestreport,
    'fish': Routes.fishtestreport,
    'shrimp': Routes.shrimptestreport,
    'soil': Routes.soiltestreport,
    'pcr': Routes.pcrtestreport,
    'feed': Routes.feedtestreport,
  };
}
