import 'package:get/get.dart';

import 'completed_list_controller.dart';

class CompletedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CompletedListController());
  }
}
