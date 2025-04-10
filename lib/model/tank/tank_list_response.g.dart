// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TankResponse _$TankResponseFromJson(Map<String, dynamic> json) => TankResponse(
      tank: json['result']['tank'] == null
          ? null
          : TankModel.fromJson(json['result']['tank'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$TankResponseToJson(TankResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.tank,
    };
