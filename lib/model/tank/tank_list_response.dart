import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'tank_model.dart';

part 'tank_list_response.g.dart';

@JsonSerializable()
class TankResponse extends BaseModel {
  @JsonKey(name: "result")
  final TankModel? tank;
  TankResponse({
    this.tank,
  });

  factory TankResponse.fromJson(Map<String, dynamic> json) =>
      _$TankResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TankResponseToJson(this);
}
