import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';

import '../base/base_model.dart';

part 'forum_answer_list_response.g.dart';

@JsonSerializable()
class ForumAnswerListResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<ForumAnswer>? answers;
  ForumAnswerListResponse({
    this.answers,
  });

  factory ForumAnswerListResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumAnswerListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumAnswerListResponseToJson(this);
}
