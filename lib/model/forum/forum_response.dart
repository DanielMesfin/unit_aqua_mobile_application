import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'forum.dart';

part 'forum_response.g.dart';

@JsonSerializable()
class ForumResponse extends BaseModel {
  @JsonKey(name: "result")
  final ForumModel? forum;
  ForumResponse({
    this.forum,
  });

  factory ForumResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumResponseToJson(this);
}
