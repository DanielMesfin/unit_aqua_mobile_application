import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';

import 'banner_for_report_controller.dart';

class BannerForReportView extends GetView<BannerForReportController> {
  const BannerForReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: WidgetHelpers.pagePadding(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Upload Banner for Report Generation',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Potrait'),
                    Text('Landscape'),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.labReport.value = 'Potrait';
                      },
                      child: Container(
                        decoration: controller.labReport.value == 'Potrait'
                            ? BoxDecoration(
                                border: Border.all(
                                  width: 6,
                                ),
                              )
                            : null,
                        child: Image.asset(
                          'assets/images/Potrait.png',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.labReport.value = 'Landscape';
                      },
                      child: Container(
                        decoration: controller.labReport.value == 'Landscape'
                            ? BoxDecoration(
                                border: Border.all(
                                  width: 6,
                                ),
                              )
                            : null,
                        child: Image.asset(
                          'assets/images/Landscape.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
