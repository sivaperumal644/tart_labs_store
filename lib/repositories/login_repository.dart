import 'package:tart_labs_store/constants/strings.dart';
import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/utils/dio_helper.dart';

class LoginRepository {
  static Future<Token> login(String username, String password) async {
    Token token;
    final response = await dio.post(
      '/oauth/token',
      data: {
        'username': username,
        'password': password,
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
        'grant_type': GRANT_TYPE,
        'providers': PROVIDERS
      },
    );
    var result = response.data;
    token = Token.fromJson(result);
    return token;
  }
}
