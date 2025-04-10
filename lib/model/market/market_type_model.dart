import 'package:json_annotation/json_annotation.dart';

part 'market_type_model.g.dart';

@JsonSerializable()
class MarketTypeModel {
  final int? id;
  final String? name;
  final String? count;
  final double? rate;
  final DateTime? createdAt;
  MarketTypeModel({
    this.id,
    this.name,
    this.count,
    this.rate,
    this.createdAt,
  });

  factory MarketTypeModel.fromJson(Map<String, dynamic> json) =>
      _$MarketTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarketTypeModelToJson(this);
}
