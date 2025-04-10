// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumTopic _$ForumTopicFromJson(Map<String, dynamic> json) => ForumTopic(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ForumTopicToJson(ForumTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
