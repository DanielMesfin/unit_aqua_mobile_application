import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final int? id;
  final String? title;
  final String? thumbnailUrl;
  final String? url;
  final DateTime? createdAt;
  BookModel({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.url,
    this.createdAt,
  });
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
