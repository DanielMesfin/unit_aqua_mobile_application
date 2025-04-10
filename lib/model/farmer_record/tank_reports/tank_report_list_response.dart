// To parse this JSON data, do
//
//     final tankReportListResponse = tankReportListResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tank_report_list_response.g.dart';

TankReportListResponse tankReportListResponseFromJson(String str) =>
    TankReportListResponse.fromJson(json.decode(str));

String tankReportListResponseToJson(TankReportListResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TankReportListResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  Result? result;

  TankReportListResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory TankReportListResponse.fromJson(Map<String, dynamic> json) =>
      _$TankReportListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TankReportListResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "water")
  List<Water>? water;
  @JsonKey(name: "fish")
  List<Fish>? fish;
  @JsonKey(name: "shrimp")
  List<Shrimp>? shrimp;
  @JsonKey(name: "soil")
  List<Soil>? soil;
  @JsonKey(name: "pcr")
  List<Culture>? pcr;
  @JsonKey(name: "feed")
  List<Feed>? feed;
  @JsonKey(name: "culture")
  List<Culture>? culture;

  Result({
    this.water,
    this.fish,
    this.shrimp,
    this.soil,
    this.pcr,
    this.feed,
    this.culture,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Culture {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "yellowColonies")
  int? yellowColonies;
  @JsonKey(name: "greenColonies")
  int? greenColonies;
  @JsonKey(name: "testId")
  int? testId;
  @JsonKey(name: "suggestion")
  String? suggestion;
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
  @JsonKey(name: "pcr")
  String? pcr;

  Culture({
    this.id,
    this.yellowColonies,
    this.greenColonies,
    this.testId,
    this.suggestion,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
    this.pcr,
  });

  factory Culture.fromJson(Map<String, dynamic> json) =>
      _$CultureFromJson(json);

  Map<String, dynamic> toJson() => _$CultureToJson(this);
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

@JsonSerializable()
class Feed {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "fat")
  String? fat;
  @JsonKey(name: "protein")
  String? protein;
  @JsonKey(name: "moisture")
  String? moisture;
  @JsonKey(name: "ash")
  String? ash;
  @JsonKey(name: "fiber")
  String? fiber;
  @JsonKey(name: "testId")
  int? testId;
  @JsonKey(name: "suggestion")
  String? suggestion;
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

  Feed({
    this.id,
    this.fat,
    this.protein,
    this.moisture,
    this.ash,
    this.fiber,
    this.testId,
    this.suggestion,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class Fish {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "fishDetails")
  String? fishDetails;
  @JsonKey(name: "bodyColour")
  String? bodyColour;
  @JsonKey(name: "bodyTexture")
  String? bodyTexture;
  @JsonKey(name: "mucus")
  String? mucus;
  @JsonKey(name: "eyes")
  String? eyes;
  @JsonKey(name: "finsColour")
  String? finsColour;
  @JsonKey(name: "gills")
  String? gills;
  @JsonKey(name: "intestines")
  String? intestines;
  @JsonKey(name: "internalBloodLumps")
  String? internalBloodLumps;
  @JsonKey(name: "liver")
  String? liver;
  @JsonKey(name: "gut")
  String? gut;
  @JsonKey(name: "gallBladder")
  String? gallBladder;
  @JsonKey(name: "redDisease")
  String? redDisease;
  @JsonKey(name: "ulcerativeDropsy")
  String? ulcerativeDropsy;
  @JsonKey(name: "abdominalDropsy")
  String? abdominalDropsy;
  @JsonKey(name: "bodyColumnaris")
  String? bodyColumnaris;
  @JsonKey(name: "gillColumnaris")
  String? gillColumnaris;
  @JsonKey(name: "epizooticUlcerativeSyndrome")
  String? epizooticUlcerativeSyndrome;
  @JsonKey(name: "dactylogyrus")
  String? dactylogyrus;
  @JsonKey(name: "gyrodactylus")
  String? gyrodactylus;
  @JsonKey(name: "trichodina")
  String? trichodina;
  @JsonKey(name: "myxobolus")
  String? myxobolus;
  @JsonKey(name: "anchorWormORLernaea")
  String? anchorWormOrLernaea;
  @JsonKey(name: "argulus")
  String? argulus;
  @JsonKey(name: "finRotORTailrot")
  String? finRotOrTailrot;
  @JsonKey(name: "hemorrhagicSepticemia")
  String? hemorrhagicSepticemia;
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

  Fish({
    this.id,
    this.fishDetails,
    this.bodyColour,
    this.bodyTexture,
    this.mucus,
    this.eyes,
    this.finsColour,
    this.gills,
    this.intestines,
    this.internalBloodLumps,
    this.liver,
    this.gut,
    this.gallBladder,
    this.redDisease,
    this.ulcerativeDropsy,
    this.abdominalDropsy,
    this.bodyColumnaris,
    this.gillColumnaris,
    this.epizooticUlcerativeSyndrome,
    this.dactylogyrus,
    this.gyrodactylus,
    this.trichodina,
    this.myxobolus,
    this.anchorWormOrLernaea,
    this.argulus,
    this.finRotOrTailrot,
    this.hemorrhagicSepticemia,
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

  factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);

  Map<String, dynamic> toJson() => _$FishToJson(this);
}

@JsonSerializable()
class Shrimp {
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
  @JsonKey(name: "specificDiseaseEHP")
  String? specificDiseaseEhp;
  @JsonKey(name: "specificDiseaseFungiAndBacteria")
  String? specificDiseaseFungiAndBacteria;
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

  Shrimp({
    this.id,
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

  factory Shrimp.fromJson(Map<String, dynamic> json) => _$ShrimpFromJson(json);

  Map<String, dynamic> toJson() => _$ShrimpToJson(this);
}

@JsonSerializable()
class Soil {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "soilType")
  String? soilType;
  @JsonKey(name: "soilNature")
  String? soilNature;
  @JsonKey(name: "soilPh")
  String? soilPh;
  @JsonKey(name: "organicCarbon")
  String? organicCarbon;
  @JsonKey(name: "availableNitrogen")
  String? availableNitrogen;
  @JsonKey(name: "prosperous")
  String? prosperous;
  @JsonKey(name: "potash")
  String? potash;
  @JsonKey(name: "sulphur")
  String? sulphur;
  @JsonKey(name: "zinc")
  String? zinc;
  @JsonKey(name: "iron")
  String? iron;
  @JsonKey(name: "boran")
  String? boran;
  @JsonKey(name: "limeTest")
  String? limeTest;
  @JsonKey(name: "observationType")
  String? observationType;
  @JsonKey(name: "observation")
  String? observation;
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

  Soil({
    this.id,
    this.soilType,
    this.soilNature,
    this.soilPh,
    this.organicCarbon,
    this.availableNitrogen,
    this.prosperous,
    this.potash,
    this.sulphur,
    this.zinc,
    this.iron,
    this.boran,
    this.limeTest,
    this.observationType,
    this.observation,
    this.suggestion,
    this.testId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Soil.fromJson(Map<String, dynamic> json) => _$SoilFromJson(json);

  Map<String, dynamic> toJson() => _$SoilToJson(this);
}

@JsonSerializable()
class Water {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ph")
  dynamic ph;
  @JsonKey(name: "temprature")
  dynamic temprature;
  @JsonKey(name: "salinity")
  dynamic salinity;
  @JsonKey(name: "co3")
  dynamic co3;
  @JsonKey(name: "hco3")
  dynamic hco3;
  @JsonKey(name: "totalAlkanility")
  dynamic totalAlkanility;
  @JsonKey(name: "totalHardness")
  dynamic totalHardness;
  @JsonKey(name: "ca")
  dynamic ca;
  @JsonKey(name: "mg")
  dynamic mg;
  @JsonKey(name: "k")
  dynamic k;
  @JsonKey(name: "fe")
  dynamic fe;
  @JsonKey(name: "na")
  dynamic na;
  @JsonKey(name: "cl2")
  dynamic cl2;
  @JsonKey(name: "tan")
  dynamic tan;
  @JsonKey(name: "nh3")
  dynamic nh3;
  @JsonKey(name: "no2")
  dynamic no2;
  @JsonKey(name: "h2s")
  dynamic h2S;
  @JsonKey(name: "co2")
  dynamic co2;
  @JsonKey(name: "dissolvedOxygen")
  dynamic dissolvedOxygen;
  @JsonKey(name: "electricalConductivity")
  dynamic electricalConductivity;
  @JsonKey(name: "totalDissolvedSolids")
  dynamic totalDissolvedSolids;
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

  Water({
    this.id,
    this.ph,
    this.temprature,
    this.salinity,
    this.co3,
    this.hco3,
    this.totalAlkanility,
    this.totalHardness,
    this.ca,
    this.mg,
    this.k,
    this.fe,
    this.na,
    this.cl2,
    this.tan,
    this.nh3,
    this.no2,
    this.h2S,
    this.co2,
    this.dissolvedOxygen,
    this.electricalConductivity,
    this.totalDissolvedSolids,
    this.suggestion,
    this.testId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Water.fromJson(Map<String, dynamic> json) => _$WaterFromJson(json);

  Map<String, dynamic> toJson() => _$WaterToJson(this);
}
