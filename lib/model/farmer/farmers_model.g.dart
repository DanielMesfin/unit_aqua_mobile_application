// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmersModel _$FarmersModelFromJson(Map<String, dynamic> json) => FarmersModel(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      name: json['name'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      area: json['area'] as String?,
      cultureType: json['cultureType'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      district: json['district'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$FarmersModelToJson(FarmersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'district': instance.district,
      'area': instance.area,
      'cultureType': instance.cultureType,
    };
