class HttpConfig {
  static const String baseUrl = "https://kbackend-zxbb.onrender.com/";
  // static const String baseUrl = "http://192.168.68.224:3001/";
  static const String platformUrl = '$baseUrl/api/plankton/completed';
  static const String imageUrl = '$baseUrl/images/';
  static const String serviceImageUrlFolder = 'service';
  static const String avatarImageUrlFolder = 'avatar';
  static const String providerImageUrlFolder = 'provider';
  static const String tagImageUrlFolder = 'tag';
  static const String categoryImageUrlFolder = 'category';
  static const String productImageUrlFolder = 'product';
  static const String apiBaseUrl = "$baseUrl/api/";
  static const int defaultConnectionTimeOut = 10 * 1000; //30 sec
  static const int longConnectionTimeOut = 60 * 1000; //60 sec
  static const int defaultReceiveTimeOut = 10 * 1000; //30 sec
  static const int longReceiveTimeOut = 60 * 1000; //60 sec
}
