import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'video_model.dart';
part 'video_list_response.g.dart';

@JsonSerializable()
class VideoListResponse extends BaseModel {
  @JsonKey(name: "result")
  final List<VideoModel>? videos;
  VideoListResponse({
    this.videos,
  });

  factory VideoListResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VideoListResponseToJson(this);
}
