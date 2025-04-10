import 'package:get/get.dart';

import 'generated_report_controller.dart';

class GeneratedReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GeneratedReportController());
  }
}
