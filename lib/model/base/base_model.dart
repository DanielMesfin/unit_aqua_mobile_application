import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  String? message;
  @JsonKey(name: "RESPONSE")
  String? response;
  int? statusCode;
  BaseModel({
    this.message,
    this.response,
    this.statusCode,
  });
  bool get isFailure => response == "FAILURE";
  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
}
