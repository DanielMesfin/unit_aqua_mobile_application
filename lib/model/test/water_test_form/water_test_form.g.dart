// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_test_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterTestForm _$WaterTestFormFromJson(Map<String, dynamic> json) =>
    WaterTestForm(
      ph: (json['ph'] as num).toDouble(),
      temperature: (json['temperature'] as num).toInt(),
      co3: (json['co3'] as num).toInt(),
      hco3: (json['hco3'] as num).toInt(),
      totalAlkalinity: (json['totalAlkalinity'] as num).toDouble(),
      totalHardness: (json['totalHardness'] as num).toDouble(),
      ca: (json['ca'] as num).toDouble(),
      mg: (json['mg'] as num).toDouble(),
      k: (json['k'] as num).toDouble(),
      fe: (json['fe'] as num).toDouble(),
      na: (json['na'] as num).toDouble(),
      co2: (json['co2'] as num).toDouble(),
      dissolvedOxygen: (json['dissolvedOxygen'] as num).toDouble(),
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
    );

Map<String, dynamic> _$WaterTestFormToJson(WaterTestForm instance) =>
    <String, dynamic>{
      'ph': instance.ph,
      'temperature': instance.temperature,
      'co3': instance.co3,
      'hco3': instance.hco3,
      'totalAlkalinity': instance.totalAlkalinity,
      'totalHardness': instance.totalHardness,
      'ca': instance.ca,
      'mg': instance.mg,
      'k': instance.k,
      'fe': instance.fe,
      'na': instance.na,
      'co2': instance.co2,
      'dissolvedOxygen': instance.dissolvedOxygen,
      'tankId': instance.tankId,
      'testId': instance.testId,
    };
