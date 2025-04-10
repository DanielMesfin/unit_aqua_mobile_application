import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'forum_bookmark.dart';

part 'forum_bookmark_response.g.dart';

@JsonSerializable()
class ForumBookmarkResponse extends BaseModel {
  @JsonKey(name: "result")
  final ForumBookmark? bookmark;
  ForumBookmarkResponse({
    this.bookmark,
  });

  factory ForumBookmarkResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumBookmarkResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumBookmarkResponseToJson(this);
}
