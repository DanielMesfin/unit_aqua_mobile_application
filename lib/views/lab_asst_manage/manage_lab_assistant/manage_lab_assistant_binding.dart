import 'package:get/get.dart';

import 'manage_lab_assistant_controller.dart';

class ManageLabAssistantBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageLabAssistantController());
  }
}
