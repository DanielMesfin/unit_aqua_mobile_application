import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/treatment/sector.dart';

import '../base/base_model.dart';

part 'sector_list_response.g.dart';

@JsonSerializable()
class SectorListResponse extends BaseModel {
  @JsonKey(name: "result")
  List<SectorModel>? sectors;
  SectorListResponse({
    this.sectors,
  });

  factory SectorListResponse.fromJson(Map<String, dynamic> json) =>
      _$SectorListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SectorListResponseToJson(this);
}
