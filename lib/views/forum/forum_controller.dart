import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/forum/forum.dart';
import 'package:unity_labs/model/forum/forum_topic.dart';
import 'package:unity_labs/services/forum/forum_service_impl.dart';

import '../../model/forum/forum_answer.dart';

class ForumController extends GetxController with GetTickerProviderStateMixin {
  final ForumServiceImpl _forumServiceImpl = Get.find<ForumServiceImpl>();
  final List<ForumModel> forumList = List<ForumModel>.empty(growable: true).obs;
  final List<ForumAnswer> answerList =
      List<ForumAnswer>.empty(growable: true).obs;
  final List<ForumModel> defaultForumList =
      List<ForumModel>.empty(growable: true).obs;
  final List<ForumModel> searchedList =
      List<ForumModel>.empty(growable: true).obs;
  final List<ForumTopic> topicList = List<ForumTopic>.empty(growable: true).obs;
  late TabController tabController;
  late Rx<ForumTopic> forumTopic;
  RxString topic = "".obs;

  final query = "".obs;
  RxString selectedValue = "Default".obs;
  RxString? selectedTopic;
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Topic Wise'),
    Tab(text: 'Bookmarked'),
    Tab(text: 'My Questions'),
    Tab(text: 'My Answers'),
  ];
  final isLoading = false.obs;

  @override
  void onInit() async {
    tabController = TabController(length: myTabs.length, vsync: this);
    await getAllTopics();

    await getAllForums();
    super.onInit();
  }

  void reload() async {
    tabController.animateTo(0);
    changeTab(0);
  }

  Future<void> getAllForums() async {
    isLoading(true);
    try {
      forumList.clear();
      defaultForumList.clear();
      final response = await _forumServiceImpl.getAllForums();
      forumList.addAll(response.forums ?? []);
      defaultForumList.addAll(response.forums ?? []);
      forumTopic = topicList[0].obs;
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchForum() async {
    isLoading(true);

    try {
      final response = await _forumServiceImpl.searchForum(search: query.value);
      searchedList.clear();
      searchedList.addAll(response.forums ?? []);
      inspect(searchedList);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllTopics() async {
    isLoading(true);
    try {
      topicList.clear();
      final response = await _forumServiceImpl.getAllForumTopics();
      topicList.addAll(response.topics ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void getAllForumByTopic(int value) async {
    isLoading(true);
    try {
      forumList.clear();
      defaultForumList.clear();
      final response = await _forumServiceImpl.getAllByTopic(
        topicId: value,
      );
      forumList.addAll(response.forums ?? []);
      defaultForumList.addAll(response.forums ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void getMyQuestions() async {
    isLoading(true);
    try {
      forumList.clear();
      defaultForumList.clear();
      final response = await _forumServiceImpl.getAllMyQuestions();
      forumList.addAll(response.forums ?? []);
      defaultForumList.addAll(response.forums ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void getMyAnswers() async {
    isLoading(true);
    // try {
    forumList.clear();
    defaultForumList.clear();
    answerList.clear();
    final response = await _forumServiceImpl.getAllMyAnswers();
    answerList.addAll(response.answers ?? []);
    // } catch (e) {
    //   inspect(e);
    // } finally {
    isLoading(false);
    // }
  }

  void getMyBookmarks() async {
    isLoading(true);
    try {
      forumList.clear();
      defaultForumList.clear();
      final response = await _forumServiceImpl.getAllBookmarks();
      forumList.addAll(response.forums ?? []);
      defaultForumList.addAll(response.forums ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void bookmark(ForumModel forumModel) async {
    // isLoading(true);
    try {
      forumModel.isBookmarked!.value = true;
      final response =
          await _forumServiceImpl.bookmarkForum(forumId: forumModel.id!);
      if (response.isFailure) return;
      // getAllForums();
    } catch (e) {
      inspect(e);
    } finally {
      // isLoading(false);
    }
  }

  void unbookmark(ForumModel forumModel) async {
    // isLoading(true);
    try {
      forumModel.isBookmarked!.value = false;
      final response =
          await _forumServiceImpl.unbookmarkForum(forumId: forumModel.id!);
      if (response.isFailure) return;
      // getAllForums();
    } catch (e) {
      inspect(e);
    } finally {
      // isLoading(false);
    }
  }

  changeTab(int i) {
    switch (i) {
      case 0:
        return getAllForums();
      // break;
      case 1:
        return getAllForums();
      case 2:
        return getMyBookmarks();
      case 3:
        return getMyQuestions();
      case 4:
        {
          return getMyAnswers();
        }
      //   return getAllForumByTopic();
      default:
    }
  }
}
