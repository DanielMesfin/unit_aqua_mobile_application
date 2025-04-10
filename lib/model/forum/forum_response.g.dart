// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumResponse _$ForumResponseFromJson(Map<String, dynamic> json) =>
    ForumResponse(
      forum: json['result'] == null
          ? null
          : ForumModel.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumResponseToJson(ForumResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.forum,
    };
