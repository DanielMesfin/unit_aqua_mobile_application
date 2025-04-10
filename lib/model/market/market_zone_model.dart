import 'package:json_annotation/json_annotation.dart';

import 'market_model.dart';

part 'market_zone_model.g.dart';

@JsonSerializable()
class MarketZoneModel {
  final int? id;
  final String? name;
  final String? count;
  final double? rate;
  final DateTime? createdAt;
  @JsonKey(name: "market")
  MarketModel? marketTypes;
  MarketZoneModel({
    this.id,
    this.name,
    this.count,
    this.rate,
    this.createdAt,
    this.marketTypes,
  });

  factory MarketZoneModel.fromJson(Map<String, dynamic> json) =>
      _$MarketZoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarketZoneModelToJson(this);
}
