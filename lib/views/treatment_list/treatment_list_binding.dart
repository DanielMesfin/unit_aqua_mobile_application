import 'package:get/get.dart';

import 'treatment_list_controller.dart';

class TreatmentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TreatmentListController());
  }
}
