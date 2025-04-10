import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../themes/theme_text.dart';
import 'answer_forum_controller.dart';

class AnswerForumView extends GetView<AnswerForumController> {
  const AnswerForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          controller.isReply == true ? "Reply" : "Answer",
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: controller.answerController,
              labelText: controller.isReply == true ? "Reply" : "Answer",
            ),
            if (controller.isReply == false)
              Obx(
                () => InkWell(
                  onTap: () => controller.pickImage(),
                  child: Container(
                    width: Get.width,
                    height: 200,
                    decoration: WidgetHelpers.allRoundedRectangle(
                      color: Colors.black,
                    ),
                    child: controller.isFetched.isTrue
                        ? Image.file(
                            File(controller.image!.path),
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text(
                              'Add an Image',
                              style: ThemeText.bodyWhiteOne,
                            ),
                          ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: PrimaryButton(
          hasLoading: true,
          isLoading: controller.isLoading,
          label: "Answer",
          onPressed: () => controller.isReply == true
              ? controller.replyForumAnswer()
              : controller.answerForum(),
        ),
      ),
    );
  }
}
