// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumListResponse _$ForumListResponseFromJson(Map<String, dynamic> json) =>
    ForumListResponse(
      forums: (json['result'] as List<dynamic>?)
          ?.map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$ForumListResponseToJson(ForumListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.forums,
    };
