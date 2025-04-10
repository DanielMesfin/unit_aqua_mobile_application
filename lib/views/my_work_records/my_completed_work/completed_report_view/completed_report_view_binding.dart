import 'package:get/get.dart';

import 'completed_report_view_controller.dart';

class MyCompletedReportViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyCompletedReportViewController());
  }
}
