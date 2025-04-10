import 'package:get/get.dart';

import 'tank_list_controller.dart';

class TankListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TankListController());
  }
}
