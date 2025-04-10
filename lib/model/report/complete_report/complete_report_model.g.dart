// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteReportModel _$CompleteReportModelFromJson(Map<String, dynamic> json) =>
    CompleteReportModel(
      suggestion: json['suggestion'] as String?,
      testId: (json['testId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompleteReportModelToJson(
        CompleteReportModel instance) =>
    <String, dynamic>{
      'suggestion': instance.suggestion,
      'testId': instance.testId,
    };
