// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_farmer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentFarmerModel _$TreatmentFarmerModelFromJson(
        Map<String, dynamic> json) =>
    TreatmentFarmerModel(
      id: (json['id'] as num?)?.toInt(),
      treatmentId: (json['treatmentId'] as num?)?.toInt(),
      nameOne: json['nameOne'] as String?,
      tankOne: json['tankOne'] as String?,
      phoneOne: json['phoneOne'] as String?,
      nameTwo: json['nameTwo'] as String?,
      tankTwo: json['tankTwo'] as String?,
      phoneTwo: json['phoneTwo'] as String?,
      nameThree: json['nameThree'] as String?,
      tankThree: json['tankThree'] as String?,
      phoneThree: json['phoneThree'] as String?,
    );

Map<String, dynamic> _$TreatmentFarmerModelToJson(
        TreatmentFarmerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'treatmentId': instance.treatmentId,
      'nameOne': instance.nameOne,
      'tankOne': instance.tankOne,
      'phoneOne': instance.phoneOne,
      'nameTwo': instance.nameTwo,
      'tankTwo': instance.tankTwo,
      'phoneTwo': instance.phoneTwo,
      'nameThree': instance.nameThree,
      'tankThree': instance.tankThree,
      'phoneThree': instance.phoneThree,
    };
