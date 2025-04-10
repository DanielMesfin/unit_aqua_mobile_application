import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/utils.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/widgets/custom_carousel_slider.dart';
import 'package:unity_labs/widgets/custom_carousel_slider_indicator.dart';
import 'package:unity_labs/widgets/custom_circle_avatar.dart';
import 'package:unity_labs/widgets/custom_list_tile.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';

import '../../common/constants/constants.dart';
import '../../helpers/widget_helpers.dart';
import '../../themes/theme_text.dart';
import 'forum_detail_controller.dart';

class ForumDetailView extends GetView<ForumDetailController> {
  const ForumDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue
          ? const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  controller.forum.title ?? "",
                  style: ThemeText.headlineOne.copyWith(color: Colors.black),
                ),
                actions: controller.isSelf
                    ? [
                        // IconButton(
                        //   onPressed: () => controller.onDeletePressed(),
                        //   icon: const Icon(
                        //     Iconsax.trash,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]
                    : null,
              ),
              body: SingleChildScrollView(
                child: WidgetHelpers.pagePadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      controller.forum.imgUrls.isEmpty
                          ? Container(
                              height: Get.height * .3,
                              width: Get.width,
                              decoration: WidgetHelpers.allRoundedRectangle(
                                color: CustomColors.greyScale5,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "${Constants.assetImage}/no-image.png",
                                      width: 50,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "No images",
                                      style: ThemeText.bodyBoldOne
                                          .copyWith(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : CustomCarouselSlider(
                              height: Get.height * .3,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  controller.currentIndex.value = index,
                              itemCount: controller.forum.imgUrls.length,
                              itemBuilder: (ctx, i, realIndex) =>
                                  WidgetHelpers.clipRRectWithImage(
                                imageUrl: controller.forum.imgUrls[i],
                                imageWidth: Get.width,
                                imageHeight: Get.height * .3,
                              ),
                            ),
                      const SizedBox(height: 20),
                      Center(
                        child: CustomCarouselSliderIndicator(
                          currentIndex: controller.currentIndex,
                          itemCount: controller.forum.imgUrls.length,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            // controller.forum.user!.name ?? "",
                            "",
                            style: ThemeText.bodyBoldOne,
                          ),
                          Text(
                            Utils.formatDateToString(
                              controller.forum.createdAt ?? DateTime.now(),
                            ),
                            style: ThemeText.bodyThree,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.forum.title ?? "",
                        style:
                            ThemeText.headlineOne.copyWith(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Description",
                            style: ThemeText.bodyBoldOne
                                .copyWith(color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () => controller.forum.isLiked!.value
                                ? controller.unlike()
                                : controller.like(),
                            icon: Icon(
                              controller.forum.isLiked!.value
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: CustomColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        controller.forum.description ?? "",
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        "Answers",
                        style:
                            ThemeText.bodyBoldOne.copyWith(color: Colors.grey),
                      ),
                      // const SizedBox(height: 20),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          ForumAnswer answer = controller
                              .forum.forumAnswers!.reversed
                              .toList()[i];
                          return forumDetailCard(answer: answer);
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 15),
                        itemCount: controller.forum.forumAnswers!.length,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    labelText: "Answer",
                    onTap: () => Get.toNamed(
                      Routes.answerForum,
                      arguments: {
                        "forumId": controller.forumId,
                        "isReply": false,
                      },
                    ),
                    readOnly: true,
                    suffix: const Icon(
                      Icons.arrow_forward,
                      color: CustomColors.primaryColor,
                    ),
                  )),
            ),
    );
  }

  Widget forumDetailCard({required ForumAnswer answer}) {
    return Column(
      children: [
        CustomListTile(
          leadingWidget: CustomCircleAvatar(
            initials: answer.user!.name!.substring(0, 2).toUpperCase(),
          ),
          titleWidget: Text(
            answer.user!.name ?? "",
            style: ThemeText.bodyBoldOne,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                answer.content ?? "",
                style: ThemeText.bodyTwo,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          trailingWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Utils.formatDateToString(
                  answer.createdAt ?? DateTime.now(),
                ),
                style: ThemeText.bodyThree,
              ),
              InkWell(
                onTap: () => Get.toNamed(
                  Routes.answerForum,
                  arguments: {
                    "forumAnswerId": answer.id,
                    "isReply": true,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.reply,
                        color: CustomColors.primaryColor,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Reply',
                        style: ThemeText.bodyBoldTwo.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (answer.imageUrl != null)
          WidgetHelpers.clipRRectWithImage(
            imageWidth: Get.width,
            imageHeight: 200,
            imageUrl: answer.imageUrl!,
            borderRadius: 0,
          ),
        if (answer.replies!.isNotEmpty)
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              ForumReply reply = answer.replies![index];
              return CustomListTile(
                padding: const EdgeInsets.only(left: 30),
                minLeadingWidth: 5,
                leadingWidget: CustomCircleAvatar(
                  radius: 15,
                  fontSize: 12,
                  bgColor: CustomColors.successColor,
                  initials: reply.user!.name!.substring(0, 2).toUpperCase(),
                ),
                titleWidget: Text(
                  reply.user!.name ?? "",
                  style: ThemeText.bodyBoldTwo,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                trailingWidget: Obx(
                  () => IconButton(
                    onPressed: () => reply.isLiked!.value
                        ? controller.unlikeReply(reply)
                        : controller.likeReply(reply),
                    icon: Icon(
                      reply.isLiked!.value
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: CustomColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
                subtitle: Text(
                  answer.replies![index].content ?? "",
                  style: ThemeText.bodyThree.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
            itemCount: answer.replies!.length,
          ),
      ],
    );
  }
}
