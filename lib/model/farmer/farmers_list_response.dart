import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import '../tank/tank_model.dart';
import 'farmers_model.dart';

part 'farmers_list_response.g.dart';

@JsonSerializable()
class FarmerResponse extends BaseModel {
  @JsonKey(name: "farmer")
  final FarmersModel? farmer;
  @JsonKey(name: "tankList")
  final List<TankModel>? tankList;
  FarmerResponse({
    this.farmer,
    this.tankList,
  });

  factory FarmerResponse.fromJson(Map<String, dynamic> json) =>
      _$FarmerResponseFromJson(json);
 Future< Map<String, dynamic>> toJson() async =>_$FarmerResponseToJson(this);
}
