// To parse this JSON data, do
//
//     final completeReportModel = completeReportModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'complete_report_model.g.dart';

CompleteReportModel completeReportModelFromJson(String str) =>
    CompleteReportModel.fromJson(json.decode(str));

String completeReportModelToJson(CompleteReportModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CompleteReportModel {
  @JsonKey(name: "suggestion")
  String? suggestion;
  @JsonKey(name: "testId")
  int? testId;

  CompleteReportModel({
    this.suggestion,
    this.testId,
  });

  factory CompleteReportModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteReportModelToJson(this);
}
