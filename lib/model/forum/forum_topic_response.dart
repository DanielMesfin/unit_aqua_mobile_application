import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum_topic.dart';

import '../base/base_model.dart';

part 'forum_topic_response.g.dart';

@JsonSerializable()
class ForumTopicResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<ForumTopic>? topics;
  ForumTopicResponse({
    this.topics,
  });

  factory ForumTopicResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicResponseToJson(this);
}
