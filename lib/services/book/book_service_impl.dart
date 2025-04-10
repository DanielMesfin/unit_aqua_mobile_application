import 'package:get/get.dart';
import 'package:unity_labs/model/book/book_list_response.dart';
import 'package:unity_labs/services/book/book_services.dart';

import '../../model/forum/forum_topic_response.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class BookServiceImpl extends BookServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<BookListResponse> getAllBooks() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.book,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BookListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ForumTopicResponse> bookCategories() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.bookTopic,
      headerType: HeaderType.secured,
    );
    final parsedResponse = ForumTopicResponse.fromJson(response.data);
    return parsedResponse;
  }

  Future<BookListResponse> booksByCategories(String id) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.bookByCategory}$id',
      headerType: HeaderType.secured,
    );
    final parsedResponse = BookListResponse.fromJson(response.data);
    return parsedResponse;
  }
}
