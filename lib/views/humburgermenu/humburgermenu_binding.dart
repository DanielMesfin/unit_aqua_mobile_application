import 'package:get/get.dart';

import 'humburgermenu_controller.dart';

class HamburgerMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HamburgerMenuController());
  }
}
