import 'package:get/get.dart';

import 'create_treatment_farmer_controller.dart';

class CreateTreatmentFramerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTreatmentFramerController());
  }
}
