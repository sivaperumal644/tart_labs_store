import 'package:tart_labs_store/http/dio_helper.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/responses/profile_response.dart';

class ProfileRepository {
  static Future<ProfileResponse> getUser() async {
    ProfileResponse profileResponse;
    final response = await dio.get(HttpUrls.PROFILE_URL);
    var result = response.data;
    profileResponse = ProfileResponse.fromJson(result);
    return profileResponse;
  }
}
