import 'package:get/get.dart';

import 'login_lab_assist_controller.dart';

class LoginLabAssistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginLabAssistController());
  }
}
