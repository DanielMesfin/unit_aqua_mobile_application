// To parse this JSON data, do
//
//     final cultureReportResponse = cultureReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'culture_report_response.g.dart';

CultureReportResponse cultureReportResponseFromJson(String str) =>
    CultureReportResponse.fromJson(json.decode(str));

String cultureReportResponseToJson(CultureReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CultureReportResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  List<Result> result;

  CultureReportResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory CultureReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CultureReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CultureReportResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "yellowColonies")
  int yellowColonies;
  @JsonKey(name: "greenColonies")
  int greenColonies;
  @JsonKey(name: "suggestion")
  String suggestion;
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
  Alltest alltest;
  @JsonKey(name: "tank")
  Tank tank;

  Result({
    required this.id,
    required this.yellowColonies,
    required this.greenColonies,
    required this.testId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.tankId,
    required this.suggestion,
    required this.alltest,
    required this.tank,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "yellowColonies": yellowColonies,
      "greenColonies": greenColonies,
      "suggestion": suggestion,
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
class Status {
  @JsonKey(name: "greenColonies")
  int? greenColonies;
  @JsonKey(name: "yellowColonies")
  int? yellowColonies;

  Status({
    this.greenColonies,
    this.yellowColonies,
  });

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
