// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_forum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateForumModel _$CreateForumModelFromJson(Map<String, dynamic> json) =>
    CreateForumModel(
      id: (json['id'] as num?)?.toInt(),
      topicId: (json['topicId'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateForumModelToJson(CreateForumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicId': instance.topicId,
      'title': instance.title,
      'description': instance.description,
    };
