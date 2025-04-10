import 'package:unity_labs/model/auth/auth_response.dart';
import 'package:unity_labs/model/user/user_model.dart';
import 'package:unity_labs/model/user/user_response.dart';

import '../../model/base/base_model.dart';

abstract class AuthService {
  Future<UserResponse> getProfile();
  Future<AuthResponse> login({required UserModel request});
  Future<AuthResponse> signup({required UserModel user});
  Future<BaseModel> changePassword({
    required String phoneNumber,
    required String pin,
  });
  Future<void> logout({required int uiserId});
  Future<UserResponse> updateProfile(
      {required int userId, required UserModel user});
}
