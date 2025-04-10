import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/theme_text.dart';
import 'farmer_records_controller.dart';

class FarmerCard extends GetView<FarmerRecordsController> {
  final String farmerName;
  final String area;
  final String? farmerPhone;

  const FarmerCard(
      {super.key, required this.farmerName,
      required this.area,
      required this.farmerPhone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(farmerName, style: ThemeText.bodyOne),
        subtitle: Text(area),
        onTap: () {
          // Get.toNamed(
          //   Routes.farmerdatacontent,
          //   arguments: {"farmerPhone": farmerPhone},
          // );
          controller.getTank(farmerPhone!);
        },
      ),
    );
  }
}
