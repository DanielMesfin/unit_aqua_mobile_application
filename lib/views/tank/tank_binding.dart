import 'package:get/get.dart';

import 'tank_controller.dart';

class TankBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TankController());
  }
}
