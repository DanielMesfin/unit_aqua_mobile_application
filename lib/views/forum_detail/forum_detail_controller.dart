import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/forum/forum.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';

import '../../services/forum/forum_service_impl.dart';
import '../../themes/theme_text.dart';

class ForumDetailController extends GetxController {
  late ForumModel forum;
  late int forumId;
  final ForumServiceImpl _forumServiceImpl = Get.find<ForumServiceImpl>();
  final isLoading = false.obs;
  final RxInt currentIndex = 0.obs;
  bool isSelf = false;
  @override
  void onInit() async {
    if (Get.arguments != null) {
      forumId = Get.arguments;
    }
    await getForumInfo();
    super.onInit();
  }

  Future<void> getForumInfo() async {
    isLoading(true);
    try {
      final response = await _forumServiceImpl.getForumInfo(forumId: forumId);
      forum = response.forum!;
      isSelf = await forum.isSelf;
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> onDeletePressed() async {
    await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure you want to delete the forum?',
          style: ThemeText.bodyBoldOne,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: ThemeText.bodyBoldOne.copyWith(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await deleteForum();
            },
            child: Text(
              'Yes',
              style: ThemeText.bodyBoldOne.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteForum() async {
    isLoading(true);
    try {
      final response = await _forumServiceImpl.deleteForum(forumId: forumId);
      if (!response.isFailure) {
        Get.back();
        final forumController = Get.find<ForumController>();
        forumController.getAllForums();
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void like() async {
    // isLoading(true);
    try {
      forum.isLiked!.value = true;
      final response = await _forumServiceImpl.likeForum(forumId: forum.id!);
      if (response.isFailure) return;
    } catch (e) {
      inspect(e);
    } finally {
      // isLoading(false);
    }
  }

  void unlike() async {
    // isLoading(true);
    try {
      forum.isLiked!.value = false;
      final response = await _forumServiceImpl.unlikeForum(forumId: forum.id!);
      if (response.isFailure) return;
    } catch (e) {
      inspect(e);
    } finally {
      // isLoading(false);
    }
  }

  void likeReply(ForumReply reply) async {
    try {
      reply.isLiked!.value = true;
      final response =
          await _forumServiceImpl.likeForumReply(forumReplyId: reply.id!);
      if (response.isFailure) return;
    } catch (e) {
      inspect(e);
    } finally {}
  }

  void unlikeReply(ForumReply reply) async {
    try {
      reply.isLiked!.value = false;
      final response =
          await _forumServiceImpl.unlikeForumReply(forumReplyId: reply.id!);
      if (response.isFailure) return;
    } catch (e) {
      inspect(e);
    } finally {}
  }
}
