// To parse this JSON data, do
//
//     final createTest = createTestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'create_test.g.dart';

CreateTest createTestFromJson(String str) =>
    CreateTest.fromJson(json.decode(str));

String createTestToJson(CreateTest data) => json.encode(data.toJson());

@JsonSerializable()
class CreateTest {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  CreateTest({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory CreateTest.fromJson(Map<String, dynamic> json) =>
      _$CreateTestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTestToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "type")
  String type;
  @JsonKey(name: "weight")
  dynamic weight;
  @JsonKey(name: "depth")
  double depth;
  @JsonKey(name: "biomass")
  double biomass;
  @JsonKey(name: "planktonTest")
  String? planktonTest;
  @JsonKey(name: "tankId")
  int tankId;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "createdAt")
  String createdAt;

  Result({
    required this.status,
    required this.id,
    required this.type,
    required this.weight,
    required this.depth,
    required this.biomass,
    required this.planktonTest,
    required this.tankId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
