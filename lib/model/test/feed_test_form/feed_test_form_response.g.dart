// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_test_form_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedTestFormResponse _$FeedTestFormResponseFromJson(
        Map<String, dynamic> json) =>
    FeedTestFormResponse(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedTestFormResponseToJson(
        FeedTestFormResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      fat: (json['fat'] as num).toDouble(),
      protein: (json['protein'] as num).toInt(),
      moisture: (json['moisture'] as num).toDouble(),
      ash: (json['ash'] as num).toInt(),
      fiber: (json['fiber'] as num).toDouble(),
      tankId: (json['tankId'] as num).toInt(),
      testId: (json['testId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'fat': instance.fat,
      'protein': instance.protein,
      'moisture': instance.moisture,
      'ash': instance.ash,
      'fiber': instance.fiber,
      'tankId': instance.tankId,
      'testId': instance.testId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
