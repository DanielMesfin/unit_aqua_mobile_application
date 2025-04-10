import 'package:get/get.dart';

import 'add_lab_assistance_controller.dart';

class AddLabAssistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddLabAssistanceController());
  }
}
