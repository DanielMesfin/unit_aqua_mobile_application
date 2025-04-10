import 'package:json_annotation/json_annotation.dart';

part 'problem_model.g.dart';

@JsonSerializable()
class ProblemModel {
  final int? id;
  final int? sectorId;
  final String? name;
  ProblemModel({
    this.id,
    this.name,
    this.sectorId,
  });
  factory ProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ProblemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemModelToJson(this);
}
