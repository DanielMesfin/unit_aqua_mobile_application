// To parse this JSON data, do
//
//     final soilReportResponse = soilReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'soil_report_response.g.dart';

SoilReportResponse soilReportResponseFromJson(String str) =>
    SoilReportResponse.fromJson(json.decode(str));

String soilReportResponseToJson(SoilReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SoilReportResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  List<Result> result;

  SoilReportResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory SoilReportResponse.fromJson(Map<String, dynamic> json) =>
      _$SoilReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoilReportResponseToJson(this);
}

@JsonSerializable()
class Result {
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
  @JsonKey(name: "observationType")
  String observationType;
  @JsonKey(name: "observation")
  String observation;
  @JsonKey(name: "suggestion")
  String suggestion;
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
  Alltest alltest;
  @JsonKey(name: "tank")
  Tank tank;

  Result({
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
    required this.observationType,
    required this.observation,
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
      "suggestion": suggestion,
      // "status": status,
      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
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
