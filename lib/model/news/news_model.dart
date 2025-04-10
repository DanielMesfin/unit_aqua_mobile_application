import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final String? thumbnail;
  NewsModel({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.thumbnail,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
