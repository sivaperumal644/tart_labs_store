import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tart_labs_store/models/token.dart';

class PreferenceHelper {
  static Future<Token> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.get("token");
    if (token?.isEmpty ?? true) {
      return null;
    } else {
      Map<String, dynamic> map = await jsonDecode(token);
      return Token.fromJson(map);
    }
  }

  static saveToken(Token token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (token == null) {
      return;
    }
    preferences.setString("token", jsonEncode(token.toJson()));
  }

  static clearToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
