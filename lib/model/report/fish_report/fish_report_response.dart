// To parse this JSON data, do
//
//     final fishReportResponse = fishReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'fish_report_response.g.dart';

FishReportResponse fishReportResponseFromJson(String str) =>
    FishReportResponse.fromJson(json.decode(str));

String fishReportResponseToJson(FishReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FishReportResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  List<Result> result;

  FishReportResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory FishReportResponse.fromJson(Map<String, dynamic> json) =>
      _$FishReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FishReportResponseToJson(this);
}

@JsonSerializable()
class Result {
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
  String diagnosedProblemAndDisease;
  @JsonKey(name: "testId")
  int testId;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "tankId")
  int tankId;
  @JsonKey(name: "alltest")
  Alltest? alltest;
  @JsonKey(name: "tank")
  Tank tank;
  @JsonKey(name: "suggestion")
  String suggestion;
  Result({
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
    this.redMouth,
    this.bactirialGillRoot,
    this.eggORRoleInfection,
    this.ichthyophthirius,
    this.fungalInfection,
    required this.diagnosedProblemAndDisease,
    required this.testId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.tankId,
    required this.alltest,
    required this.tank,
    required this.suggestion,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

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
      "suggestion": suggestion,
    };
  }
}

@JsonSerializable()
class Alltest {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "depth")
  String depth;
  @JsonKey(name: "biomass")
  String biomass;
  @JsonKey(name: "weight")
  String weight;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "tankId")
  int tankId;

  Alltest({
    required this.id,
    required this.type,
    required this.depth,
    required this.biomass,
    required this.weight,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.tankId,
  });

  factory Alltest.fromJson(Map<String, dynamic> json) =>
      _$AlltestFromJson(json);

  Map<String, dynamic> toJson() => _$AlltestToJson(this);
}

@JsonSerializable()
class Tank {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "uuid")
  String uuid;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "area")
  String area;
  @JsonKey(name: "size")
  String size;
  @JsonKey(name: "cultureType")
  String cultureType;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "farmerId")
  int farmerId;
  @JsonKey(name: "farmer")
  Farmer farmer;

  Tank({
    required this.id,
    required this.uuid,
    required this.name,
    required this.area,
    required this.size,
    required this.cultureType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.farmerId,
    required this.farmer,
  });

  factory Tank.fromJson(Map<String, dynamic> json) => _$TankFromJson(json);

  Map<String, dynamic> toJson() => _$TankToJson(this);
}

@JsonSerializable()
class Farmer {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "uuid")
  String uuid;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "district")
  String district;
  @JsonKey(name: "area")
  String area;
  @JsonKey(name: "cultureType")
  String cultureType;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "user")
  User user;

  Farmer({
    required this.id,
    required this.uuid,
    required this.name,
    required this.phoneNumber,
    required this.state,
    required this.district,
    required this.area,
    required this.cultureType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "uuid")
  String uuid;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "pin")
  int pin;
  @JsonKey(name: "qualification")
  String qualification;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "district")
  String district;
  @JsonKey(name: "area")
  String area;
  @JsonKey(name: "labName")
  String labName;
  @JsonKey(name: "labImage")
  String labImage;
  @JsonKey(name: "labLogo")
  String labLogo;
  @JsonKey(name: "labReportImage")
  String labReportImage;
  @JsonKey(name: "labReport")
  String labReport;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "approvedBy")
  dynamic approvedBy;
  @JsonKey(name: "approvedDate")
  dynamic approvedDate;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;

  User({
    required this.id,
    required this.uuid,
    required this.name,
    required this.phoneNumber,
    required this.pin,
    required this.qualification,
    required this.state,
    required this.district,
    required this.area,
    required this.labName,
    required this.labImage,
    required this.labLogo,
    required this.labReportImage,
    required this.labReport,
    required this.role,
    required this.status,
    required this.approvedBy,
    required this.approvedDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
