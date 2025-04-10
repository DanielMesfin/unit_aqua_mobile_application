// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumModel _$ForumModelFromJson(Map<String, dynamic> json) => ForumModel(
      id: (json['id'] as num?)?.toInt(),
      topicId: (json['topicId'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl1: json['imageUrl1'] as String?,
      imageUrl2: json['imageUrl2'] as String?,
      imageUrl3: json['imageUrl3'] as String?,
      imageUrl4: json['imageUrl4'] as String?,
      imageUrl5: json['imageUrl5'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      forumAnswers: (json['forum_answers'] as List<dynamic>?)
          ?.map((e) => ForumAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBookmarked: ForumModel._boolToRxBool(json['isBookmarked'] as bool?),
      isLiked: ForumModel._boolToRxBool(json['isLiked'] as bool?),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForumModelToJson(ForumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicId': instance.topicId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl1': instance.imageUrl1,
      'imageUrl2': instance.imageUrl2,
      'imageUrl3': instance.imageUrl3,
      'imageUrl4': instance.imageUrl4,
      'imageUrl5': instance.imageUrl5,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'forum_answers': instance.forumAnswers,
      'isBookmarked': ForumModel._boolFromRxBool(instance.isBookmarked),
      'isLiked': ForumModel._boolFromRxBool(instance.isLiked),
    };
