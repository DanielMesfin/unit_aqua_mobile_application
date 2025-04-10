import 'package:get/get.dart';

import 'feed_test_report_controller.dart';

class FeedTestReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FeedTestReportController());
  }
}
