import 'package:get/get.dart';

import 'pcr_test_report_controller.dart';

class PCRTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PCRTestReportController());
  }
}
