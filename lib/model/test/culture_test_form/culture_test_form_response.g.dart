// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CultureTestFormResponse _$CultureTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    CultureTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CultureTestFormResponseToJson(
        CultureTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      yellowColonies: (json['yellowColonies'] as num).toInt(),
      greenColonies: (json['greenColonies'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      tankId: (json['tankId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'yellowColonies': instance.yellowColonies,
      'greenColonies': instance.greenColonies,
      'testId': instance.testId,
      'tankId': instance.tankId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
