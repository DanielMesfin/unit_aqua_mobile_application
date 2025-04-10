import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_forum.g.dart';

@JsonSerializable()
class CreateForumModel {
  final int? id;
  final int topicId;
  final String? title;
  final String? description;
  @JsonKey(includeFromJson: false)
  final File? imageUrl1;
  @JsonKey(includeFromJson: false)
  final File? imageUrl2;
  @JsonKey(includeFromJson: false)
  final File? imageUrl3;
  @JsonKey(includeFromJson: false)
  final File? imageUrl4;
  @JsonKey(includeFromJson: false)
  final File? imageUrl5;
  CreateForumModel({
    this.id,
    required this.topicId,
    this.title,
    this.description,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.imageUrl5,
  });

  factory CreateForumModel.fromJson(Map<String, dynamic> json) =>
      _$CreateForumModelFromJson(json);
  // Map<String, dynamic> toJson() => _$CreateForumModelToJson(this);
  Future<Map<String, dynamic>> toJson() async => <String, dynamic>{
        'id': id,
        'topicId': topicId,
        'title': title,
        'description': description,
        'imageUrl1': imageUrl1 == null
            ? null
            : await MultipartFile.fromFile(imageUrl1!.path),
        'imageUrl2': imageUrl2 == null
            ? null
            : await MultipartFile.fromFile(imageUrl2!.path),
        'imageUrl3': imageUrl3 == null
            ? null
            : await MultipartFile.fromFile(imageUrl3!.path),
      };
}
