import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/utils/constants.dart';

class LoginRepository {
  static Future<Token> authenticate(String username, String password) async {
    final response = await dio.post(
      HttpUrls.loginUrl,
      data: {
        'username': username,
        'password': password,
        'client_id': Constants.CLIENT_ID,
        'client_secret': Constants.CLIENT_SECRET,
        'grant_type': Constants.GRANT_TYPE,
        'providers': Constants.PROVIDERS,
      },
    );
    var result = response.data;
    Token token = Token.fromJson(result);
    return token;
  }
}
