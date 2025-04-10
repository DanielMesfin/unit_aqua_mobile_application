import 'package:json_annotation/json_annotation.dart';

part 'forum_topic.g.dart';

@JsonSerializable()
class ForumTopic {
  final int id;
  final String? name;
  ForumTopic({
    required this.id,
    this.name,
  });

  factory ForumTopic.fromJson(Map<String, dynamic> json) =>
      _$ForumTopicFromJson(json);
  Map<String, dynamic> toJson() => _$ForumTopicToJson(this);
}
