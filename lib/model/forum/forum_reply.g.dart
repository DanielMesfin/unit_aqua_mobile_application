// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumReply _$ForumReplyFromJson(Map<String, dynamic> json) => ForumReply(
      id: (json['id'] as num?)?.toInt(),
      forumAnswerId: (json['forumAnswerId'] as num?)?.toInt(),
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isLiked: ForumReply._boolToRxBool(json['isLiked'] as bool?),
    );

Map<String, dynamic> _$ForumReplyToJson(ForumReply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'forumAnswerId': instance.forumAnswerId,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'isLiked': ForumReply._boolFromRxBool(instance.isLiked),
    };
