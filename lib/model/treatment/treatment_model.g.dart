// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentModel _$TreatmentModelFromJson(Map<String, dynamic> json) =>
    TreatmentModel(
      id: (json['id'] as num?)?.toInt(),
      problemId: json['problemId'] is String
          ? int.tryParse(json['problemId'])
          : (json['problemId'] as num?)?.toInt(),
      name: json['name'] as String?,
      importCount: json['importCount'] is String
          ? int.tryParse(json['importCount'])
          : (json['importCount'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageUrl1: json['imageUrl1'] as String?,
      imageUrl2: json['imageUrl2'] as String?,
      imageUrl3: json['imageUrl3'] as String?,
      problem: json['problem'] == null
          ? null
          : ProblemModel.fromJson(json['problem'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TreatmentModelToJson(TreatmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'problemId': instance.problemId,
      'name': instance.name,
      'description': instance.description,
      'importCount': instance.importCount,
      'imageUrl1': instance.imageUrl1,
      'imageUrl2': instance.imageUrl2,
      'imageUrl3': instance.imageUrl3,
      'problem': instance.problem,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
