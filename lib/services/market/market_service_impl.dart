
import 'package:get/get.dart';
import 'package:unity_labs/model/market/mark_data_model.dart';
import 'package:unity_labs/model/market/market_response_model.dart';
import 'package:unity_labs/model/market/market_zone_list_response.dart';
import 'package:unity_labs/services/market/market_services.dart';

import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class MarketServiceImpl extends MarketServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<MarketZoneListResponse> getAllZones(int marketId) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.marketZone}$marketId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = MarketZoneListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<MarketZoneListResponse> getAllTypes(int marketId) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.marketType}$marketId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = MarketZoneListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<MarketResponse> getAllMarkets() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.allMarker,
      headerType: HeaderType.secured,
    );
    final parsedResponse = MarketResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<MarketApiResponse> filter(int typeId, int zoneId) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.findRate}$typeId/$zoneId',
      headerType: HeaderType.secured,
    );
    // List<MarketTypeData> resultList = response.data.map((item) {
    //   return MarketTypeData.fromJson(item);
    // }).toList();
    final parsedResponse = MarketApiResponse.fromJson(response.data);
    return parsedResponse;
  }
}
