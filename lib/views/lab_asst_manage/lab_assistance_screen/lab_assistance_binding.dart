import 'package:get/get.dart';

import 'lab_assistance_controller.dart';

class LabAssistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LabAssistanceController());
  }
}
