import 'dart:async';

import 'package:dio/dio.dart';

import '../../common/constants/constants.dart';
import '../auth/auth_service_impl.dart';

import 'package:get/get.dart' as getx;

import '../secure_storage/secure_storage_service_impl.dart';

class AppInterceptors extends InterceptorsWrapper {
  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final isRegistered = getx.Get.isRegistered<AuthServiceImpl>();
    String? accessToken;
    bool? accessTokenExists;
    if (isRegistered) {
      final secureStorageService = getx.Get.find<SecureStorageServiceImpl>();
      accessTokenExists =
          await secureStorageService.isExists(key: Constants.accessTokenKey);
      if (accessTokenExists) {
        accessToken =
            await secureStorageService.read(key: Constants.accessTokenKey);
        options.headers = {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${accessToken!.isNotEmpty ? accessToken : ""}"
        };
      } else {
        options.headers = {
          "Content-Type": "application/json",
        };
      }
    }
    // Map<String, dynamic>? data = options.data;
    // if (data != null) {
    //   data.removeWhere((key, value) => value == null);
    //   options.data = data;
    // }
    // Map<String, dynamic>? params = options.queryParameters;
    // if (params.keys.isNotEmpty) {
    //   // params.removeWhere((key, value) => value == null);
    //   options.queryParameters = params;
    // }
    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
