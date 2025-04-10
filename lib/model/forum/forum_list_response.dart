import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'forum.dart';

part 'forum_list_response.g.dart';

@JsonSerializable()
class ForumListResponse extends BaseModel {
  @JsonKey(name: "result")
  List<ForumModel>? forums;
  ForumListResponse({
    this.forums,
  });

  factory ForumListResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumListResponseToJson(this);
}
