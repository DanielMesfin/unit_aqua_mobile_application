import 'package:json_annotation/json_annotation.dart';
import 'package:unity_labs/model/treatment/problem_model.dart';

import '../base/base_model.dart';

part 'problem_list_response.g.dart';

@JsonSerializable()
class ProblemListResponse extends BaseModel {
  @JsonKey(name: "result")
  List<ProblemModel>? problems;
  ProblemListResponse({
    this.problems,
  });

  factory ProblemListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProblemListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemListResponseToJson(this);
}
