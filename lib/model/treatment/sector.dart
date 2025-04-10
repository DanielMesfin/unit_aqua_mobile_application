import 'package:json_annotation/json_annotation.dart';

part 'sector.g.dart';

@JsonSerializable()
class SectorModel {
  final int? id;
  final String? name;
  SectorModel({
    this.id,
    this.name,
  });
  factory SectorModel.fromJson(Map<String, dynamic> json) =>
      _$SectorModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectorModelToJson(this);
}
