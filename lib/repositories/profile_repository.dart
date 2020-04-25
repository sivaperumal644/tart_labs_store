import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/profile_response.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class ProfileRepository {
  static Future<ProfileResponse> getUser() async {
    ProfileResponse profileResponse;
    String url = HttpUrls.PROFILE_URL;
    try {
      String token = await PreferenceHelper.getToken();
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ' + token,
          },
        ),
      );
      var result = response.data;
      profileResponse = ProfileResponse.fromJson(result);
    } catch (error) {
      print(error);
    }
    return profileResponse;
  }
}
