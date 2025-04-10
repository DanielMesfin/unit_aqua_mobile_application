// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmers_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmerResponse _$FarmerResponseFromJson(Map<String, dynamic> json) =>
    FarmerResponse(
      farmer: json['result']['farmer'] == null
          ? null
          : FarmersModel.fromJson(
              json['result']['farmer'] as Map<String, dynamic>),
      tankList: (json['result']['tanks'] as List<dynamic>?)
          ?.map((e) => TankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$FarmerResponseToJson(FarmerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'farmer': instance.farmer,
      'tankList': instance.tankList,
    };
