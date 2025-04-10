// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentListResponse _$TreatmentListResponseFromJson(
        Map<String, dynamic> json) =>
    TreatmentListResponse(
      treatments: (json['result'] as List<dynamic>?)
          ?.map((e) => TreatmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$TreatmentListResponseToJson(
        TreatmentListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.treatments,
    };
