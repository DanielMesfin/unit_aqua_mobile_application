import 'package:get/get.dart';

import 'login_requests_controller.dart';

class LoginRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginRequestsController());
  }
}
