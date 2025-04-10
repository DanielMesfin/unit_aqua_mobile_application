// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorModel _$SectorModelFromJson(Map<String, dynamic> json) => SectorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SectorModelToJson(SectorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
