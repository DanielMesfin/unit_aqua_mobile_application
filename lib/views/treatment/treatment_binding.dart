import 'package:get/get.dart';
import 'package:unity_labs/services/treatment/treatment_service_impl.dart';

import 'treatment_controller.dart';

class TreatmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TreatmentServiceImpl());
    Get.put(TreatmentController());
  }
}
