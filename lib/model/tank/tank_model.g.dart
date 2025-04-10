// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TankModel _$TankModelFromJson(Map<String, dynamic> json) => TankModel(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      farmerId: (json['farmerId'] as num?)?.toInt(),
      area: json['area'] as String?,
      cultureType: json['cultureType'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TankModelToJson(TankModel instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'farmerId': instance.farmerId,
      'area': instance.area,
      'cultureType': instance.cultureType,
      'size': instance.size,
    };
