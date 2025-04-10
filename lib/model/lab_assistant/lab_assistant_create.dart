// To parse this JSON data, do
//
//     final labAssistantCreate = labAssistantCreateFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lab_assistant_create.g.dart';

LabAssistantCreate labAssistantCreateFromJson(String str) => LabAssistantCreate.fromJson(json.decode(str));

String labAssistantCreateToJson(LabAssistantCreate data) => json.encode(data.toJson());

@JsonSerializable()
class LabAssistantCreate {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "RESPONSE")
    String response;
    @JsonKey(name: "statusCode")
    int statusCode;
    @JsonKey(name: "result")
    Result result;

    LabAssistantCreate({
        required this.message,
        required this.response,
        required this.statusCode,
        required this.result,
    });

    factory LabAssistantCreate.fromJson(Map<String, dynamic> json) => _$LabAssistantCreateFromJson(json);

    Map<String, dynamic> toJson() => _$LabAssistantCreateToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "uuid")
    String uuid;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "id")
    int id;
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
    @JsonKey(name: "userId")
    int userId;
    @JsonKey(name: "updatedAt")
    String updatedAt;
    @JsonKey(name: "createdAt")
    String createdAt;

    Result({
        required this.uuid,
        required this.status,
        required this.id,
        required this.name,
        required this.phoneNumber,
        required this.pin,
        required this.qualification,
        required this.labName,
        required this.userId,
        required this.updatedAt,
        required this.createdAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
