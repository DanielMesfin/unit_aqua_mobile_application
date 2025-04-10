import 'package:get/get.dart';

import 'shrimp_test_report_controller.dart';

class ShrimpTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShrimpTestReportController());
  }
}
