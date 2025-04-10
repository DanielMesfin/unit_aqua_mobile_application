// To parse this JSON data, do
//
//     final waterTestFormResponse = waterTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'water_test_form_response.g.dart';

WaterTestFormResponse waterTestFormResponseFromJson(String str) =>
    WaterTestFormResponse.fromJson(json.decode(str));

String waterTestFormResponseToJson(WaterTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class WaterTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  WaterTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory WaterTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$WaterTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WaterTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "ph")
  double ph;
  @JsonKey(name: "temprature")
  int temprature;
  @JsonKey(name: "salinity")
  int? salinity;
  @JsonKey(name: "co3")
  int? co3;
  @JsonKey(name: "hco3")
  int? hco3;
  @JsonKey(name: "totalAlkanility")
  double totalAlkanility;
  @JsonKey(name: "totalHardness")
  double totalHardness;
  @JsonKey(name: "ca")
  double? ca;
  @JsonKey(name: "mg")
  double? mg;
  @JsonKey(name: "k")
  double? k;
  @JsonKey(name: "fe")
  double? fe;
  @JsonKey(name: "na")
  double? na;
  @JsonKey(name: "cl2")
  double? cl2;
  @JsonKey(name: "tan")
  double tan;
  @JsonKey(name: "nh3")
  int nh3;
  @JsonKey(name: "no2")
  int no2;
  @JsonKey(name: "h2s")
  double h2S;
  @JsonKey(name: "co2")
  double? co2;
  @JsonKey(name: "dissolvedOxygen")
  double dissolvedOxygen;
  @JsonKey(name: "electricalConductivity")
  int? electricalConductivity;
  @JsonKey(name: "totalDissolvedSolids")
  int totalDissolvedSolids;
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
    required this.ph,
    required this.temprature,
    required this.salinity,
    required this.co3,
    required this.hco3,
    required this.totalAlkanility,
    required this.totalHardness,
    required this.ca,
    required this.mg,
    required this.k,
    required this.fe,
    required this.na,
    required this.cl2,
    required this.tan,
    required this.nh3,
    required this.no2,
    required this.h2S,
    required this.co2,
    required this.dissolvedOxygen,
    required this.electricalConductivity,
    required this.totalDissolvedSolids,
    required this.tankId,
    required this.testId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
