import 'package:get/get.dart';

import 'farmer_registration_controller.dart';

class FarmerRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FarmerRegistrationController());
  }
}
