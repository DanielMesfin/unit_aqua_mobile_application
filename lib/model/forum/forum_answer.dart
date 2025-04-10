import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';
import 'package:unity_labs/model/user/user_model.dart';


part 'forum_answer.g.dart';

@JsonSerializable()
class ForumAnswer {
  final int? id;
  final int? forumId;
  final String? content;
  @JsonKey(includeFromJson: false)
  final File? imageUrl1;
  @JsonKey(name: "imageUrl1", includeToJson: false)
  final String? imageUrl;
  final DateTime? createdAt;
  final UserModel? user;
  @JsonKey(name: "forum_replies")
  final List<ForumReply>? replies;
  final ForumModel? forum;
  ForumAnswer({
    this.id,
    this.forumId,
    this.imageUrl1,
    this.content,
    this.createdAt,
    this.user,
    this.imageUrl,
    this.replies,
    this.forum,
  });

  factory ForumAnswer.fromJson(Map<String, dynamic> json) =>
      _$ForumAnswerFromJson(json);
  Future<Map<String, dynamic>> toJson() async => <String, dynamic>{
        'id': id,
        'forumId': forumId,
        'content': content,
        'imageUrl1': imageUrl1 == null
            ? null
            : await MultipartFile.fromFile(imageUrl1!.path),
      };
}
