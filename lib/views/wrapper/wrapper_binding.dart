import 'package:get/get.dart';
import 'wrapper_controller.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WrapperController());
  }
}
