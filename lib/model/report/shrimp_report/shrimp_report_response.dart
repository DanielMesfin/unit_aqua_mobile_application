// To parse this JSON data, do
//
//     final shrimpReportResponse = shrimpReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'shrimp_report_response.g.dart';

ShrimpReportResponse shrimpReportResponseFromJson(String str) =>
    ShrimpReportResponse.fromJson(json.decode(str));

String shrimpReportResponseToJson(ShrimpReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ShrimpReportResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  List<Result>? result;

  ShrimpReportResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory ShrimpReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ShrimpReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShrimpReportResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "externalAbnormalColor")
  String? externalAbnormalColor;
  @JsonKey(name: "externalLesionUclers")
  String? externalLesionUclers;
  @JsonKey(name: "externalExcessiveMucus")
  String? externalExcessiveMucus;
  @JsonKey(name: "externalMalformations")
  String? externalMalformations;
  @JsonKey(name: "gillsDiscoloration")
  String? gillsDiscoloration;
  @JsonKey(name: "externalBodyCramps")
  String? externalBodyCramps;
  @JsonKey(name: "externalTailRoot")
  String? externalTailRoot;
  @JsonKey(name: "gillsParasites")
  String? gillsParasites;
  @JsonKey(name: "hepatopancreasDiscoloration")
  String? hepatopancreasDiscoloration;
  @JsonKey(name: "hepatopancreasEnlargement")
  String? hepatopancreasEnlargement;
  @JsonKey(name: "stomachForeignMaterial")
  String? stomachForeignMaterial;
  @JsonKey(name: "stomachAbnormalities")
  String? stomachAbnormalities;
  @JsonKey(name: "reproductiveAbnormalities")
  String? reproductiveAbnormalities;
  @JsonKey(name: "intestineBlockages")
  String? intestineBlockages;
  @JsonKey(name: "intestineParasites")
  String? intestineParasites;
  @JsonKey(name: "muscleTissueDiscoloration")
  String? muscleTissueDiscoloration;
  @JsonKey(name: "muscleTissueLesions")
  String? muscleTissueLesions;
  @JsonKey(name: "nervousSystemAbnormalities")
  String? nervousSystemAbnormalities;
  @JsonKey(name: "generalBehaviorWeeknessOrLethargy")
  String? generalBehaviorWeeknessOrLethargy;
  @JsonKey(name: "generalBehaviorReducedFeeding")
  String? generalBehaviorReducedFeeding;
  @JsonKey(name: "specificDiseaseWhiteSpotSyndromeVirus")
  String? specificDiseaseWhiteSpotSyndromeVirus;
  @JsonKey(name: "specificDiseaseInfectiousHypodermalVirus")
  String? specificDiseaseInfectiousHypodermalVirus;
  @JsonKey(name: "specificDiseaseRunningMortalitySydrome")
  String? specificDiseaseRunningMortalitySydrome;
  @JsonKey(name: "specificDiseaseTauraSyndromeVirus")
  String? specificDiseaseTauraSyndromeVirus;
  @JsonKey(name: "specificDiseaseYellowHeadVirus")
  String? specificDiseaseYellowHeadVirus;
  @JsonKey(name: "specificDiseaseEarlyMortalitySydrome")
  String? specificDiseaseEarlyMortalitySydrome;
  @JsonKey(name: "specificDiseaseVibrioInfections")
  String? specificDiseaseVibrioInfections;
  @JsonKey(name: "specificDiseaseAeromonasInfections")
  String? specificDiseaseAeromonasInfections;
  @JsonKey(name: "specificDiseaseEhp")
  String? specificDiseaseEhp;
  @JsonKey(name: "specificDiseaseFungiAndBacteria")
  String? specificDiseaseFungiAndBacteria;
  @JsonKey(name: "muscleTissueWhiteMuscle")
  String? muscleTissueWhiteMuscle;
  @JsonKey(name: "intestineWhiteFecus")
  String? intestineWhiteFecus;
  @JsonKey(name: "intestineWhiteGut")
  String? intestineWhiteGut;
  @JsonKey(name: "intestineFluids")
  String? intestineFluids;
  @JsonKey(name: "hepatopancreasShrinked")
  String? hepatopancreasShrinked;
  @JsonKey(name: "gillsBrownGills")
  String? gillsBrownGills;
  @JsonKey(name: "gillsBlackGills")
  String? gillsBlackGills;
  @JsonKey(name: "externalVibrio")
  String? externalVibrio;
  @JsonKey(name: "diagnosedProblemAndDisease")
  String? diagnosedProblemAndDisease;
  @JsonKey(name: "suggestion")
  String? suggestion;
  @JsonKey(name: "testId")
  int? testId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "tankId")
  int? tankId;
  @JsonKey(name: "alltest")
  Alltest? alltest;
  @JsonKey(name: "tank")
  Tank? tank;

  Result({
    this.intestineWhiteFecus,
    this.intestineWhiteGut,
    this.muscleTissueWhiteMuscle,
    this.intestineFluids,
    this.hepatopancreasShrinked,
    this.gillsBrownGills,
    this.gillsBlackGills,
    this.externalVibrio,
    this.id,
    this.externalBodyCramps,
    this.externalTailRoot,
    this.externalAbnormalColor,
    this.externalLesionUclers,
    this.externalExcessiveMucus,
    this.externalMalformations,
    this.gillsDiscoloration,
    this.gillsParasites,
    this.hepatopancreasDiscoloration,
    this.hepatopancreasEnlargement,
    this.stomachForeignMaterial,
    this.stomachAbnormalities,
    this.reproductiveAbnormalities,
    this.intestineBlockages,
    this.intestineParasites,
    this.muscleTissueDiscoloration,
    this.muscleTissueLesions,
    this.nervousSystemAbnormalities,
    this.generalBehaviorWeeknessOrLethargy,
    this.generalBehaviorReducedFeeding,
    this.specificDiseaseWhiteSpotSyndromeVirus,
    this.specificDiseaseInfectiousHypodermalVirus,
    this.specificDiseaseRunningMortalitySydrome,
    this.specificDiseaseTauraSyndromeVirus,
    this.specificDiseaseYellowHeadVirus,
    this.specificDiseaseEarlyMortalitySydrome,
    this.specificDiseaseVibrioInfections,
    this.specificDiseaseAeromonasInfections,
    this.specificDiseaseEhp,
    this.specificDiseaseFungiAndBacteria,
    this.diagnosedProblemAndDisease,
    this.suggestion,
    this.testId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'externalAbnormalColor': externalAbnormalColor,
      'externalLesionUclers': externalLesionUclers,
      'externalExcessiveMucus': externalExcessiveMucus,
      'externalMalformations': externalMalformations,
      'gillsDiscoloration': gillsDiscoloration,
      'gillsParasites': gillsParasites,
      'hepatopancreasDiscoloration': hepatopancreasDiscoloration,
      'hepatopancreasEnlargement': hepatopancreasEnlargement,
      'stomachForeignMaterial': stomachForeignMaterial,
      'stomachAbnormalities': stomachAbnormalities,
      'reproductiveAbnormalities': reproductiveAbnormalities,
      'intestineBlockages': intestineBlockages,
      'intestineParasites': intestineParasites,
      'muscleTissueDiscoloration': muscleTissueDiscoloration,
      'muscleTissueLesions': muscleTissueLesions,
      'nervousSystemAbnormalities': nervousSystemAbnormalities,
      'generalBehaviorWeeknessOrLethargy': generalBehaviorWeeknessOrLethargy,
      'generalBehaviorReducedFeeding': generalBehaviorReducedFeeding,
      'specificDiseaseWhiteSpotSyndromeVirus':
          specificDiseaseWhiteSpotSyndromeVirus,
      'specificDiseaseInfectiousHypodermalVirus':
          specificDiseaseInfectiousHypodermalVirus,
      'specificDiseaseRunningMortalitySydrome':
          specificDiseaseRunningMortalitySydrome,
      'specificDiseaseTauraSyndromeVirus': specificDiseaseTauraSyndromeVirus,
      'specificDiseaseYellowHeadVirus': specificDiseaseYellowHeadVirus,
      'specificDiseaseEarlyMortalitySydrome':
          specificDiseaseEarlyMortalitySydrome,
      'specificDiseaseVibrioInfections': specificDiseaseVibrioInfections,
      'specificDiseaseAeromonasInfections': specificDiseaseAeromonasInfections,
      'specificDiseaseEHP': specificDiseaseEhp,
      'specificDiseaseFungiAndBacteria': specificDiseaseFungiAndBacteria,
      'externalBodyCramps': externalBodyCramps ?? "Yes",
      'externalTailRoot': externalTailRoot ?? "Yes",
      'externalVibrio': externalVibrio ?? "Yes",
      'gillsBlackGills': gillsBlackGills ?? "Yes",
      'gillsBrownGills': gillsBrownGills ?? "No",
      'hepatopancreasShrinked': hepatopancreasShrinked ?? "No",
      'intestineFluids': intestineFluids ?? "Yes",
      'intestineWhiteGut': intestineWhiteGut ?? "No",
      'intestineWhiteFecus': intestineWhiteFecus ?? "No",
      'muscleTissueWhiteMuscle': muscleTissueWhiteMuscle ?? "Yes",
      'diagnosedProblemAndDisease': diagnosedProblemAndDisease,
      'suggestion': suggestion ?? "",
    };
  }
}

