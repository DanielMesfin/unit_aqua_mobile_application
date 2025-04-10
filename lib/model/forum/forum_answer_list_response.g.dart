// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_answer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumAnswerListResponse _$ForumAnswerListResponseFromJson(
        Map<String, dynamic> json) =>
    ForumAnswerListResponse(
      answers: (json['result'] as List<dynamic>?)
          ?.map((e) => ForumAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumAnswerListResponseToJson(
        ForumAnswerListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.answers,
    };
