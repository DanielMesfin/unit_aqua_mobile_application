import 'package:get/get.dart';

import 'problem_controller.dart';

class ProblemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProblemController());
  }
}
