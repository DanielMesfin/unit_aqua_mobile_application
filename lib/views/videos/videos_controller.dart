import 'dart:developer';

import 'package:get/get.dart';

import '../../model/video/video_model.dart';
import '../../services/video/video_service_impl.dart';

class VideosController extends GetxController {
  final VideoServiceImpl _videoServiceImpl = Get.find<VideoServiceImpl>();
  final List<VideoModel> videoList = List<VideoModel>.empty(growable: true).obs;
  final isLoading = false.obs;
  final query = "".obs;
  final List<VideoModel> searchedList =
      List<VideoModel>.empty(growable: true).obs;

  Future<void> getAllVideos() async {
    isLoading(true);
    try {
      final response = await _videoServiceImpl.getAllVideos();
      videoList.addAll(response.videos ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchVideo() async {
    isLoading(true);
    searchedList.clear();
    try {
      final response =
          await _videoServiceImpl.searchVideos(search: query.value);
      searchedList.addAll(response.videos ?? []);
      inspect(searchedList);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllVideos();
    super.onInit();
  }
}
