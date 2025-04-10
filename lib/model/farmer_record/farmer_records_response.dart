// To parse this JSON data, do
//
//     final farmerRecordsResponse = farmerRecordsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'farmer_records_response.g.dart';

FarmerRecordsResponse farmerRecordsResponseFromJson(String str) =>
    FarmerRecordsResponse.fromJson(json.decode(str));

String farmerRecordsResponseToJson(FarmerRecordsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FarmerRecordsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  List<Result>? result;

  FarmerRecordsResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory FarmerRecordsResponse.fromJson(Map<String, dynamic> json) =>
      _$FarmerRecordsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerRecordsResponseToJson(this);
}

@JsonSerializable()
class Result {
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

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
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
