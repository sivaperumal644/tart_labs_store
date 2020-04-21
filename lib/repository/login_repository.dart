import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tart_labs_store/constants/strings.dart';
import 'package:tart_labs_store/models/token.dart';

class LoginRepository {
  static Future<Token> login(String username, String password) async {
    Token token;
    Dio dio = new Dio();
    final response = await dio.post(
      BASE_URL + '/oauth/token',
      data: {
        'username': username,
        'password': password,
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
        'grant_type': GRANT_TYPE,
        'providers': PROVIDERS
      },
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      ),
    );
    var result = response.data;
    token = Token.fromJson(result);
    return token;
  }
}
