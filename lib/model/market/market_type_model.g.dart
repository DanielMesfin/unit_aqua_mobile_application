// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketTypeModel _$MarketTypeModelFromJson(Map<String, dynamic> json) =>
    MarketTypeModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      count: json['count'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MarketTypeModelToJson(MarketTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'rate': instance.rate,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
