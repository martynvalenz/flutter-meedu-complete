
import 'dart:async';
import 'dart:io';

import 'package:flutter_meedu_complete/app/data/http/http.dart';
import 'package:flutter_meedu_complete/app/data/http/http_method.dart';
import 'package:flutter_meedu_complete/app/domain/response/login_response.dart';

class AuthenticationAPI{
  final Http _http;
  AuthenticationAPI(this._http);
  Future<LoginResponse> login(String email, String password) async{
    final result = await _http.request<String>(
      '/api/login',
      // queryParameters: {'delay':'0'},
      method:HttpMethod.post,
      body:{
        "email": email,
        "password": password
      },
      parser:(data){
        return data['token'];
      },
    );

    print('result data ${result.data}');
    print('result data runimeType ${result.data.runtimeType}');
    print('result error ${result.error?.data}');
    print('result statusCode ${result.statusCode}');

    if(result.error == null){
      return LoginResponse.ok;
    }

    if(result.statusCode == 400){
      return LoginResponse.accessDenied;
    }

    final error = result.error!.exception;

    if(error is SocketException || error is TimeoutException){
      return LoginResponse.networkError;
    }

    return LoginResponse.unknownError;
  }
}