// To parse this JSON data, do
//
//     final soilTestFormResponse = soilTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'soil_test_form_response.g.dart';

SoilTestFormResponse soilTestFormResponseFromJson(String str) =>
    SoilTestFormResponse.fromJson(json.decode(str));

String soilTestFormResponseToJson(SoilTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SoilTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  SoilTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory SoilTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$SoilTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoilTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "soilType")
  String soilType;
  @JsonKey(name: "soilNature")
  String soilNature;
  @JsonKey(name: "soilPh")
  double soilPh;
  @JsonKey(name: "organicCarbon")
  String organicCarbon;
  @JsonKey(name: "availableNitrogen")
  String availableNitrogen;
  @JsonKey(name: "prosperous")
  String prosperous;
  @JsonKey(name: "potash")
  double potash;
  @JsonKey(name: "sulphur")
  String sulphur;
  @JsonKey(name: "zinc")
  double zinc;
  @JsonKey(name: "iron")
  String iron;
  @JsonKey(name: "boran")
  double boran;
  @JsonKey(name: "limeTest")
  String limeTest;
  @JsonKey(name: "tankId")
  int tankId;
  @JsonKey(name: "testId")
  int testId;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "createdAt")
  String createdAt;

  Result({
    required this.status,
    required this.id,
    required this.soilType,
    required this.soilNature,
    required this.soilPh,
    required this.organicCarbon,
    required this.availableNitrogen,
    required this.prosperous,
    required this.potash,
    required this.sulphur,
    required this.zinc,
    required this.iron,
    required this.boran,
    required this.limeTest,
    required this.tankId,
    required this.testId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
