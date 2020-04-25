import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_url_response.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AppUrlRepository {
  static Future<AppUrlResponse> getAppUrls(int id) async {
    AppUrlResponse appUrlResponse;
    final token = await PreferenceHelper.getToken();
    String url = HttpUrls.GET_SHARABLE_LINK + '$id';
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
        ),
      );
      var result = response.data;
      appUrlResponse = AppUrlResponse.fromJson(result);
    } catch (error) {
      print(error);
    }
    return appUrlResponse;
  }
}
