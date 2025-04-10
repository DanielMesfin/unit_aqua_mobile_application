// To parse this JSON data, do
//
//     final completedList = completedListFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'completed_list.g.dart';

CompletedList completedListFromJson(String str) =>
    CompletedList.fromJson(json.decode(str));

String completedListToJson(CompletedList data) => json.encode(data.toJson());

@JsonSerializable()
class CompletedList {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  Result? result;

  CompletedList({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory CompletedList.fromJson(Map<String, dynamic> json) =>
      _$CompletedListFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedListToJson(this);
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
  List<Pcr>? pcr;
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
  });

  factory Culture.fromJson(Map<String, dynamic> json) =>
      _$CultureFromJson(json);

  Map<String, dynamic> toJson() => _$CultureToJson(this);
  Map<String, dynamic> toMap() {
    return {
      "yellowColonies": yellowColonies,
      "greenColonies": greenColonies,
      "suggestion": suggestion ?? "",

      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
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
  Map<String, dynamic> toMap() {
    return {
      "fat": fat,
      "protein": protein,
      "moisture": moisture,
      "ash": ash,
      "fiber": fiber,
      "status": status,
      "suggestion": suggestion ?? "",

      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
    };
  }
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
  @JsonKey(name: "redMouth")
  String? redMouth;
  @JsonKey(name: "bactirialGillRoot")
  String? bactirialGillRoot;
  @JsonKey(name: "eggORRoleInfection")
  String? eggORRoleInfection;
  @JsonKey(name: "ichthyophthirius")
  String? ichthyophthirius;
  @JsonKey(name: "fungalInfection")
  String? fungalInfection;
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
    this.redMouth,
    this.bactirialGillRoot,
    this.eggORRoleInfection,
    this.ichthyophthirius,
    this.fungalInfection,
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

  Map<String, dynamic> toMap() {
    return {
      "fishDetails": fishDetails,
      "bodyColour": bodyColour,
      "bodyTexture": bodyTexture,
      "mucus": mucus,
      "eyes": eyes,
      "finsColour": finsColour,
      "gills": gills,
      "intestines": intestines,
      "internalBloodLumps": internalBloodLumps,
      "liver": liver,
      "gut": gut,
      "gallBladder": gallBladder,
      "redDisease": redDisease,
      "ulcerativeDropsy": ulcerativeDropsy,
      "abdominalDropsy": abdominalDropsy,
      "bodyColumnaris": bodyColumnaris,
      "gillColumnaris": gillColumnaris,
      "epizooticUlcerativeSyndrome": epizooticUlcerativeSyndrome,
      "dactylogyrus": dactylogyrus,
      "gyrodactylus": gyrodactylus,
      "trichodina": trichodina,
      "myxobolus": myxobolus,
      "anchorWormOrLernaea": anchorWormOrLernaea,
      "argulus": argulus,
      "finRotOrTailrot": finRotOrTailrot,
      "hemorrhagicSepticemia": hemorrhagicSepticemia,
      "redMouth": redMouth,
      "bactirialGillRoot": bactirialGillRoot,
      "eggORRoleInfection": eggORRoleInfection,
      "ichthyophthirius": ichthyophthirius,
      "fungalInfection": fungalInfection,
      "diagnosedProblemAndDisease": diagnosedProblemAndDisease,
      "suggestion": suggestion ?? "",
    };
  }
}

@JsonSerializable()
class Pcr {
  @JsonKey(name: "id")
  int? id;
  // @JsonKey(name: "pcr")
  // String? pcr;
  @JsonKey(name: "whiteSpotResult")
  String? whiteSpotResult;
  @JsonKey(name: "enterocytozoonResult")
  String? enterocytozoonResult;
  @JsonKey(name: "ihhnvResult")
  String? ihhnvResult;
  @JsonKey(name: "emsResult")
  String? emsResult;
  @JsonKey(name: "imnvResult")
  String? imnvResult;
  @JsonKey(name: "vHarveyResult")
  String? vHarveyResult;
  @JsonKey(name: "vParahaemolyticusResult")
  String? vParahaemolyticusResult;
  @JsonKey(name: "whiteSpotCtValue")
  double? whiteSpotCtValue;
  @JsonKey(name: "enterocytozoonCtValue")
  double? enterocytozoonCtValue;
  @JsonKey(name: "ihhnvCtValue")
  double? ihhnvCtValue;
  @JsonKey(name: "emsCtValue")
  double? emsCtValue;
  @JsonKey(name: "imnvCtValue")
  double? imnvCtValue;
  @JsonKey(name: "vHarveyCtValue")
  double? vHarveyCtValue;
  @JsonKey(name: "vParahaemolyticusCtValue")
  double? vParahaemolyticusCtValue;
  @JsonKey(name: "remarkText")
  String? remarkText;
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

  Pcr({
    this.id,
    // this.pcr,
    this.whiteSpotResult,
    this.enterocytozoonResult,
    this.ihhnvResult,
    this.emsResult,
    this.imnvResult,
    this.vHarveyResult,
    this.vParahaemolyticusResult,
    this.whiteSpotCtValue,
    this.enterocytozoonCtValue,
    this.ihhnvCtValue,
    this.emsCtValue,
    this.imnvCtValue,
    this.vHarveyCtValue,
    this.vParahaemolyticusCtValue,
    this.remarkText,
    this.testId,
    this.suggestion,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Pcr.fromJson(Map<String, dynamic> json) => _$PcrFromJson(json);

  Map<String, dynamic> toJson() => _$PcrToJson(this);
  Map<String, dynamic> toMap() {
    String formatNumber(double number) {
      // Convert the number to a string
      String numberStr = number.toString();

      // Check if the number contains a decimal point
      if (numberStr.contains('.')) {
        // Remove trailing zeros after the decimal point
        numberStr = numberStr.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
      }

      return numberStr;
    }

    return {
      // "pcr": pcr,
      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
      // 'id': id,
      'whiteSpotResult': whiteSpotResult,
      'enterocytozoonResult': enterocytozoonResult,
      'ihhnvResult': ihhnvResult,
      'emsResult': emsResult,
      'imnvResult': imnvResult,
      'vHarveyResult': vHarveyResult,
      'vParahaemolyticusResult': vParahaemolyticusResult,
      'whiteSpotCtValue':
          formatNumber(double.parse(whiteSpotCtValue.toString())),
      'enterocytozoonCtValue':
          formatNumber(double.parse(enterocytozoonCtValue.toString())),
      'ihhnvCtValue': formatNumber(double.parse(ihhnvCtValue.toString())),
      'emsCtValue': formatNumber(double.parse(emsCtValue.toString())),
      'vHarveyCtValue': formatNumber(double.parse(vHarveyCtValue.toString())),
      'vParahaemolyticusCtValue':
          formatNumber(double.parse(vParahaemolyticusCtValue.toString())),
      'imnvCtValue': formatNumber(double.parse(imnvCtValue.toString())),
      'remarkText': remarkText,
      "suggestion": suggestion ?? "",

      // 'testId': testId,
      // 'suggestion': suggestion,
    };
  }
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

  Shrimp({
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
    // new add /

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

  Map<String, dynamic> toMap() => {
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
        'specificDiseaseAeromonasInfections':
            specificDiseaseAeromonasInfections,
        'specificDiseaseEHP': specificDiseaseEhp,
        'specificDiseaseFungiAndBacteria': specificDiseaseFungiAndBacteria,
        'externalBodyCramps': externalBodyCramps ?? "Yes",
        'externalTailRoot': externalTailRoot ?? "Yes",
        'externalVibrio': externalVibrio ?? "No",
        'gillsBlackGills': gillsBlackGills ?? "Yes",
        'gillsBrownGills': gillsBrownGills ?? "No",
        'hepatopancreasShrinked': hepatopancreasShrinked ?? "Yes",
        'intestineFluids': intestineFluids ?? "Yes",
        'intestineWhiteGut': intestineWhiteGut ?? "No",
        'intestineWhiteFecus': intestineWhiteFecus ?? "Yes",
        'muscleTissueWhiteMuscle': muscleTissueWhiteMuscle ?? "Yes",
        'diagnosedProblemAndDisease': diagnosedProblemAndDisease,
        'suggestion': suggestion ?? "",
      };
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
  Map<String, dynamic> toMap() {
    return {
      "soilType": soilType,
      "soilNature": soilNature,
      "soilPh": soilPh,
      "organicCarbon": organicCarbon,
      "availableNitrogen": availableNitrogen,
      "prosperous": prosperous,
      "potash": potash,
      "sulphur": sulphur,
      "zinc": zinc,
      "iron": iron,
      "boran": boran,
      "limeTest": limeTest,
      "observationType": observationType,
      "observation": observation,
      "suggestion": suggestion ?? "",

      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
    };
  }
}

@JsonSerializable()
class Water {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ph")
  double? ph;
  @JsonKey(name: "temprature")
  double? temprature;
  @JsonKey(name: "salinity")
  double? salinity;
  @JsonKey(name: "co3")
  double? co3;
  @JsonKey(name: "hco3")
  double? hco3;
  @JsonKey(name: "totalAlkanility")
  double? totalAlkanility;
  @JsonKey(name: "totalHardness")
  double? totalHardness;
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
  double? tan;
  @JsonKey(name: "nh3")
  double? nh3;
  @JsonKey(name: "no2")
  double? no2;
  @JsonKey(name: "h2s")
  double? h2S;
  @JsonKey(name: "co2")
  double? co2;
  @JsonKey(name: "dissolvedOxygen")
  double? dissolvedOxygen;
  @JsonKey(name: "electricalConductivity")
  double? electricalConductivity;
  @JsonKey(name: "totalDissolvedSolids")
  double? totalDissolvedSolids;
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
  Map<String, dynamic> toMap() {
    String formatNumber(double number) {
      // Convert the number to a string
      String numberStr = number.toString();

      // Check if the number contains a decimal point
      if (numberStr.contains('.')) {
        // Remove trailing zeros after the decimal point
        numberStr = numberStr.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
      }

      return numberStr;
    }

    return {
      "ph": formatNumber(ph!) ?? "",
      "temprature": formatNumber(temprature!) ?? "",
      "salinity": formatNumber(salinity!) ?? "",
      "co3": formatNumber(co3!) ?? "",
      "hco3": formatNumber(hco3!) ?? "",
      "totalAlkanility": formatNumber(totalAlkanility!) ?? "",
      "totalHardness": formatNumber(totalHardness!) ?? "",
      "ca": formatNumber(ca!) ?? "",
      "mg": formatNumber(mg!) ?? "",
      "k": formatNumber(k!) ?? "",
      "fe": formatNumber(fe!) ?? "",
      "na": formatNumber(na!) ?? "",
      "cl2": formatNumber(cl2!) ?? "",
      "tan": formatNumber(tan!) ?? "",
      "nh3": formatNumber(nh3!) ?? "",
      "no2": formatNumber(no2!) ?? "",
      "h2S": formatNumber(h2S!) ?? "",
      "co2": formatNumber(co2!) ?? "",
      "dissolvedOxygen": formatNumber(dissolvedOxygen!) ?? "",
      "electricalConductivity": formatNumber(electricalConductivity!) ?? "",
      "totalDissolvedSolids": formatNumber(totalDissolvedSolids!) ?? "",
      "suggestion": suggestion ?? "",
    };
  }
}
