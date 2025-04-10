import 'package:get/get.dart';

import 'report_list_controller.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportListController());
  }
}
