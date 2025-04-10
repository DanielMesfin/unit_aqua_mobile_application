// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_treatment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTreatmentModel _$CreateTreatmentModelFromJson(
        Map<String, dynamic> json) =>
    CreateTreatmentModel(
      id: (json['id'] as num?)?.toInt(),
      problemId: (json['problemId'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateTreatmentModelToJson(
        CreateTreatmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'problemId': instance.problemId,
      'name': instance.name,
      'description': instance.description,
    };
