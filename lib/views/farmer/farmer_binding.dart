import 'package:get/get.dart';

import 'farmer_controller.dart';

class FarmerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FarmerController());
  }
}
