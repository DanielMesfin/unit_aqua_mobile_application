// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pcr_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PcrTestFormResponse _$PcrTestFormResponseFromJson(Map<String, dynamic> json) =>
    PcrTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PcrTestFormResponseToJson(
        PcrTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      whiteSpotResult: json['whiteSpotResult'] as String,
      enterocytozoonResult: json['enterocytozoonResult'] as String,
      ihhnvResult: json['ihhnvResult'] as String,
      emsResult: json['emsResult'] as String,
      imnvResult: json['imnvResult'] as String,
      vHarveyResult: json['vHarveyResult'] as String,
      vParahaemolyticusResult: json['vParahaemolyticusResult'] as String,
      whiteSpotCtValue: (json['whiteSpotCtValue'] as num).toDouble(),
      enterocytozoonCtValue: (json['enterocytozoonCtValue'] as num).toDouble(),
      ihhnvCtValue: (json['ihhnvCtValue'] as num).toDouble(),
      emsCtValue: (json['emsCtValue'] as num).toDouble(),
      imnvCtValue: (json['imnvCtValue'] as num).toDouble(),
      vHarveyCtValue: (json['vHarveyCtValue'] as num).toDouble(),
      vParahaemolyticusCtValue:
          (json['vParahaemolyticusCtValue'] as num).toDouble(),
      remarkText: json['remarkText'] as String,
      testId: (json['testId'] as num).toInt(),
      tankId: (json['tankId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'whiteSpotResult': instance.whiteSpotResult,
      'enterocytozoonResult': instance.enterocytozoonResult,
      'ihhnvResult': instance.ihhnvResult,
      'emsResult': instance.emsResult,
      'imnvResult': instance.imnvResult,
      'vHarveyResult': instance.vHarveyResult,
      'vParahaemolyticusResult': instance.vParahaemolyticusResult,
      'whiteSpotCtValue': instance.whiteSpotCtValue,
      'enterocytozoonCtValue': instance.enterocytozoonCtValue,
      'ihhnvCtValue': instance.ihhnvCtValue,
      'emsCtValue': instance.emsCtValue,
      'imnvCtValue': instance.imnvCtValue,
      'vHarveyCtValue': instance.vHarveyCtValue,
      'vParahaemolyticusCtValue': instance.vParahaemolyticusCtValue,
      'remarkText': instance.remarkText,
      'testId': instance.testId,
      'tankId': instance.tankId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