@JsonSerializable()
class Alltest {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "depth")
  String? depth;
  @JsonKey(name: "biomass")
  String? biomass;
  @JsonKey(name: "weight")
  String? weight;
  @JsonKey(name: "planktonTest")
  String? planktonTest;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "tankId")
  int? tankId;

  Alltest({
    this.id,
    this.type,
    this.depth,
    this.biomass,
    this.weight,
    this.planktonTest,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
  });

  factory Alltest.fromJson(Map<String, dynamic> json) =>
      _$AlltestFromJson(json);

  Map<String, dynamic> toJson() => _$AlltestToJson(this);
}

@JsonSerializable()
class Tank {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "uuid")
  String? uuid;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "cultureType")
  String? cultureType;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "farmerId")
  int? farmerId;
  @JsonKey(name: "farmer")
  Farmer? farmer;

  Tank({
    this.id,
    this.uuid,
    this.name,
    this.area,
    this.size,
    this.cultureType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.farmerId,
    this.farmer,
  });

  factory Tank.fromJson(Map<String, dynamic> json) => _$TankFromJson(json);

  Map<String, dynamic> toJson() => _$TankToJson(this);
}

@JsonSerializable()
class Farmer {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "uuid")
  String? uuid;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "cultureType")
  String? cultureType;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "user")
  User? user;

  Farmer({
    this.id,
    this.uuid,
    this.name,
    this.phoneNumber,
    this.state,
    this.district,
    this.area,
    this.cultureType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "uuid")
  String? uuid;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "pin")
  int? pin;
  @JsonKey(name: "qualification")
  String? qualification;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "labName")
  String? labName;
  @JsonKey(name: "labImage")
  String? labImage;
  @JsonKey(name: "labLogo")
  String? labLogo;
  @JsonKey(name: "labReportImage")
  String? labReportImage;
  @JsonKey(name: "labReport")
  String? labReport;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "approvedBy")
  int? approvedBy;
  @JsonKey(name: "approvedDate")
  String? approvedDate;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  User({
    this.id,
    this.uuid,
    this.name,
    this.phoneNumber,
    this.pin,
    this.qualification,
    this.state,
    this.district,
    this.area,
    this.labName,
    this.labImage,
    this.labLogo,
    this.labReportImage,
    this.labReport,
    this.role,
    this.status,
    this.approvedBy,
    this.approvedDate,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
