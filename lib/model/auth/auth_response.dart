import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
import '../user/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends BaseModel {
  @JsonKey(name: "result")
  final AuthUser? authUser;
  AuthResponse({
    this.authUser,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthUser {
  final String? authToken;
  final UserModel? user;
  final String? type;
  AuthUser({this.authToken, this.user, this.type});

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
