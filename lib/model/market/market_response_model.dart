import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'market_model.dart';

part 'market_response_model.g.dart';

@JsonSerializable()
class MarketResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<MarketModel>? name;
  MarketResponse({
    this.name,
  });

  factory MarketResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MarketResponseToJson(this);
}
