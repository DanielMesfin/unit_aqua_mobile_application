import 'package:get/get.dart';

import 'videos_controller.dart';

class VideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideosController());
  }
}
