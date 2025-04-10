// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmerSearchResponse _$FarmerSearchResponseFromJson(
        Map<String, dynamic> json) =>
    FarmerSearchResponse(
      message: json['message'] as String?,
      response: json['RESPONSE'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FarmerSearchResponseToJson(
        FarmerSearchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      area: json['area'] as String?,
      cultureType: json['cultureType'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'district': instance.district,
      'area': instance.area,
      'cultureType': instance.cultureType,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
    };
