import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_response.dart';

class AppsRepository {
  static Future<AppResponse> getAllApps() async {
    AppResponse appResponse;
    final response = await dio.get(HttpUrls.GET_APPS_URL);
    var result = response.data;
    appResponse = AppResponse.fromJson(result);
    return appResponse;
  }
}
