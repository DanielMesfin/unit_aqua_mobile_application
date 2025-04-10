// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_reply_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumReplyResponse _$ForumReplyResponseFromJson(Map<String, dynamic> json) =>
    ForumReplyResponse(
      reply: json['result'] == null
          ? null
          : ForumReply.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumReplyResponseToJson(ForumReplyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.reply,
    };
