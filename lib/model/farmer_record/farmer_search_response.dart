// To parse this JSON data, do
//
//     final farmerSearchResponse = farmerSearchResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'farmer_search_response.g.dart';

FarmerSearchResponse farmerSearchResponseFromJson(String str) =>
    FarmerSearchResponse.fromJson(json.decode(str));

String farmerSearchResponseToJson(FarmerSearchResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FarmerSearchResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  Result? result;

  FarmerSearchResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory FarmerSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$FarmerSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerSearchResponseToJson(this);
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
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
