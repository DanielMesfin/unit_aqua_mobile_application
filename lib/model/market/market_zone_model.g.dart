// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketZoneModel _$MarketZoneModelFromJson(Map<String, dynamic> json) =>
    MarketZoneModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      count: json['count'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      marketTypes: json['market'] == null
          ? null
          : MarketModel.fromJson(json['market'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketZoneModelToJson(MarketZoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'rate': instance.rate,
      'createdAt': instance.createdAt?.toIso8601String(),
      'market': instance.marketTypes,
    };
