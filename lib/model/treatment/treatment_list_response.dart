import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';

import '../base/base_model.dart';

part 'treatment_list_response.g.dart';

@JsonSerializable()
class TreatmentListResponse extends BaseModel {
  @JsonKey(name: "result")
  List<TreatmentModel>? treatments;
  TreatmentListResponse({
    this.treatments,
  });

  factory TreatmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentListResponseToJson(this);
}
