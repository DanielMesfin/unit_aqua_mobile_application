import 'package:get/get.dart';

import 'market_controller.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MarketController());
  }
}
