import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/news/news_model.dart';

import '../../themes/theme_text.dart';
import 'news_card.dart';
import 'news_controller.dart';

class NewsDetailView extends GetView<NewsController> {
  final NewsModel news;
  const NewsDetailView({required this.news, super.key});

  List<T> getRandomItems<T>(List<T> list, int numberOfItems) {
    List<T> randomItems = [];
    final random = Random();
    while (randomItems.length < numberOfItems) {
      T randomItem = list[random.nextInt(list.length)];
      if (!randomItems.contains(randomItem)) {
        if (randomItem != news) randomItems.add(randomItem);
      }
    }

    return randomItems;
  }

  @override
  Widget build(BuildContext context) {
    List<NewsModel> randomThree = getRandomItems(controller.newsList, 3);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: WidgetHelpers.pagePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CachedNetworkImage(
                  height: Get.height * 0.35,
                  imageUrl: news.thumbnail.toString(),
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                news.title ?? "",
                style: ThemeText.headlineOne.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Description",
                style: ThemeText.headlineTwo.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 15),
              Text(
                news.description ?? "",
                style: ThemeText.bodyOne,
              ),
              Divider(
                thickness: 2,
                height: 40,
              ),
              Text(
                "Related news",
                style: ThemeText.headlineTwo.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 15),
              WidgetHelpers.pagePadding(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) => NewsCard(
                    news: randomThree[i],
                    isDetail: true,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemCount: randomThree.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
