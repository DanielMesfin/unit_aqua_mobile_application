// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_assistant_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabAssistantUpdateResponse _$LabAssistantUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    LabAssistantUpdateResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$LabAssistantUpdateResponseToJson(
        LabAssistantUpdateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };
