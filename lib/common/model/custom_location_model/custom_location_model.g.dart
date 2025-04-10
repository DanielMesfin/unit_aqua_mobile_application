// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomLocationModel _$CustomLocationModelFromJson(Map<String, dynamic> json) =>
    CustomLocationModel(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$CustomLocationModelToJson(
        CustomLocationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
