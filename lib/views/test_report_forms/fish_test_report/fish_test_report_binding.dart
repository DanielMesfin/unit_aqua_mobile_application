import 'package:get/get.dart';

import 'fish_test_report_controller.dart';

class FishTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FishTestReportController());
  }
}
