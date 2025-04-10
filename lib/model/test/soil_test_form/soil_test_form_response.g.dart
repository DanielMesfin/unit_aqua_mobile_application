// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilTestFormResponse _$SoilTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    SoilTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SoilTestFormResponseToJson(
        SoilTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      soilType: json['soilType'] as String,
      soilNature: json['soilNature'] as String,
      soilPh: json['soilPh'] is String
          ? double.parse(json['soilPh'])
          : (json['soilPh'] as num).toDouble(),
      organicCarbon: json['organicCarbon'] as String,
      availableNitrogen: json['availableNitrogen'] as String,
      prosperous: json['prosperous'] as String,
      potash: json['potash'] is String
          ? double.parse(json['potash'])
          : (json['potash'] as num).toDouble(),
      sulphur: json['sulphur'] as String,
      zinc: json['zinc'] is String
          ? double.parse(json['zinc'])
          : (json['zinc'] as num).toDouble(),
      boran: json['boran'] is String
          ? double.parse(json['boran'])
          : (json['boran'] as num).toDouble(),
      iron: json['iron'] as String,
      limeTest: json['limeTest'] as String,
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'soilType': instance.soilType,
      'soilNature': instance.soilNature,
      'soilPh': instance.soilPh,
      'organicCarbon': instance.organicCarbon,
      'availableNitrogen': instance.availableNitrogen,
      'prosperous': instance.prosperous,
      'potash': instance.potash,
      'sulphur': instance.sulphur,
      'zinc': instance.zinc,
      'iron': instance.iron,
      'boran': instance.boran,
      'limeTest': instance.limeTest,
      'tankId': instance.tankId,
      'testId': instance.testId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
