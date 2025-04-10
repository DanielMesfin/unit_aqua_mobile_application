// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_assistant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabAssistantModel _$LabAssistantModelFromJson(Map<String, dynamic> json) =>
    LabAssistantModel(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      qualification: json['qualification'] as String,
      labName: json['labName'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$LabAssistantModelToJson(LabAssistantModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'qualification': instance.qualification,
      'labName': instance.labName,
      'userId': instance.userId,
    };
