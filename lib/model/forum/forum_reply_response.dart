import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/forum/forum_reply.dart';

import '../base/base_model.dart';

part 'forum_reply_response.g.dart';

@JsonSerializable()
class ForumReplyResponse extends BaseModel {
  @JsonKey(name: "result")
  final ForumReply? reply;
  ForumReplyResponse({
    this.reply,
  });

  factory ForumReplyResponse.fromJson(Map<String, dynamic> json) =>
      _$ForumReplyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForumReplyResponseToJson(this);
}
