import 'package:get/get.dart';
import 'package:unity_labs/views/my_work_records/my_completed_work/completed_list_controller.dart';

class CompletedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CompletedListControllerHistory());
  }
}
