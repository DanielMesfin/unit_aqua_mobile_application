import '../../model/video/video_list_response.dart';

abstract class VideoServices {
  Future<VideoListResponse> getAllVideos();
  Future<VideoListResponse> searchVideos({required String search});
}
