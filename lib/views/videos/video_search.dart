import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/video/video_list_response.dart';
import '../../helpers/widget_helpers.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_list_tile.dart';
import 'play_video_view.dart';
import 'videos_controller.dart';

class VideoViewDelegate extends SearchDelegate<VideoListResponse> {
  // final _homePageController = Get.find<HomePageController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // }
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final controller = Get.find<VideosController>();
    controller.query.value = query;
    if (controller.query.value != "" && controller.query.value.length > 2) {
      controller.searchVideo();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(
          () => controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.searchedList.isEmpty
                  ? const Center(child: Text('Empty'))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) => InkWell(
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
                              imageUrl: controller.videoList[i].thumbnailUrl
                                  .toString(),
                              imageWidth: 80,
                            ),
                            titleWidget: Text(
                              controller.videoList[i].title.toString(),
                              style: ThemeText.bodyBoldOne,
                            ),
                            trailingWidget: IconButton(
                              onPressed: () => Get.to(() => PlayVideoView(
                                  video: controller.videoList[i])),
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 20),
                        itemCount: controller.searchedList.length,
                      ),
                    ),
          // Center(
          //     child:
          //         Text(controller.allPodcastShows.first.podcastShowTitle),
          //   ),
        ),
      ),
    );
  }
}
