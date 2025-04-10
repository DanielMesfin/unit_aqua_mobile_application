import 'package:get/get.dart';

import 'my_work_records_controller.dart';

class MyWorkRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyWorkRecordsController());
  }
}
