// To parse this JSON data, do
//
//     final shrimpTestFormResponse = shrimpTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'shrimp_test_form_response.g.dart';

ShrimpTestFormResponse shrimpTestFormResponseFromJson(String str) =>
    ShrimpTestFormResponse.fromJson(json.decode(str));

String shrimpTestFormResponseToJson(ShrimpTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ShrimpTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  ShrimpTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory ShrimpTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$ShrimpTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShrimpTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "externalAbnormalColor")
  String externalAbnormalColor;
  @JsonKey(name: "externalLesionUclers")
  String externalLesionUclers;
  @JsonKey(name: "externalExcessiveMucus")
  String externalExcessiveMucus;
  @JsonKey(name: "externalMalformations")
  String externalMalformations;
  @JsonKey(name: "gillsDiscoloration")
  String gillsDiscoloration;
  @JsonKey(name: "gillsParasites")
  String gillsParasites;
  @JsonKey(name: "hepatopancreasDiscoloration")
  String hepatopancreasDiscoloration;
  @JsonKey(name: "hepatopancreasEnlargement")
  String hepatopancreasEnlargement;
  @JsonKey(name: "stomachForeignMaterial")
  String stomachForeignMaterial;
  @JsonKey(name: "stomachAbnormalities")
  String stomachAbnormalities;
  @JsonKey(name: "reproductiveAbnormalities")
  String reproductiveAbnormalities;
  @JsonKey(name: "intestineBlockages")
  String intestineBlockages;
  @JsonKey(name: "intestineParasites")
  String intestineParasites;
  @JsonKey(name: "muscleTissueDiscoloration")
  String muscleTissueDiscoloration;
  @JsonKey(name: "muscleTissueLesions")
  String muscleTissueLesions;
  @JsonKey(name: "nervousSystemAbnormalities")
  String nervousSystemAbnormalities;
  @JsonKey(name: "generalBehaviorWeeknessOrLethargy")
  String generalBehaviorWeeknessOrLethargy;
  @JsonKey(name: "generalBehaviorReducedFeeding")
  String generalBehaviorReducedFeeding;
  @JsonKey(name: "specificDiseaseWhiteSpotSyndromeVirus")
  String specificDiseaseWhiteSpotSyndromeVirus;
  @JsonKey(name: "specificDiseaseInfectiousHypodermalVirus")
  String specificDiseaseInfectiousHypodermalVirus;
  @JsonKey(name: "specificDiseaseRunningMortalitySydrome")
  String specificDiseaseRunningMortalitySydrome;
  @JsonKey(name: "specificDiseaseTauraSyndromeVirus")
  String specificDiseaseTauraSyndromeVirus;
  @JsonKey(name: "specificDiseaseYellowHeadVirus")
  String specificDiseaseYellowHeadVirus;
  @JsonKey(name: "specificDiseaseEarlyMortalitySydrome")
  String specificDiseaseEarlyMortalitySydrome;
  @JsonKey(name: "specificDiseaseVibrioInfections")
  String specificDiseaseVibrioInfections;
  @JsonKey(name: "specificDiseaseAeromonasInfections")
  String specificDiseaseAeromonasInfections;
  @JsonKey(name: "specificDiseaseEHP")
  String specificDiseaseEhp;
  @JsonKey(name: "specificDiseaseFungiAndBacteria")
  String specificDiseaseFungiAndBacteria;
  @JsonKey(name: "externalBodyCramps")
  String? externalBodyCramps;
  @JsonKey(name: "externalTailRoot")
  String? externalTailRoot;
  @JsonKey(name: "externalVibrio")
  String? externalVibrio;
  @JsonKey(name: "gillsBlackGills")
  String? gillsBlackGills;
  @JsonKey(name: "gillsBrownGills")
  String? gillsBrownGills;
  @JsonKey(name: "hepatopancreasShrinked")
  String? hepatopancreasShrinked;
  @JsonKey(name: "intestineFluids")
  String? intestineFluids;
  @JsonKey(name: "intestineWhiteGut")
  String? intestineWhiteGut;
  @JsonKey(name: "intestineWhiteFecus")
  String? intestineWhiteFecus;
  @JsonKey(name: "muscleTissueWhiteMuscle")
  String? muscleTissueWhiteMuscle;
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
    required this.externalAbnormalColor,
    required this.externalLesionUclers,
    required this.externalExcessiveMucus,
    required this.externalMalformations,
    required this.gillsDiscoloration,
    required this.gillsParasites,
    required this.hepatopancreasDiscoloration,
    required this.hepatopancreasEnlargement,
    required this.stomachForeignMaterial,
    required this.stomachAbnormalities,
    required this.reproductiveAbnormalities,
    required this.intestineBlockages,
    required this.intestineParasites,
    required this.muscleTissueDiscoloration,
    required this.muscleTissueLesions,
    required this.nervousSystemAbnormalities,
    required this.generalBehaviorWeeknessOrLethargy,
    required this.generalBehaviorReducedFeeding,
    required this.specificDiseaseWhiteSpotSyndromeVirus,
    required this.specificDiseaseInfectiousHypodermalVirus,
    required this.specificDiseaseRunningMortalitySydrome,
    required this.specificDiseaseTauraSyndromeVirus,
    required this.specificDiseaseYellowHeadVirus,
    required this.specificDiseaseEarlyMortalitySydrome,
    required this.specificDiseaseVibrioInfections,
    required this.specificDiseaseAeromonasInfections,
    required this.specificDiseaseEhp,
    required this.specificDiseaseFungiAndBacteria,
    this.externalBodyCramps,
    this.externalTailRoot,
    this.externalVibrio,
    this.gillsBlackGills,
    this.gillsBrownGills,
    this.hepatopancreasShrinked,
    this.intestineFluids,
    this.intestineWhiteGut,
    this.intestineWhiteFecus,
    this.muscleTissueWhiteMuscle,
    required this.diagnosedProblemAndDisease,
    required this.tankId,
    required this.testId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
