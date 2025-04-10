import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/user/user_model.dart';

part 'forum_reply.g.dart';

@JsonSerializable()
class ForumReply {
  final int? id;
  final int? forumAnswerId;
  final String? content;
  final DateTime? createdAt;
  final UserModel? user;
  @JsonKey(fromJson: _boolToRxBool, toJson: _boolFromRxBool)
  RxBool? isLiked;
  ForumReply({
    this.id,
    this.forumAnswerId,
    this.content,
    this.createdAt,
    this.user,
    this.isLiked,
  });
  static RxBool? _boolToRxBool(bool? value) => value?.obs;
  static bool? _boolFromRxBool(RxBool? val) => val?.value;

  factory ForumReply.fromJson(Map<String, dynamic> json) =>
      _$ForumReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ForumReplyToJson(this);
}
