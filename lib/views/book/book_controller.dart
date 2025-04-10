import 'dart:developer';

import 'package:get/get.dart';
import 'package:unity_labs/model/book/book_model.dart';
import 'package:unity_labs/services/book/book_service_impl.dart';

import '../../model/forum/forum_topic.dart';

class BookController extends GetxController {
  final BookServiceImpl _bookServiceImpl = Get.find<BookServiceImpl>();
  final List<BookModel> bookList = List<BookModel>.empty(growable: true).obs;
  final List<ForumTopic> categoryList =
      List<ForumTopic>.empty(growable: true).obs;
  Rx<ForumTopic>? selectedCategory;
  final isLoading = false.obs;

  Future<void> getAllBooks() async {
    isLoading(true);
    try {
      final response = await _bookServiceImpl.getAllBooks();
      bookList.addAll(response.books ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> bookCategory() async {
    isLoading(true);
    try {
      final response = await _bookServiceImpl.bookCategories();
      categoryList.add(ForumTopic(id: -1, name: 'All'));
      categoryList.addAll(response.topics ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> booksByCategory(String id) async {
    isLoading(true);
    try {
      bookList.clear();
      final response = await (id == '-1'
          ? _bookServiceImpl.getAllBooks()
          : _bookServiceImpl.booksByCategories(id));
      bookList.addAll(response.books ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    bookCategory();
    getAllBooks();

    super.onInit();
  }
}
