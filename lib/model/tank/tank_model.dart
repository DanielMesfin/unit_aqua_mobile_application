
import 'package:json_annotation/json_annotation.dart';

part 'tank_model.g.dart';

@JsonSerializable()
class TankModel {
  final int? id;
  final String? status;
  final String? name;
  final DateTime? createdAt;
  final int? farmerId;
  final String? area;
  final String? cultureType;
  final String? size;
  TankModel({
    this.id,
    this.status,
    this.name,
    this.size,
    this.farmerId,
    this.area,
    this.cultureType,
    this.createdAt,
  });

  factory TankModel.fromJson(Map<String, dynamic> json) =>
      _$TankModelFromJson(json);
  Map<String, dynamic> toJson() => _$TankModelToJson(this);
}
