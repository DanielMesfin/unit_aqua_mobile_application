// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorListResponse _$SectorListResponseFromJson(Map<String, dynamic> json) =>
    SectorListResponse(
      sectors: (json['result'] as List<dynamic>?)
          ?.map((e) => SectorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$SectorListResponseToJson(SectorListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.sectors,
    };
