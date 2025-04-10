import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../routes/app_pages.dart';
import '../../themes/theme_text.dart';
import 'completed_list_controller.dart';

class CompletedCard extends StatelessWidget {
  final String? name;
  final String? size;
  final String? area;
  final String? cultureType;
  final int? tankId;
  final int? testId;
  final int? id;
  final String formType;
  //final String? planktonyesorno;
  final CompletedListController controller;

  const CompletedCard({
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
    //required this.planktonyesorno,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        width: Get.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
              ],
            ),
            const Spacer(),
            
            PrimaryButton(
              height: 40,
              width: 100,
              label: "View Report",
              onPressed: () {
                Get.toNamed(Routes.completedReportView, arguments: {
                  'tankId': tankId,
                  'testId': testId,
                  'id': id,
                  'formType': formType
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
