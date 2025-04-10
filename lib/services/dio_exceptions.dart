import 'package:dio/dio.dart';

import '../data/base_model/base_model.dart';

class DioExceptions implements Exception {
  late BaseModel baseResponse;
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        baseResponse = BaseModel(error: "Request cancelled", status: "failure");
        break;
      case DioExceptionType.connectionTimeout:
        baseResponse =
            BaseModel(error: "Connection timeout", status: "failure");

        break;
      case DioExceptionType.unknown:
        baseResponse =
            BaseModel(error: "No internet connection", status: "failure");

        break;
      case DioExceptionType.receiveTimeout:
        baseResponse = BaseModel(error: "Receive timeout", status: "failure");

        break;
      case DioExceptionType.badResponse:
        baseResponse = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        baseResponse = BaseModel(error: "Send timeout", status: "failure");
        break;
      default:
        baseResponse =
            BaseModel(error: "Something went wrong", status: "failure");

        break;
    }
  }
  BaseModel _handleError(int? statusCode, data) {
    if (statusCode == 301) {
      return baseResponse =
          BaseModel(error: "Something went wrong", status: "failure");
    }
    final response = BaseModel.fromJson(data);
    switch (statusCode) {
      case 400:
        return baseResponse = BaseModel(
            error: response.message ?? "Bad Request", status: response.status);
      case 401:
      case 403:
        return baseResponse =
            BaseModel(error: "session expired", status: response.status);
      case 404:
        return baseResponse =
            BaseModel(error: "Page not found", status: response.status);
      case 405:
        return baseResponse = BaseModel(
            error: response.message ?? "Not Supported",
            status: response.status);
      case 500:
        return baseResponse = BaseModel(
          error: response.message ?? "Error Occurred",
          status: response.status,
        );
      default:
        return baseResponse =
            BaseModel(error: "Something went wrong", status: response.status);
    }
  }
}
