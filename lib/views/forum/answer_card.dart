import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';
import 'package:unity_labs/widgets/custom_list_tile.dart';

import '../../model/forum/forum_answer.dart';

class AnswerCard extends GetView<ForumController> {
  final ForumAnswer answer;
  const AnswerCard({required this.answer, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.forumDetail, arguments: answer.forumId),
      child: Container(
        decoration: WidgetHelpers.allRoundedRectangle(
            color: CustomColors.primaryAccentColor),
        child: CustomListTile(
          leadingWidget:
              answer.imageUrl1 == null && answer.forum?.imageUrl1 == null
                  ? null
                  : WidgetHelpers.clipRRectWithImage(
                      isAssetImage: false,
                      borderRadius: 10,
                      imageUrl: ((answer.imageUrl != null)
                              ? answer.imageUrl
                              : answer.forum?.imageUrl1)
                          .toString(),
                      imageWidth: 50,
                      imageHeight: 80,
                    ),
          titleWidget: Text(
            answer.forum?.title ?? "",
            style: ThemeText.bodyBoldOne,
          ),
          subtitle: Text(
            answer.content ?? "",
            style: ThemeText.bodyTwo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
