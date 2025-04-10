// To parse this JSON data, do
//
//     final cultureTestFormResponse = cultureTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'culture_test_form_response.g.dart';

CultureTestFormResponse cultureTestFormResponseFromJson(String str) =>
    CultureTestFormResponse.fromJson(json.decode(str));

String cultureTestFormResponseToJson(CultureTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CultureTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  CultureTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory CultureTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$CultureTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CultureTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "yellowColonies")
  int yellowColonies;
  @JsonKey(name: "greenColonies")
  int greenColonies;
  @JsonKey(name: "testId")
  int testId;
  @JsonKey(name: "tankId")
  int tankId;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "createdAt")
  String createdAt;

  Result({
    required this.status,
    required this.id,
    required this.yellowColonies,
    required this.greenColonies,
    required this.testId,
    required this.tankId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
