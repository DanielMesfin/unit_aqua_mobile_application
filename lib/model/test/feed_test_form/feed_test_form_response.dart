// To parse this JSON data, do
//
//     final feedTestFormResponse = feedTestFormResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'feed_test_form_response.g.dart';

FeedTestFormResponse feedTestFormResponseFromJson(String str) =>
    FeedTestFormResponse.fromJson(json.decode(str));

String feedTestFormResponseToJson(FeedTestFormResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FeedTestFormResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "RESPONSE")
  String response;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "result")
  Result result;

  FeedTestFormResponse({
    required this.message,
    required this.response,
    required this.statusCode,
    required this.result,
  });

  factory FeedTestFormResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedTestFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedTestFormResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "fat")
  double fat;
  @JsonKey(name: "protein")
  int protein;
  @JsonKey(name: "moisture")
  double moisture;
  @JsonKey(name: "ash")
  int ash;
  @JsonKey(name: "fiber")
  double fiber;
  @JsonKey(name: "tankId")
  int tankId;
  @JsonKey(name: "testId")
  int testId;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "createdAt")
  String createdAt;

  Result({
    required this.status,
    required this.id,
    required this.fat,
    required this.protein,
    required this.moisture,
    required this.ash,
    required this.fiber,
    required this.tankId,
    required this.testId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
