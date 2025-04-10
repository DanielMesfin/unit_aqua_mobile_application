import 'package:json_annotation/json_annotation.dart';

part 'treatment_farmer_model.g.dart';

@JsonSerializable()
class TreatmentFarmerModel {
  final int? id;
  final int? treatmentId;
  final String? nameOne;
  final String? tankOne;
  final String? phoneOne;
  final String? nameTwo;
  final String? tankTwo;
  final String? phoneTwo;
  final String? nameThree;
  final String? tankThree;
  final String? phoneThree;
  TreatmentFarmerModel({
    this.id,
    this.treatmentId,
    this.nameOne,
    this.tankOne,
    this.phoneOne,
    this.nameTwo,
    this.tankTwo,
    this.phoneTwo,
    this.nameThree,
    this.tankThree,
    this.phoneThree,
  });
  factory TreatmentFarmerModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFarmerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentFarmerModelToJson(this);
}
