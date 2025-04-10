import 'package:get/get.dart';
import 'package:unity_labs/views/edit_treatment/edit_treatment_controller.dart';


class EditTreatmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditTreatmentController());
  }
}
