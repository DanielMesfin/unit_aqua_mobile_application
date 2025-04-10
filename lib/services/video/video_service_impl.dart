import 'package:get/get.dart';
import 'package:unity_labs/model/video/video_list_response.dart';
import 'package:unity_labs/services/video/video_services.dart';

import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class VideoServiceImpl extends VideoServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<VideoListResponse> getAllVideos() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.video,
      headerType: HeaderType.secured,
    );
    final parsedResponse = VideoListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<VideoListResponse> searchVideos({required String search}) async {
    final response = await _httpService.getRequest(
      urlPath: Apis.searchVideos,
      data: {"name": search},
      headerType: HeaderType.secured,
    );
    final parsedResponse = VideoListResponse.fromJson(response.data);
    return parsedResponse;
  }
}
