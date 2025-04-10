// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTest _$CreateTestFromJson(Map<String, dynamic> json) => CreateTest(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateTestToJson(CreateTest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'],
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      weight: json['weight'],
      // depth: (json['depth'] as num).toDouble(),
        // biomass: (json['biomass'] as num).toDouble(),
      depth: double.tryParse(json['depth'].toString()) ?? 0.0,
      biomass: double.tryParse(json['biomass'].toString()) ?? 0.0,
      planktonTest: json['planktonTest'] as String?,
      tankId: (json['tankId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'type': instance.type,
      'weight': instance.weight,
      'depth': instance.depth,
      'biomass': instance.biomass,
      'planktonTest': instance.planktonTest,
      'tankId': instance.tankId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
