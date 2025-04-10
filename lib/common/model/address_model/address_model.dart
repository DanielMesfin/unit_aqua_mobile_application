import 'package:json_annotation/json_annotation.dart';

import '../custom_location_model/custom_location_model.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "location")
  final CustomLocationModel? location;
  @JsonKey(name: "isPrimary")
  final bool? isPrimary;
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @JsonKey(name: "contactName")
  final String? contactName;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "type")
  final AddressTypeModel? addressType;
  AddressModel({
    this.id,
    this.name,
    this.location,
    this.isPrimary,
    this.phoneNumber,
    this.contactName,
    this.city,
    this.country,
    this.addressType,
  });

  AddressModel copyWith({
    String? id,
    String? name,
    CustomLocationModel? location,
    bool? isPrimary,
    String? phoneNumber,
    String? contactName,
    String? city,
    String? country,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      isPrimary: isPrimary ?? this.isPrimary,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      contactName: contactName ?? this.contactName,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.fromJsonModel(Object? json) =>
      _$AddressModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(AddressModel model) =>
      _$AddressModelToJson(model);
}

@JsonSerializable(explicitToJson: true)
class AddressTypeModel {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "value")
  final String? value;
  @JsonKey(name: "category")
  final String? category;
  AddressTypeModel({
    this.id,
    this.type,
    this.value,
    this.category,
  });

  factory AddressTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AddressTypeModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AddressTypeModelToJson(this);
}
