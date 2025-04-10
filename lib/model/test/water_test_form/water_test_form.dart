// To parse this JSON data, do
//
//     final waterTestForm = waterTestFormFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'water_test_form.g.dart';

WaterTestForm waterTestFormFromJson(String str) => WaterTestForm.fromJson(json.decode(str));

String waterTestFormToJson(WaterTestForm data) => json.encode(data.toJson());

@JsonSerializable()
class WaterTestForm {
    @JsonKey(name: "ph")
    double ph;
    @JsonKey(name: "temperature")
    int temperature;
    @JsonKey(name: "co3")
    int co3;
    @JsonKey(name: "hco3")
    int hco3;
    @JsonKey(name: "totalAlkalinity")
    double totalAlkalinity;
    @JsonKey(name: "totalHardness")
    double totalHardness;
    @JsonKey(name: "ca")
    double ca;
    @JsonKey(name: "mg")
    double mg;
    @JsonKey(name: "k")
    double k;
    @JsonKey(name: "fe")
    double fe;
    @JsonKey(name: "na")
    double na;
    @JsonKey(name: "co2")
    double co2;
    @JsonKey(name: "dissolvedOxygen")
    double dissolvedOxygen;
    @JsonKey(name: "tankId")
    int tankId;
    @JsonKey(name: "testId")
    int testId;

    WaterTestForm({
        required this.ph,
        required this.temperature,
        required this.co3,
        required this.hco3,
        required this.totalAlkalinity,
        required this.totalHardness,
        required this.ca,
        required this.mg,
        required this.k,
        required this.fe,
        required this.na,
        required this.co2,
        required this.dissolvedOxygen,
        required this.tankId,
        required this.testId,
    });

    factory WaterTestForm.fromJson(Map<String, dynamic> json) => _$WaterTestFormFromJson(json);

    Map<String, dynamic> toJson() => _$WaterTestFormToJson(this);
}
