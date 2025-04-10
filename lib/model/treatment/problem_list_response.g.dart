// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemListResponse _$ProblemListResponseFromJson(Map<String, dynamic> json) =>
    ProblemListResponse(
      problems: (json['result'] as List<dynamic>?)
          ?.map((e) => ProblemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ProblemListResponseToJson(
        ProblemListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.problems,
    };
