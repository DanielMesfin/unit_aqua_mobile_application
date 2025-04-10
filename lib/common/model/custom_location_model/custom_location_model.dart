import 'package:json_annotation/json_annotation.dart';

part 'custom_location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomLocationModel {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "coordinates")
  final List<double>? coordinates;
  CustomLocationModel({
    this.type,
    this.coordinates,
  });

  double? get getLatitude => coordinates?.first;

  double? get getLongitude => coordinates?.last;

  factory CustomLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomLocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomLocationModelToJson(this);

  factory CustomLocationModel.fromJsonModel(Object? json) =>
      _$CustomLocationModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(CustomLocationModel model) =>
      _$CustomLocationModelToJson(model);
}
