import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/views/forum/answer_card.dart';
import 'package:unity_labs/views/forum/forum_card.dart';

import '../../themes/theme_text.dart';
import '../../widgets/primary_button.dart';
import 'forum_controller.dart';
import 'forum_search_delegate.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Forum Module",
            style: ThemeText.headlineOne.copyWith(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchViewDelegate(),
              ),
              icon: const Icon(Iconsax.search_normal_1),
            ),
          ],
          //   bottom: TabBar(
          //     controller: controller.tabController,
          //     tabs: controller.myTabs,
          //     labelColor: CustomColors.primaryColor,
          //     indicatorColor: CustomColors.primaryColor,
          //     labelStyle: ThemeText.bodyBoldOne,
          //     unselectedLabelColor: Colors.grey,
          //     isScrollable: true,
          //     onTap: (i) => controller.changeTab(i),
          //   ),
          // ),

          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(kToolbarHeight), // TabBar's height
            child: Obx(
              () => AbsorbPointer(
                absorbing: controller
                    .isLoading.value, // Disable interaction if loading
                child: TabBar(
                  controller: controller.tabController,
                  tabs: controller.myTabs,
                  labelColor: CustomColors.primaryColor,
                  indicatorColor: CustomColors.primaryColor,
                  labelStyle: ThemeText.bodyBoldOne,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  onTap: (i) => controller.changeTab(i),
                ),
              ),
            ),
          ),
        ),
        body: WidgetHelpers.pagePadding(
          child: RefreshIndicator(
            onRefresh: () async => controller.reload(),
            child: Obx(
              () => controller.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : controller.tabController.index == 1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) => PrimaryButton(
                                  hasLoading: true,
                                  isLoading: controller.isLoading,
                                  width: Get.width,
                                  label: controller.topicList[i].name,
                                  onPressed: () {
                                    controller.topic.value =
                                        controller.topicList[i].name.toString();
                                    controller.getAllForumByTopic(
                                        controller.topicList[i].id);
                                    Get.toNamed(Routes.forumByTopic);
                                  },
                                ),
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 30),
                                itemCount: controller.topicList.length,
                              ),
                            ),
                          ],
                        )
                      : controller.tabController.index == 4
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) =>
                                  AnswerCard(answer: controller.answerList[i]),
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 30),
                              itemCount: controller.answerList.length,
                            )
                          : Column(
                              children: [
                                if (controller.tabController.index == 0)
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.02,
                                    ),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DropdownButton<String>(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      isExpanded: true,
                                      value: controller.selectedValue.value,
                                      onChanged: (newValue) {
                                        controller.selectedValue.value =
                                            newValue!;
                                        if (newValue ==
                                            'Sort by Date Ascending') {
                                          controller.forumList.sort(
                                            (a, b) => a.createdAt!
                                                .compareTo(b.createdAt!),
                                          );
                                        } else if (newValue ==
                                            'Sort by Date Descending') {
                                          controller.forumList.sort(
                                            (a, b) => b.createdAt!
                                                .compareTo(a.createdAt!),
                                          );
                                        } else if (newValue ==
                                            'Sort by Likes') {
                                          controller.forumList.sort((a, b) =>
                                              a.isLiked == b.isLiked
                                                  ? 0
                                                  : (a.isLiked != null
                                                      ? -1
                                                      : 1));
                                        } else {
                                          controller.forumList.clear();
                                          controller.forumList.addAll(
                                              controller.defaultForumList);
                                        }
                                      },
                                      items: <String>[
                                        'Default',
                                        'Sort by Date Ascending',
                                        'Sort by Date Descending',
                                        'Sort by Likes'
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (ctx, i) => ForumCard(
                                        forum: controller.forumList[i]),
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 30),
                                    itemCount: controller.forumList.length,
                                  ),
                                ),
                              ],
                            ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.primaryColor,
          child: const Icon(Icons.add),
          onPressed: () => Get.toNamed(Routes.createForum),
        ),
      ),
    );
  }
}
