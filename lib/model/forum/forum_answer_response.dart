import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum_answer.dart';

import '../base/base_model.dart';

part 'forum_answer_response.g.dart';

@JsonSerializable()
class ForumAnswerResponse extends BaseModel {
  @JsonKey(name: "result")
  final ForumAnswer? answer;
  ForumAnswerResponse({
    this.answer,
  });

  factory ForumAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumAnswerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumAnswerResponseToJson(this);
}
