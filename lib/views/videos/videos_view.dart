import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/videos/play_video_view.dart';
import 'package:unity_labs/widgets/custom_list_tile.dart';

import 'video_search.dart';
import 'videos_controller.dart';

class VideosView extends GetView<VideosController> {
  const VideosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video',
          style: ThemeText.headlineThree,
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: VideoViewDelegate(),
            ),
            icon: const Icon(Iconsax.search_normal_1),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: WidgetHelpers.pagePadding(
                  padding: 10,
                  child: ListView.builder(
                    itemCount: controller.videoList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => InkWell(
                      onTap: () => Get.to(
                        () => PlayVideoView(
                          video: controller.videoList[i],
                        ),
                      ),
                      child: CustomListTile(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        leadingWidget: WidgetHelpers.clipRRectWithImage(
                          borderRadius: 0,
                          imageUrl:
                              controller.videoList[i].thumbnailUrl.toString(),
                          imageWidth: 80,
                        ),
                        titleWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.videoList[i].title.toString(),
                              style: ThemeText.bodyBoldOne,
                            ),
                            Text(
                              DateFormat('MMM dd, yyyy HH:mm').format(
                                  controller.videoList[i].createdAt ??
                                      DateTime.now()),
                              style: ThemeText.bodyTwo
                                  .copyWith(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        trailingWidget: IconButton(
                          onPressed: () => Get.to(() =>
                              PlayVideoView(video: controller.videoList[i])),
                          icon: const Icon(
                            Icons.play_circle,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
