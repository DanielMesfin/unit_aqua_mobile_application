import 'package:json_annotation/json_annotation.dart';

part 'forum_bookmark.g.dart';

@JsonSerializable()
class ForumBookmark {
  final int? id;
  final int? forumId;
  final int? userId;
  final DateTime? createdAt;
  ForumBookmark({
    this.id,
    this.forumId,
    this.userId,
    this.createdAt,
  });

  factory ForumBookmark.fromJson(Map<String, dynamic> json) =>
      _$ForumBookmarkFromJson(json);
  Map<String, dynamic> toJson() => _$ForumBookmarkToJson(this);
}
