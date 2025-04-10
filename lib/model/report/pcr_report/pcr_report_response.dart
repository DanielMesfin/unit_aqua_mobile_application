// To parse this JSON data, do
//
//     final pcrReportResponse = pcrReportResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'pcr_report_response.g.dart';

PcrReportResponse pcrReportResponseFromJson(String str) =>
    PcrReportResponse.fromJson(json.decode(str));

String pcrReportResponseToJson(PcrReportResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PcrReportResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  @JsonKey(name: "statusCode")
  int? statusCode;
  @JsonKey(name: "result")
  List<Result>? result;

  PcrReportResponse({
    this.message,
    this.response,
    this.statusCode,
    this.result,
  });

  factory PcrReportResponse.fromJson(Map<String, dynamic> json) =>
      _$PcrReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PcrReportResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "whiteSpotResult")
  String? whiteSpotResult;
  @JsonKey(name: "enterocytozoonResult")
  String? enterocytozoonResult;
  @JsonKey(name: "ihhnvResult")
  String? ihhnvResult;
  @JsonKey(name: "emsResult")
  String? emsResult;
  @JsonKey(name: "imnvResult")
  String? imnvResult;
  @JsonKey(name: "vHarveyResult")
  String? vHarveyResult;
  @JsonKey(name: "vParahaemolyticusResult")
  String? vParahaemolyticusResult;
  @JsonKey(name: "whiteSpotCtValue")
  double? whiteSpotCtValue;
  @JsonKey(name: "enterocytozoonCtValue")
  double? enterocytozoonCtValue;
  @JsonKey(name: "ihhnvCtValue")
  double? ihhnvCtValue;
  @JsonKey(name: "emsCtValue")
  double? emsCtValue;
  @JsonKey(name: "imnvCtValue")
  double? imnvCtValue;
  @JsonKey(name: "vHarveyCtValue")
  double? vHarveyCtValue;
  @JsonKey(name: "vParahaemolyticusCtValue")
  double? vParahaemolyticusCtValue;
  @JsonKey(name: "remarkText")
  String? remarkText;
  @JsonKey(name: "testId")
  int? testId;
  @JsonKey(name: "suggestion")
  String? suggestion;
  @JsonKey(name: "status")
  Status? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "tankId")
  int? tankId;
  @JsonKey(name: "alltest")
  Alltest? alltest;
  @JsonKey(name: "tank")
  Tank? tank;

  Result({
    this.id,
    this.testId,
    this.whiteSpotResult,
    this.enterocytozoonResult,
    this.ihhnvResult,
    this.emsResult,
    this.imnvResult,
    this.vHarveyResult,
    this.vParahaemolyticusResult,
    this.whiteSpotCtValue,
    this.enterocytozoonCtValue,
    this.ihhnvCtValue,
    this.emsCtValue,
    this.imnvCtValue,
    this.vHarveyCtValue,
    this.vParahaemolyticusCtValue,
    this.remarkText,
    this.suggestion,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
    this.alltest,
    this.tank,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Map<String, dynamic> toMap() {
    String formatNumber(double number) {
      // Convert the number to a string
      String numberStr = number.toString();

      // Check if the number contains a decimal point
      if (numberStr.contains('.')) {
        // Remove trailing zeros after the decimal point
        numberStr = numberStr.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '');
      }

      return numberStr;
    }

    return {
      "whiteSpotResult": whiteSpotResult,
      "enterocytozoonResult": enterocytozoonResult,
      "ihhnvResult": ihhnvResult,
      "emsResult": emsResult,
      "imnvResult:": imnvResult,
      "vHarveyResult": vHarveyResult,
      "vParahaemolyticusResult": vParahaemolyticusResult,
      "whiteSpotCtValue": formatNumber(whiteSpotCtValue!),
      "enterocytozoonCtValue": formatNumber(enterocytozoonCtValue!),
      "ihhnvCtValue": formatNumber(ihhnvCtValue!),
      "emsCtValue": formatNumber(emsCtValue!),
      "imnvCtValue": formatNumber(imnvCtValue!),
      "vHarveyCtValue": formatNumber(vHarveyCtValue!),
      "vParahaemolyticusCtValue": formatNumber(vParahaemolyticusCtValue!),
      "remarkText": remarkText,
      "suggestion": suggestion,
      // "status": status,
      // "createdAt": createdAt,
      // "updatedAt": updatedAt,
    };
  }
}

@JsonSerializable()
class Alltest {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "depth")
  String? depth;
  @JsonKey(name: "biomass")
  String? biomass;
  @JsonKey(name: "weight")
  String? weight;
  @JsonKey(name: "planktonTest")
  String? planktonTest;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "tankId")
  int? tankId;

  Alltest({
    this.id,
    this.type,
    this.depth,
    this.biomass,
    this.weight,
    this.planktonTest,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.tankId,
  });

  factory Alltest.fromJson(Map<String, dynamic> json) =>
      _$AlltestFromJson(json);

  Map<String, dynamic> toJson() => _$AlltestToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "pcr")
  String? pcr;

  Status({
    this.pcr,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Tank {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "uuid")
  String? uuid;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "cultureType")
  String? cultureType;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "farmerId")
  int? farmerId;
  @JsonKey(name: "farmer")
  Farmer? farmer;

  Tank({
    this.id,
    this.uuid,
    this.name,
    this.area,
    this.size,
    this.cultureType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.farmerId,
    this.farmer,
  });

  factory Tank.fromJson(Map<String, dynamic> json) => _$TankFromJson(json);

  Map<String, dynamic> toJson() => _$TankToJson(this);
}

@JsonSerializable()
class Farmer {
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
  @JsonKey(name: "user")
  User? user;

  Farmer({
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
    this.user,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => _$FarmerFromJson(json);

  Map<String, dynamic> toJson() => _$FarmerToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "uuid")
  String? uuid;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "pin")
  int? pin;
  @JsonKey(name: "qualification")
  String? qualification;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "district")
  String? district;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "labName")
  String? labName;
  @JsonKey(name: "labImage")
  String? labImage;
  @JsonKey(name: "labLogo")
  String? labLogo;
  @JsonKey(name: "labReportImage")
  String? labReportImage;
  @JsonKey(name: "labReport")
  String? labReport;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "approvedBy")
  int? approvedBy;
  @JsonKey(name: "approvedDate")
  String? approvedDate;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  User({
    this.id,
    this.uuid,
    this.name,
    this.phoneNumber,
    this.pin,
    this.qualification,
    this.state,
    this.district,
    this.area,
    this.labName,
    this.labImage,
    this.labLogo,
    this.labReportImage,
    this.labReport,
    this.role,
    this.status,
    this.approvedBy,
    this.approvedDate,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
