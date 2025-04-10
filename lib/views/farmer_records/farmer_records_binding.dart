import 'package:get/get.dart';

import 'farmer_records_controller.dart';

class FarmerRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FarmerRecordsController());
  }
}
