// To parse this JSON data, do
//
//     final labAssistantListResponse = labAssistantListResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lab_assistant_list_response.g.dart';

LabAssistantListResponse labAssistantListResponseFromJson(String str) =>
    LabAssistantListResponse.fromJson(json.decode(str));

String labAssistantListResponseToJson(LabAssistantListResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LabAssistantListResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  List<Result> result;

  LabAssistantListResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory LabAssistantListResponse.fromJson(Map<String, dynamic> json) =>
      _$LabAssistantListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LabAssistantListResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "uuid")
  String uuid;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "pin")
  String pin;
  @JsonKey(name: "qualification")
  String qualification;
  @JsonKey(name: "labName")
  String labName;
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

  Result({
    required this.id,
    required this.uuid,
    required this.name,
    required this.phoneNumber,
    required this.pin,
    required this.qualification,
    required this.labName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
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
