import 'package:get/get.dart';

import 'tank_report_controller.dart';

class TankReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TankReportController());
  }
}
