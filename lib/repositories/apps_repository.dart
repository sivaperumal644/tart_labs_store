import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_response.dart';

class AppsRepository {
  static Future<AppResponse> getAllApps() async {
    final response = await dio.get(HttpUrls.getAppsUrl);
    var result = response.data;
    AppResponse appResponse = AppResponse.fromJson(result);
    return appResponse;
  }
}
