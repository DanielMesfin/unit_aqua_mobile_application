// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterTestFormResponse _$WaterTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    WaterTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaterTestFormResponseToJson(
        WaterTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      ph: (json['ph'] as num).toDouble(),
      temprature: (json['temprature'] as num).toInt(),
      salinity: (json['salinity'] as num?)?.toInt(),
      co3: (json['co3'] as num?)?.toInt(),
      hco3: (json['hco3'] as num?)?.toInt(),
      totalAlkanility: (json['totalAlkanility'] as num).toDouble(),
      totalHardness: (json['totalHardness'] as num).toDouble(),
      ca: (json['ca'] as num?)?.toDouble(),
      mg: (json['mg'] as num?)?.toDouble(),
      k: (json['k'] as num?)?.toDouble(),
      fe: (json['fe'] as num?)?.toDouble(),
      na: (json['na'] as num?)?.toDouble(),
      cl2: (json['cl2'] as num?)?.toDouble(),
      tan: (json['tan'] as num).toDouble(),
      nh3: (json['nh3'] as num).toInt(),
      no2: (json['no2'] as num).toInt(),
      h2S: (json['h2s'] as num).toDouble(),
      co2: (json['co2'] as num?)?.toDouble(),
      dissolvedOxygen: (json['dissolvedOxygen'] as num).toDouble(),
      electricalConductivity: (json['electricalConductivity'] as num?)?.toInt(),
      totalDissolvedSolids: (json['totalDissolvedSolids'] as num).toInt(),
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'ph': instance.ph,
      'temprature': instance.temprature,
      'salinity': instance.salinity,
      'co3': instance.co3,
      'hco3': instance.hco3,
      'totalAlkanility': instance.totalAlkanility,
      'totalHardness': instance.totalHardness,
      'ca': instance.ca,
      'mg': instance.mg,
      'k': instance.k,
      'fe': instance.fe,
      'na': instance.na,
      'cl2': instance.cl2,
      'tan': instance.tan,
      'nh3': instance.nh3,
      'no2': instance.no2,
      'h2s': instance.h2S,
      'co2': instance.co2,
      'dissolvedOxygen': instance.dissolvedOxygen,
      'electricalConductivity': instance.electricalConductivity,
      'totalDissolvedSolids': instance.totalDissolvedSolids,
      'tankId': instance.tankId,
      'testId': instance.testId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
