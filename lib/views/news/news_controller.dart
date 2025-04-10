import 'dart:developer';

import 'package:get/get.dart';

import '../../model/news/news_model.dart';
import '../../services/news/news_services_impl.dart';

class NewsController extends GetxController {
  final NewsServiceImpl _newsServiceImpl = Get.find<NewsServiceImpl>();
  final List<NewsModel> newsList = List<NewsModel>.empty(growable: true).obs;
  final List<NewsModel> searchedList =
      List<NewsModel>.empty(growable: true).obs;
  final isLoading = false.obs;
  final query = "".obs;

  Future<void> getAllNews() async {
    isLoading(true);
    try {
      final response = await _newsServiceImpl.getAllNews();
      newsList.addAll(response.newsList ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchNews() async {
    isLoading(true);
    searchedList.clear();
    try {
      final response = await _newsServiceImpl.searchNews(search: query.value);
      searchedList.addAll(response.newsList ?? []);
      inspect(searchedList);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllNews();
    super.onInit();
  }
}
