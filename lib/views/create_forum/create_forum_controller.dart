import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unity_labs/common/enums/api_enums.dart';
import 'package:unity_labs/helpers/dialog_helpers.dart';
import 'package:unity_labs/model/forum/forum_topic.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';

import '../../model/forum/create_forum.dart';
import '../../services/forum/forum_service_impl.dart';

class CreateForumController extends GetxController {
  late TextEditingController titleController, descriptionController;
  final ForumServiceImpl _forumServiceImpl = Get.find<ForumServiceImpl>();
  List<ForumTopic> topicList = Get.find<ForumController>().topicList;
  late Rx<ForumTopic> forumTopic;
  final isLoading = false.obs;
  late GlobalKey<FormState> formKey;
  RxBool isFetched = false.obs;
  List<XFile> images = [];
  final currentIndex = 0.obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    forumTopic = topicList[0].obs;
    super.onInit();
  }

  void createForum() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);
    try {
      CreateForumModel forum = CreateForumModel(
        topicId: forumTopic.value.id,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        imageUrl1: images.isEmpty ? null : File(images[0].path),
        imageUrl2: images.length <= 1 ? null : File(images[1].path),
        imageUrl3: images.length <= 2 ? null : File(images[2].path),
      );
      final response = await _forumServiceImpl.createForum(forum: forum);
      inspect(response);
      Get.back();
      final knowledgeController = Get.find<ForumController>();
      knowledgeController.getAllForums();
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      if (selectedImages.length > 3) {
        return DialogHelpers().showSnackBarGetx(
          content: "Please select only 3 images",
          responseMessage: ResponseMessage.warning,
        );
      }
      images = selectedImages;
      isFetched(true);
    }
  }
}
