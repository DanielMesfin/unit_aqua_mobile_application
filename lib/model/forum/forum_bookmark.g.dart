// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumBookmark _$ForumBookmarkFromJson(Map<String, dynamic> json) =>
    ForumBookmark(
      id: (json['id'] as num?)?.toInt(),
      forumId: (json['forumId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ForumBookmarkToJson(ForumBookmark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forumId': instance.forumId,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
