import 'package:unity_labs/model/market/mark_data_model.dart';

import '../../model/market/market_response_model.dart';
import '../../model/market/market_zone_list_response.dart';

abstract class MarketServices {
  Future<MarketZoneListResponse> getAllZones(int marketId);
  Future<MarketResponse> getAllMarkets();
  Future<MarketZoneListResponse> getAllTypes(int marketId);
  Future<MarketApiResponse> filter(int typeId, int zoneId);
}
