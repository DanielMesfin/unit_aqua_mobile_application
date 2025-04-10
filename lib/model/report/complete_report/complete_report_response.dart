// To parse this JSON data, do
//
//     final completeReportResponse = completeReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'complete_report_response.g.dart';

CompleteReportResponse completeReportResponseFromJson(String str) =>
    CompleteReportResponse.fromJson(json.decode(str));

String completeReportResponseToJson(CompleteReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CompleteReportResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  List<int>? result;

  CompleteReportResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory CompleteReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteReportResponseToJson(this);
}
