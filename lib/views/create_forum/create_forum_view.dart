import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../model/forum/forum_topic.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_carousel_slider.dart';
import '../../widgets/custom_carousel_slider_indicator.dart';
import 'create_forum_controller.dart';

class CreateForumView extends GetView<CreateForumController> {
  const CreateForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Ask Module",
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => WidgetHelpers.pagePadding(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => controller.pickImage(),
                    child: Container(
                      width: Get.width,
                      height: controller.isFetched.isTrue ? 240 : 200,
                      decoration: WidgetHelpers.allRoundedRectangle(
                        color: controller.isFetched.isTrue
                            ? Colors.transparent
                            : Colors.black,
                      ),
                      child: controller.isFetched.isTrue
                          ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  CustomCarouselSlider(
                                    height: 200,
                                    // height: Get.height * .'3,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) =>
                                        controller.currentIndex.value = index,
                                    itemCount: controller.images.length,
                                    itemBuilder: (ctx, i, realIndex) =>
                                        WidgetHelpers.clipRRect(
                                      child: Image.file(
                                        File(controller.images[i].path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: CustomCarouselSliderIndicator(
                                      currentIndex: controller.currentIndex,
                                      itemCount: controller.images.length,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text(
                                'Add Images ( Upto 3 )',
                                style: ThemeText.bodyWhiteOne,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: WidgetHelpers.allRoundedRectangle(
                        color: CustomColors.greyScale5,
                      ),
                      width: Get.width * .6,
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ForumTopic>(
                            value: controller.forumTopic.value,
                            items: controller.topicList
                                .map(
                                  (topic) => DropdownMenuItem<ForumTopic>(
                                    value: topic,
                                    child: Text(topic.name ?? ""),
                                  ),
                                )
                                .toList(),
                            onChanged: (topic) =>
                                controller.forumTopic.value = topic!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Question Title',
                    style: ThemeText.headlineFour,
                  ),
                  CustomTextField(
                    controller: controller.titleController,
                    labelText: "Add Question Title",
                    validator: (value) => value
                        .toString()
                        .validateField(fieldName: "Question Title"),
                  ),
                  Text(
                    'Question Description',
                    style: ThemeText.headlineFour,
                  ),
                  CustomTextField(
                    height: 70,
                    controller: controller.descriptionController,
                    labelText: "Add Question Description",
                    keyboardType: TextInputType.multiline,
                    validator: (value) => value
                        .toString()
                        .validateField(fieldName: "Question Description"),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: PrimaryButton(
                      hasLoading: true,
                      isLoading: controller.isLoading,
                      width: Get.width * .7,
                      label: "Ask",
                      onPressed: () => controller.createForum(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
