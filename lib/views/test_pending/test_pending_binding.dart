import 'package:get/get.dart';

import 'test_pending_controller.dart';

class TestPendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TestPendingController());
  }
}
