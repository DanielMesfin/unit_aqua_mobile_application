// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_zone_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketZoneListResponse _$MarketZoneListResponseFromJson(
        Map<String, dynamic> json) =>
    MarketZoneListResponse(
      zoneList: (json['result'] as List<dynamic>?)
          ?.map((e) => MarketZoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..response = json['RESPONSE'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$MarketZoneListResponseToJson(
        MarketZoneListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'RESPONSE': instance.response,
      'statusCode': instance.statusCode,
      'result': instance.zoneList,
    };
