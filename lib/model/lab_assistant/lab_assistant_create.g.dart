// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_assistant_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabAssistantCreate _$LabAssistantCreateFromJson(Map<String, dynamic> json) =>
    LabAssistantCreate(
      message: json['message'] as String,
      response: json['RESPONSE'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LabAssistantCreateToJson(LabAssistantCreate instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      uuid: json['uuid'] as String,
      status: json['status'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      pin: json['pin'] as String,
      qualification: json['qualification'] as String,
      labName: json['labName'] as String,
      userId: (json['userId'] as num).toInt(),
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'status': instance.status,
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'pin': instance.pin,
      'qualification': instance.qualification,
      'labName': instance.labName,
      'userId': instance.userId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
