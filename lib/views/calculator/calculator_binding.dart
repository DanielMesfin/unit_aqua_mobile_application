import 'package:get/get.dart';

import 'calculator_controller.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController());
  }
}
