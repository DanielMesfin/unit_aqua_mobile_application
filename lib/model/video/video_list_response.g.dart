// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoListResponse _$VideoListResponseFromJson(Map<String, dynamic> json) =>
    VideoListResponse(
      videos: (json['result'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$VideoListResponseToJson(VideoListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.videos,
    };
