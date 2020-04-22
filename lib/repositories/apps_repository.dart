import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tart_labs_store/responses/app_response.dart';
import 'package:tart_labs_store/utils/dio_helper.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AppsRepository {
  static Future<AppResponse> getAllApps() async {
    String url = '/api/v1/client/apps';
    AppResponse appResponse;
    final token = await PreferenceHelper.getToken();
    try {
      final response = await dio.get(
        url,
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
