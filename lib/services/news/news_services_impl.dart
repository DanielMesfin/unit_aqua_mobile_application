import 'package:get/get.dart';
import 'package:unity_labs/model/news/news_list_response.dart';

import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'news_services.dart';

class NewsServiceImpl extends NewsServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<NewsListResponse> getAllNews() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.news,
      headerType: HeaderType.secured,
    );
    final parsedResponse = NewsListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<NewsListResponse> searchNews({required String search}) async {
    final response = await _httpService.getRequest(
      urlPath: Apis.searchNews,
      data: {"search": search},
      headerType: HeaderType.secured,
    );
    final parsedResponse = NewsListResponse.fromJson(response.data);
    return parsedResponse;
  }
}
