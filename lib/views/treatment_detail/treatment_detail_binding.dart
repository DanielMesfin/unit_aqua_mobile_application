import 'package:get/get.dart';

import 'treatment_detail_controller.dart';

class TreatmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TreatmentDetailController());
  }
}
