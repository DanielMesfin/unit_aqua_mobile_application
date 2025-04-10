// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_assistant_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabAssistantUpdate _$LabAssistantUpdateFromJson(Map<String, dynamic> json) =>
    LabAssistantUpdate(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      pin: (json['pin'] as num?)?.toInt(),
      qualification: json['qualification'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LabAssistantUpdateToJson(LabAssistantUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'qualification': instance.qualification,
      'status': instance.status,
    };
