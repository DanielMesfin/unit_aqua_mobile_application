// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemModel _$ProblemModelFromJson(Map<String, dynamic> json) => ProblemModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      sectorId: (json['sectorId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProblemModelToJson(ProblemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sectorId': instance.sectorId,
      'name': instance.name,
    };
