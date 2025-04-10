import 'package:get/get.dart';

import 'create_treatment_controller.dart';

class CreateTreatmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTreatmentController());
  }
}
