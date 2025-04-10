import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/theme_text.dart';
import 'forum_card.dart';
import 'forum_controller.dart';

class ForumByTopic extends GetView<ForumController> {
  const ForumByTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "${controller.topic} Forum",
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                  top: Get.height * 0.03,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) =>
                      ForumCard(forum: controller.forumList[i]),
                  separatorBuilder: (_, __) => const SizedBox(height: 30),
                  itemCount: controller.forumList.length,
                ),
              ),
      ),
    );
  }
}
