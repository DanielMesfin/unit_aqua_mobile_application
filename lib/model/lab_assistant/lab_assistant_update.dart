// To parse this JSON data, do
//
//     final labAssistantUpdate = labAssistantUpdateFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lab_assistant_update.g.dart';

LabAssistantUpdate labAssistantUpdateFromJson(String str) =>
    LabAssistantUpdate.fromJson(json.decode(str));

String labAssistantUpdateToJson(LabAssistantUpdate data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LabAssistantUpdate {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "pin")
  int? pin;
  @JsonKey(name: "qualification")
  String? qualification;
  @JsonKey(name: "status")
  String? status;

  LabAssistantUpdate({
    required this.name,
    required this.phoneNumber,
    required this.pin,
    required this.qualification,
    required this.status,
  });

  factory LabAssistantUpdate.fromJson(Map<String, dynamic> json) =>
      _$LabAssistantUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$LabAssistantUpdateToJson(this);
}
