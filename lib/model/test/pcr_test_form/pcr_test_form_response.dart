// To parse this JSON data, do
//
//     final pcrTestFormResponse = pcrTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'pcr_test_form_response.g.dart';

PcrTestFormResponse pcrTestFormResponseFromJson(String str) =>
    PcrTestFormResponse.fromJson(json.decode(str));

String pcrTestFormResponseToJson(PcrTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PcrTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  PcrTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory PcrTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$PcrTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PcrTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "whiteSpotResult")
  String whiteSpotResult;
   @JsonKey(name: "enterocytozoonResult")
   String enterocytozoonResult;
  @JsonKey(name: "ihhnvResult")
  String ihhnvResult;
  @JsonKey(name: "emsResult")
  String emsResult;
  @JsonKey(name: "imnvResult")
  String imnvResult;
  @JsonKey(name: "vHarveyResult")
  String vHarveyResult;
  @JsonKey(name: "vParahaemolyticusResult")
  String vParahaemolyticusResult;
  @JsonKey(name: "whiteSpotCtValue")
  double whiteSpotCtValue;
  @JsonKey(name: "enterocytozoonCtValue")
  double enterocytozoonCtValue;
  @JsonKey(name: "ihhnvCtValue")
  double ihhnvCtValue;
  @JsonKey(name: "emsCtValue")
  double emsCtValue;
  @JsonKey(name: "imnvCtValue")
  double imnvCtValue;
  @JsonKey(name: "vHarveyCtValue")
    double vHarveyCtValue;
  @JsonKey(name: "vParahaemolyticusCtValue")
  double vParahaemolyticusCtValue;
  @JsonKey(name: "remarkText")        
  String remarkText;                     
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
    // required this.pcr,
    required this.whiteSpotResult,
    required this.enterocytozoonResult,
    required this.ihhnvResult,
    required this.emsResult,
    required this.imnvResult,
    required this.vHarveyResult,
    required this.vParahaemolyticusResult,
    required this.whiteSpotCtValue,
    required this.enterocytozoonCtValue,
    required this.ihhnvCtValue,
    required this.emsCtValue,
    required this.imnvCtValue,
    required this.vHarveyCtValue,
    required this.vParahaemolyticusCtValue,
    required this.remarkText,
    required this.testId,
    required this.tankId,
    required this.updatedAt,
    required this.createdAt,
    
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
