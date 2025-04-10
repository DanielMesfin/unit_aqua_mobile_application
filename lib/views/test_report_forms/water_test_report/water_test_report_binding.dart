import 'package:get/get.dart';

import 'water_test_report_controller.dart';

class WaterTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WaterTestReportController());
  }
}
