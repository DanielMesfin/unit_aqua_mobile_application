import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/services/book/book_service_impl.dart';
import 'package:unity_labs/services/famer/farmer_service_impl.dart';
import 'package:unity_labs/services/forum/forum_service_impl.dart';
import 'package:unity_labs/services/market/market_service_impl.dart';

import 'http/http_service.dart';
import 'http/http_service_impl.dart';
import 'news/news_services_impl.dart';
import 'secure_storage/secure_storage_service_impl.dart';
import 'video/video_service_impl.dart';

class MainServices extends GetxService {
  late HttpService _httpServiceImpl;

  @override
  void onInit() async {
    initializeHttpService();
    initializeAuthService();
    initializeForumService();
    initializeBookService();
    initializeNewsService();
    initializeMarketService();
    initializeVideoService();
    initializeFarmerService();
    // initializeUserService();
    super.onInit();
  }

  initializeHttpService() {
    Get.put(SecureStorageServiceImpl(), permanent: true).init();
    Get.put(HttpServiceImpl(), permanent: true);
    _httpServiceImpl = Get.find<HttpServiceImpl>();
    _httpServiceImpl.init();
  }

  initializeForumService() async {
    Get.put(ForumServiceImpl());
  }

  initializeBookService() async {
    Get.put(BookServiceImpl());
  }

  initializeFarmerService() async {
    Get.put(FarmerServiceImpl());
  }

  initializeVideoService() async {
    Get.put(VideoServiceImpl());
  }

  initializeNewsService() async {
    Get.put(NewsServiceImpl());
  }

  initializeMarketService() async {
    Get.put(MarketServiceImpl());
  }

  initializeAuthService() async {
    Get.put(AuthServiceImpl());
  }

  // initializeUserService() async {
  //   Get.put(
  //     UserServiceImpl(),
  //     permanent: true,
  //   );
  // }
}
