import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'market_zone_model.dart';

part 'market_zone_list_response.g.dart';

@JsonSerializable()
class MarketZoneListResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<MarketZoneModel>? zoneList;
  MarketZoneListResponse({
    this.zoneList,
  });

  factory MarketZoneListResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketZoneListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MarketZoneListResponseToJson(this);
}
