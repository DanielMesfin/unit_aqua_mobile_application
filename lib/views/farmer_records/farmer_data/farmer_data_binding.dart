import 'package:get/get.dart';

import 'farmer_data_controller.dart';

class FarmerDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FarmerDataController());
  }
}
