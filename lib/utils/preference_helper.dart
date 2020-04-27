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
      Map<String, dynamic> tokenMap = await jsonDecode(token);
      return Token.fromJson(tokenMap);
    }
  }

  static saveToken(Token token) async {
    if (token == null) {
      return;
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", jsonEncode(token));
  }

  static Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String name = preferences.get("username");
    if (name?.isEmpty ?? true) {
      return null;
    } else {
      return name;
    }
  }

  static saveName(String name) async {
    if (name == null) {
      return;
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", name);
  }

  static clearToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
