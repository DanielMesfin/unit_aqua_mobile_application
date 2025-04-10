// To parse this JSON data, do
//
//     final waterReportResponse = waterReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'water_report_response_old.g.dart';

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
  String ph;
  @JsonKey(name: "temprature")
  String? temprature;
  @JsonKey(name: "salinity")
  dynamic salinity;
  @JsonKey(name: "co3")
  String co3;
  @JsonKey(name: "hco3")
  String hco3;
  @JsonKey(name: "totalAlkanility")
  dynamic totalAlkanility;
  @JsonKey(name: "totalHardness")
  String totalHardness;
  @JsonKey(name: "ca")
  String ca;
  @JsonKey(name: "mg")
  String mg;
  @JsonKey(name: "k")
  String k;
  @JsonKey(name: "fe")
  String fe;
  @JsonKey(name: "na")
  String na;
  @JsonKey(name: "cl2")
  String? cl2;
  @JsonKey(name: "tan")
  String? tan;
  @JsonKey(name: "nh3")
  String? nh3;
  @JsonKey(name: "no2")
  String? no2;
  @JsonKey(name: "h2s")
  String? h2S;
  @JsonKey(name: "co2")
  String co2;
  @JsonKey(name: "dissolvedOxygen")
  String dissolvedOxygen;
  @JsonKey(name: "electricalConductivity")
  String? electricalConductivity;
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
  @JsonKey(name: "tank")
  Tank tank;
  

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
    required this.testId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.tankId,
    required this.tank,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "ph")
  String? ph;
  @JsonKey(name: "temprature")
  String? temprature;
  @JsonKey(name: "co3")
  String? co3;
  @JsonKey(name: "hco3")
  String? hco3;
  @JsonKey(name: "totalHardness")
  String? totalHardness;
  @JsonKey(name: "ca")
  String? ca;
  @JsonKey(name: "mg")
  String mg;
  @JsonKey(name: "k")
  String? k;
  @JsonKey(name: "fe")
  String? fe;
  @JsonKey(name: "na")
  String na;
  @JsonKey(name: "dissolvedOxygen")
  String? dissolvedOxygen;
  @JsonKey(name: "cl2")
  String? cl2;
  @JsonKey(name: "h2s")
  String? h2S;

  Status({
    this.ph,
    this.temprature,
    this.co3,
    this.hco3,
    this.totalHardness,
    this.ca,
    required this.mg,
    this.k,
    this.fe,
    required this.na,
    this.dissolvedOxygen,
    this.cl2,
    this.h2S,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "ph": ph ?? "",
      "temprature": temprature ?? "",
      "co3": co3 ?? "",
      "hco3": hco3 ?? "",
      "totalHardness": totalHardness ?? "",
      "ca": ca ?? "",
      "mg": mg ?? "",
      "k": k ?? "",
      "fe": fe ?? "",
      "na": na ?? "",
      "dissolvedOxygen": dissolvedOxygen ?? "",
    };
  }
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
