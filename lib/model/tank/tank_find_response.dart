// To parse this JSON data, do
//
//     final tankFindResponse = tankFindResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tank_find_response.g.dart';

TankFindResponse tankFindResponseFromJson(String str) => TankFindResponse.fromJson(json.decode(str));

String tankFindResponseToJson(TankFindResponse data) => json.encode(data.toJson());

@JsonSerializable()
class TankFindResponse {
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "RESPONSE")
    String response;
    @JsonKey(name: "statusCode")
    int statusCode;
    @JsonKey(name: "result")
    Result result;

    TankFindResponse({
        required this.message,
        required this.response,
        required this.statusCode,
        required this.result,
    });

    factory TankFindResponse.fromJson(Map<String, dynamic> json) => _$TankFindResponseFromJson(json);

    Map<String, dynamic> toJson() => _$TankFindResponseToJson(this);
}

@JsonSerializable()
class Result {
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

    Result({
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
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
