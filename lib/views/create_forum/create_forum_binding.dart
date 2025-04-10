import 'package:get/get.dart';

import 'create_forum_controller.dart';

class CreateForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateForumController());
  }
}
