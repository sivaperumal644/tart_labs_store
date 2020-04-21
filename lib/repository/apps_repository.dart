import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tart_labs_store/constants/strings.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class AppsRepository {
  static Future<List<App>> getAllApps() async {
    List<App> appList;
    Dio dio = new Dio();
    String url = BASE_URL + '/api/v1/client/apps';
    final token = await PreferenceHelper.getToken();
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ' + token.accessToken,
          },
        ),
      );
      var result = response.data;
      List apps = result['apps'];
      appList = apps.map((app) => App.fromJson(app)).toList();
      print(appList.length);
    } catch (error) {
      print(error);
    }
    return appList;
  }
}
