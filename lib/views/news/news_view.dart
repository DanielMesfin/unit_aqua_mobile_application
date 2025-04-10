import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/views/news/news_card.dart';
import 'package:unity_labs/views/news/news_search_delegate.dart';

import '../../themes/theme_text.dart';
import 'news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: NewsViewDelegate(),
            ),
            icon: const Icon(Iconsax.search_normal_1),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : WidgetHelpers.pagePadding(
                child: ListView.separated(
                  itemBuilder: (ctx, i) => NewsCard(
                    news: controller.newsList[i],
                    isDetail: false,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 30),
                  itemCount: controller.newsList.length,
                ),
              ),
      ),
    );
  }
}
