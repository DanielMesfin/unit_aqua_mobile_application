// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumTopicResponse _$ForumTopicResponseFromJson(Map<String, dynamic> json) =>
    ForumTopicResponse(
      topics: (json['result'] as List<dynamic>?)
          ?.map((e) => ForumTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumTopicResponseToJson(ForumTopicResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.topics,
    };
