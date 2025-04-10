// To parse this JSON data, do
//
//     final fishTestFormResponse = fishTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'fish_test_form_response.g.dart';

FishTestFormResponse fishTestFormResponseFromJson(String str) =>
    FishTestFormResponse.fromJson(json.decode(str));

String fishTestFormResponseToJson(FishTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FishTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  FishTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory FishTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$FishTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FishTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "fishDetails")
  String fishDetails;
  @JsonKey(name: "bodyColour")
  String bodyColour;
  @JsonKey(name: "bodyTexture")
  String bodyTexture;
  @JsonKey(name: "mucus")
  String mucus;
  @JsonKey(name: "eyes")
  String eyes;
  @JsonKey(name: "finsColour")
  String finsColour;
  @JsonKey(name: "gills")
  String gills;
  @JsonKey(name: "intestines")
  String intestines;
  @JsonKey(name: "internalBloodLumps")
  String internalBloodLumps;
  @JsonKey(name: "liver")
  String liver;
  @JsonKey(name: "gut")
  String gut;
  @JsonKey(name: "gallBladder")
  String gallBladder;
  @JsonKey(name: "redDisease")
  String redDisease;
  @JsonKey(name: "ulcerativeDropsy")
  String ulcerativeDropsy;
  @JsonKey(name: "abdominalDropsy")
  String abdominalDropsy;
  @JsonKey(name: "bodyColumnaris")
  String bodyColumnaris;
  @JsonKey(name: "gillColumnaris")
  String gillColumnaris;
  @JsonKey(name: "epizooticUlcerativeSyndrome")
  String epizooticUlcerativeSyndrome;
  @JsonKey(name: "dactylogyrus")
  String dactylogyrus;
  @JsonKey(name: "gyrodactylus")
  String gyrodactylus;
  @JsonKey(name: "trichodina")
  String trichodina;
  @JsonKey(name: "myxobolus")
  String myxobolus;
  @JsonKey(name: "anchorWormORLernaea")
  String anchorWormOrLernaea;
  @JsonKey(name: "argulus")
  String argulus;
  @JsonKey(name: "finRotORTailrot")
  String finRotOrTailrot;
  @JsonKey(name: "hemorrhagicSepticemia")
  String hemorrhagicSepticemia;
  @JsonKey(name: "diagnosedProblemAndDisease")
  String diagnosedProblemAndDisease;
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
    required this.fishDetails,
    required this.bodyColour,
    required this.bodyTexture,
    required this.mucus,
    required this.eyes,
    required this.finsColour,
    required this.gills,
    required this.intestines,
    required this.internalBloodLumps,
    required this.liver,
    required this.gut,
    required this.gallBladder,
    required this.redDisease,
    required this.ulcerativeDropsy,
    required this.abdominalDropsy,
    required this.bodyColumnaris,
    required this.gillColumnaris,
    required this.epizooticUlcerativeSyndrome,
    required this.dactylogyrus,
    required this.gyrodactylus,
    required this.trichodina,
    required this.myxobolus,
    required this.anchorWormOrLernaea,
    required this.argulus,
    required this.finRotOrTailrot,
    required this.hemorrhagicSepticemia,
    required this.diagnosedProblemAndDisease,
    required this.tankId,
    required this.testId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
