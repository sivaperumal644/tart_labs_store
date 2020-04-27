import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_url_response.dart';

class AppUrlRepository {
  static Future<AppUrlResponse> getAppUrls(int id) async {
    final response = await dio.get(HttpUrls.getSharableLink(id));
    var result = response.data;
    AppUrlResponse appUrlResponse = AppUrlResponse.fromJson(result);
    return appUrlResponse;
  }
}
