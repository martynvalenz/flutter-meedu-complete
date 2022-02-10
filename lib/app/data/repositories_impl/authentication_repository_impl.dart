import 'package:flutter_meedu_complete/app/data/data_source/apis/authentication_api.dart';
import 'package:flutter_meedu_complete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu_complete/app/domain/response/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  // Constructor
  // AuthenticationRepositoryImpl(){
  //   print('AuthenticationRepositoryImpl');
  // }
  final AuthenticationAPI _api;

  AuthenticationRepositoryImpl(this._api);
  @override
  Future<String?> get accesstoken async{
    await Future.delayed(const Duration(seconds: 1));
    return 'válido';
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email,password);
  }
  
}