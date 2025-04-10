import 'package:get/get.dart';

import 'forum_detail_controller.dart';

class ForumDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForumDetailController());
  }
}
