import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseModel {
  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final String? error;
  final String? status;
  BaseModel({
    this.accessToken,
    this.refreshToken,
    this.error,
    this.message,
    this.status,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
}
