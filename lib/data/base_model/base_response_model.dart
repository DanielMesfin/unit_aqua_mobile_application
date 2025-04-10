import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseResponseModel<T extends dynamic> extends BaseModel {
  final T? data;
  @JsonKey(name: "status")
  final String responseStatus;

  BaseResponseModel({this.data, required this.responseStatus})
      : super(
          accessToken: data?.accessToken,
          status: responseStatus,
          refreshToken: data?.refreshToken,
        );

  factory BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseModelFromJson<T>(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseResponseModelToJson<T>(this, toJsonT);
}
