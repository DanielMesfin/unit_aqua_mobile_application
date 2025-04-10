// To parse this JSON data, do
//
//     final waterReportResponse = waterReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'water_report_response.g.dart';

WaterReportResponse waterReportResponseFromJson(String str) =>
    WaterReportResponse.fromJson(json.decode(str));

String waterReportResponseToJson(WaterReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class WaterReportResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  List<Result> result;

  WaterReportResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory WaterReportResponse.fromJson(Map<String, dynamic> json) =>
      _$WaterReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WaterReportResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int id;
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
  @JsonKey(name: "testId")
  int testId;
  @JsonKey(name: "status")
  Status status;
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
      // "ph": ph ?? "",
      // "temprature": temprature ?? "",
      // "co3": co3 ?? "",
      // "hco3": hco3 ?? "",
      // "totalHardness": totalHardness ?? "",
      // "ca": ca ?? "",
      // "mg": mg ?? "",
      // "k": k ?? "",
      // "fe": fe ?? "",
      // "na": na ?? "",
      // "co2": co2 ?? "",
      // "dissolvedOxygen": dissolvedOxygen ?? "",

      "ph": ph ?? "",
      "temprature": temprature ?? "",
      "salinity": salinity ?? "",
      "co3": co3 ?? "",
      "hco3": hco3 ?? "",
      "totalAlkanility": totalAlkanility ?? "",
      "totalHardness": totalHardness ?? "",
      "ca": ca ?? "",
      "mg": mg ?? "",
      "k": k ?? "",
      "fe": fe ?? "",
      "na": na ?? "",
      "cl2": cl2 ?? "",
      "tan": tan ?? "",
      "nh3": nh3 ?? "",
      "no2": no2 ?? "",
      "h2S": h2S ?? "",
      "co2": co2 ?? "",
      "dissolvedOxygen": dissolvedOxygen ?? "",
      "electricalConductivity": electricalConductivity ?? "",
      "totalDissolvedSolids": totalDissolvedSolids ?? "",
      "suggestion": suggestion ?? "",
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
class Status {
  @JsonKey(name: "ph")
  dynamic ph;
  @JsonKey(name: "totalHardness")
  dynamic totalHardness;

  Status({
    this.ph,
    this.totalHardness,
  });

  Map<String, dynamic> toMap() {
    return {
      "ph": ph ?? "",
      "totalHardness": totalHardness ?? "",
    };
  }

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
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
