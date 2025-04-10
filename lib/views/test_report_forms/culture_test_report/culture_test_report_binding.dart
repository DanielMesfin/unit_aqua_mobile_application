import 'package:get/get.dart';

import 'culture_test_report_controller.dart';

class CultureTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CultureTestReportController());
  }
}
