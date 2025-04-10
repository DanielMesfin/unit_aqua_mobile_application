// To parse this JSON data, do
//
//     final labAssistantModel = labAssistantModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lab_assistant_model.g.dart';

LabAssistantModel labAssistantModelFromJson(String str) =>
    LabAssistantModel.fromJson(json.decode(str));

String labAssistantModelToJson(LabAssistantModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LabAssistantModel {
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

  LabAssistantModel({
    required this.name,
    required this.phoneNumber,
    required this.pin,
    required this.qualification,
    required this.labName,
    required this.userId,
  });

  factory LabAssistantModel.fromJson(Map<String, dynamic> json) =>
      _$LabAssistantModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabAssistantModelToJson(this);
}
