import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/treatment/problem_model.dart';

part 'treatment_model.g.dart';

@JsonSerializable()
class TreatmentModel {
  int? id;
  int? problemId;
  String? name;
  String? description;
  int? importCount;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  ProblemModel? problem;
  DateTime? createdAt;

  TreatmentModel({
    this.id,
    this.problemId,
    this.name,
    this.importCount,
    this.description,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.problem,
    this.createdAt,
  });

  List<String> get imgUrls {
    List<String?> imageFromBackend = [
      imageUrl1,
      imageUrl2,
      imageUrl3,
    ];
    List<String> images = [];
    for (String? img in imageFromBackend) {
      if (img != null) {
        images.add(img);
      }
    }
    return images;
  }

  factory TreatmentModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentModelToJson(this);
}
