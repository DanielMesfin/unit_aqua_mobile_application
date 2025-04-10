// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteReportResponse _$CompleteReportResponseFromJson(
        Map<String, dynamic> json) =>
    CompleteReportResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CompleteReportResponseToJson(
        CompleteReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };
