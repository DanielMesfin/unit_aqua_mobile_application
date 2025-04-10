import 'package:get/get.dart';

import 'answer_forum_controller.dart';

class AnswerForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnswerForumController());
  }
}
