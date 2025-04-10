import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import 'user_model.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseModel {
  @JsonKey(name: "result")
  final UserModel? userModel;
  UserResponse({
    this.userModel,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
