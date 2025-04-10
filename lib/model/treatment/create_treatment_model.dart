import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_treatment_model.g.dart';

@JsonSerializable()
class CreateTreatmentModel {
  final int? id;
  final int? problemId;
  final String? name;
  final String? description;
  @JsonKey(includeFromJson: false)
  final File? imageUrl1;
  @JsonKey(includeFromJson: false)
  final File? imageUrl2;
  @JsonKey(includeFromJson: false)
  final File? imageUrl3;
  CreateTreatmentModel({
    this.id,
    this.problemId,
    this.name,
    this.description,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
  });

  factory CreateTreatmentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTreatmentModelFromJson(json);
  Future<Map<String, dynamic>> toJson() async => <String, dynamic>{
        'id': id,
        'problemId': problemId,
        'name': name,
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
