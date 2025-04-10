import '../../model/news/news_list_response.dart';

abstract class NewsServices {
  Future<NewsListResponse> getAllNews();
  Future<NewsListResponse> searchNews({required String search});
}
