import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/news/news_model.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';
import 'package:unity_labs/views/news/news_detail_view.dart';
import 'package:unity_labs/widgets/custom_list_tile.dart';

class NewsCard extends GetView<ForumController> {
  final bool isDetail;
  final NewsModel news;
  const NewsCard({required this.news, required this.isDetail, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDetail) {
          Navigator.of(context).pop();
        }
        Get.to(() => NewsDetailView(
              news: news,
            ));
      },
      child: Container(
        decoration: WidgetHelpers.allRoundedRectangle(
            color: CustomColors.primaryAccentColor),
        child: CustomListTile(
          leadingWidget: CachedNetworkImage(
            width: Get.width * 0.2,
            imageUrl: news.thumbnail.toString(),
            placeholder: (context, url) => Container(
              padding: const EdgeInsets.all(5),
              decoration: WidgetHelpers.allRoundedRectangle(
                  color: CustomColors.primaryColor, borderRadius: 5),
              child: const Icon(
                Iconsax.paperclip,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              padding: const EdgeInsets.all(5),
              decoration: WidgetHelpers.allRoundedRectangle(
                  color: CustomColors.primaryColor, borderRadius: 5),
              child: const Icon(
                Iconsax.paperclip,
                color: Colors.white,
              ),
            ),
          ),
          titleWidget: Text(
            news.title ?? "",
            style: ThemeText.bodyBoldOne,
          ),
          subtitle: Text(
            DateFormat('MMM dd, yyyy HH:mm')
                .format(news.createdAt ?? DateTime.now()),
            style: ThemeText.bodyTwo.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
