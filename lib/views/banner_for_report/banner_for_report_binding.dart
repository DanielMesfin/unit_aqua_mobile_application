import 'package:get/get.dart';

import 'banner_for_report_controller.dart';

class BannerForReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BannerForReportController());
  }
}
