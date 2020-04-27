import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/app_url_response.dart';

class AppUrlRepository {
  static Future<AppUrlResponse> getAppUrls(int id) async {
    AppUrlResponse appUrlResponse;
    String url = HttpUrls.GET_SHARABLE_LINK + '$id';
    final response = await dio.get(url);
    var result = response.data;
    appUrlResponse = AppUrlResponse.fromJson(result);
    return appUrlResponse;
  }
}
