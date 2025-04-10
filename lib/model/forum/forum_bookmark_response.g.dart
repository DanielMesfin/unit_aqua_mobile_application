// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumBookmarkResponse _$ForumBookmarkResponseFromJson(
        Map<String, dynamic> json) =>
    ForumBookmarkResponse(
      bookmark: json['result'] == null
          ? null
          : ForumBookmark.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumBookmarkResponseToJson(
        ForumBookmarkResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.bookmark,
    };
