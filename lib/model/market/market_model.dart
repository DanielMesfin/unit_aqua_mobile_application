import 'package:json_annotation/json_annotation.dart';

part 'market_model.g.dart';

@JsonSerializable()
class MarketModel {
  final int? id;
  final String? name;
  final String? status;
  final DateTime? createdAt;

  MarketModel({
    this.id,
    this.name,
    this.status,
    this.createdAt,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarketModelToJson(this);
}
