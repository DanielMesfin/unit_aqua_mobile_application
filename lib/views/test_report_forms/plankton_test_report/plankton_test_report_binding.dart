import 'package:get/get.dart';

import 'plankton_test_report_controller.dart';

class PlanktonTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlanktonTestReportController());
  }
}
