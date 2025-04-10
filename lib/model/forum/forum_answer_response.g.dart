// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumAnswerResponse _$ForumAnswerResponseFromJson(Map<String, dynamic> json) =>
    ForumAnswerResponse(
      answer: json['result'] == null
          ? null
          : ForumAnswer.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumAnswerResponseToJson(
        ForumAnswerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.answer,
    };
