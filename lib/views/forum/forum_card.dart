import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/constants.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/forum/forum.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';
import 'package:unity_labs/widgets/custom_list_tile.dart';

class ForumCard extends GetView<ForumController> {
  final ForumModel forum;
  const ForumCard({required this.forum, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => Get.toNamed(Routes.forumDetail, arguments: forum.id),
        child: Container(
          decoration: WidgetHelpers.allRoundedRectangle(
              color: CustomColors.primaryAccentColor),
          child: CustomListTile(
            leadingWidget: forum.imgUrls.isEmpty
                ? null
                : WidgetHelpers.clipRRectWithImage(
                    isAssetImage: forum.imgUrls.isEmpty,
                    borderRadius: 10,
                    imageUrl: forum.imgUrls.isEmpty
                        ? "${Constants.assetImage}/no-image.png"
                        : forum.imgUrls[0],
                    imageWidth: 50,
                    imageHeight: 80,
                  ),
            titleWidget: Text(
              forum.title ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            subtitle: Text(
              forum.description ?? "",
              style: ThemeText.bodyTwo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailingWidget: forum.isBookmarked == null
                ? null
                : IconButton(
                    onPressed: () => forum.isBookmarked!.value
                        ? controller.unbookmark(forum)
                        : controller.bookmark(forum),
                    icon: Icon(
                      Icons.bookmark,
                      color: forum.isBookmarked!.value
                          ? CustomColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
