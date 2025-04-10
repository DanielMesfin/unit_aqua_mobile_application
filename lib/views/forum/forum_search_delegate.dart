import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/forum/forum_list_response.dart';
import 'package:unity_labs/views/forum/forum_card.dart';
import 'package:unity_labs/views/forum/forum_controller.dart';

class SearchViewDelegate extends SearchDelegate<ForumListResponse> {
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
    final controller = Get.find<ForumController>();
    controller.query.value = query;
    if (controller.query.value != "" && controller.query.value.length > 1) {
      controller.searchForum();
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
                  ? const Center(
                      child: Text(
                        'Empty',
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ForumCard(
                          forum: controller.searchedList[index],
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
