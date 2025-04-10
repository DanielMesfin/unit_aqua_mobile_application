// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumAnswer _$ForumAnswerFromJson(Map<String, dynamic> json) => ForumAnswer(
      id: (json['id'] as num?)?.toInt(),
      forumId: (json['forumId'] as num?)?.toInt(),
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      imageUrl: json['imageUrl1'] as String?,
      replies: (json['forum_replies'] as List<dynamic>?)
          ?.map((e) => ForumReply.fromJson(e as Map<String, dynamic>))
          .toList(),
      forum: json['forum'] == null
          ? null
          : ForumModel.fromJson(json['forum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForumAnswerToJson(ForumAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forumId': instance.forumId,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'forum_replies': instance.replies,
      'forum': instance.forum,
    };
