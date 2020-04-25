import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_response.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AppsRepository {
  static Future<AppResponse> getAllApps() async {
    AppResponse appResponse;
    final token = await PreferenceHelper.getToken();
    try {
      final response = await dio.get(
        HttpUrls.GET_APPS_URL,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ' + token,
          },
        ),
      );
      var result = response.data;
      appResponse = AppResponse.fromJson(result);
    } catch (error) {}
    return appResponse;
  }
}
