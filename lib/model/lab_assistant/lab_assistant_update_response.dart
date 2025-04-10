// To parse this JSON data, do
//
//     final labAssistantUpdateResponse = labAssistantUpdateResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lab_assistant_update_response.g.dart';

LabAssistantUpdateResponse labAssistantUpdateResponseFromJson(String str) => LabAssistantUpdateResponse.fromJson(json.decode(str));

String labAssistantUpdateResponseToJson(LabAssistantUpdateResponse data) => json.encode(data.toJson());

@JsonSerializable()
class LabAssistantUpdateResponse {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "RESPONSE")
    String response;
    @JsonKey(name: "statusCode")
    int statusCode;
    @JsonKey(name: "result")
    int result;

    LabAssistantUpdateResponse({
        required this.message,
        required this.response,
        required this.statusCode,
        required this.result,
    });

    factory LabAssistantUpdateResponse.fromJson(Map<String, dynamic> json) => _$LabAssistantUpdateResponseFromJson(json);

    Map<String, dynamic> toJson() => _$LabAssistantUpdateResponseToJson(this);
}
