import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  final int? id;
  final String? title;
  final String? description;
  final String? thumbnailUrl;
  final String? url;
  final DateTime? createdAt;
  VideoModel({
    this.id,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.url,
    this.createdAt,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
