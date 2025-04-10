
import 'package:json_annotation/json_annotation.dart';


part 'farmers_model.g.dart';

@JsonSerializable()

class FarmersModel {
  final int? id;
  final String? status;
  final String? name;

  final DateTime? createdAt;
  final int? userId;

  final String? phoneNumber;
  final String? state;
  final String? district;
  final String? area;
  final String? cultureType;

  FarmersModel({
    this.id,
    this.status,
    this.name,
    this.userId,
    this.phoneNumber,
    this.area,
    this.cultureType,
    this.createdAt,
    this.district,
    this.state,
  });

  factory FarmersModel.fromJson(Map<String, dynamic> json) =>
      _$FarmersModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmersModelToJson(this);
}
