import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/views/forum_detail/forum_detail_controller.dart';

import '../../services/forum/forum_service_impl.dart';

class AnswerForumController extends GetxController {
  late TextEditingController answerController;
  final ForumServiceImpl _forumServiceImpl = Get.find<ForumServiceImpl>();
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  late int forumId;
  late int forumAnswerId;
  final isLoading = false.obs;
  RxBool isFetched = false.obs;
  bool isReply = false;
  XFile? image;
  @override
  void onInit() {
    answerController = TextEditingController();
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      isReply = args["isReply"];
      if (isReply) {
        forumAnswerId = args["forumAnswerId"];
      } else {
        forumId = args["forumId"];
      }
    }
    super.onInit();
  }

  void answerForum() async {
    isLoading(true);
    try {
      ForumAnswer answer = ForumAnswer(
        content: answerController.text.trim(),
        forumId: forumId,
        imageUrl1: image == null ? null : File(image!.path),
      );
      final response = await _forumServiceImpl.answerForum(forumAnswer: answer);
      inspect(response);
      Get.back();
      final forumDetailController = Get.find<ForumDetailController>();
      forumDetailController.onInit();
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void replyForumAnswer() async {
    isLoading(true);
    try {
      ForumReply reply = ForumReply(
        content: answerController.text.trim(),
        forumAnswerId: forumAnswerId,
      );
      final response = await _forumServiceImpl.replyForum(
          forumReply: reply,
          content: answerController.text.trim(),
          userId: _authServiceImpl.userData!.id!);
      inspect(response);
      Get.back();
      final forumDetailController = Get.find<ForumDetailController>();
      forumDetailController.onInit();
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      isFetched(true);
    }
  }
}
