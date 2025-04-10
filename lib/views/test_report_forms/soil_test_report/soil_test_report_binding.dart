import 'package:get/get.dart';

import 'soil_test_report_controller.dart';

class SoilTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SoilTestReportController());
  }
}
