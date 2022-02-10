import 'package:flutter_meedu_complete/app/domain/response/login_response.dart';

abstract class AuthenticationRepository{
  Future<String?> get accesstoken;
  Future<LoginResponse> login(String email, String password);
}