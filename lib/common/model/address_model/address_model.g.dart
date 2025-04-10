// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      location: json['location'] == null
          ? null
          : CustomLocationModel.fromJson(
              json['location'] as Map<String, dynamic>),
      isPrimary: json['isPrimary'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      contactName: json['contactName'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      addressType: json['type'] == null
          ? null
          : AddressTypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location?.toJson(),
      'isPrimary': instance.isPrimary,
      'phoneNumber': instance.phoneNumber,
      'contactName': instance.contactName,
      'city': instance.city,
      'country': instance.country,
      'type': instance.addressType?.toJson(),
    };

AddressTypeModel _$AddressTypeModelFromJson(Map<String, dynamic> json) =>
    AddressTypeModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$AddressTypeModelToJson(AddressTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'value': instance.value,
      'category': instance.category,
    };
