import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tart_labs_store/http/http_urls.dart';
import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/screens/login_screen/login_screen.dart';
import 'package:tart_labs_store/utils/app_utils.dart';
import 'package:tart_labs_store/utils/constants.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class DioHelper {
  Dio dio = Dio();
  DioHelper() {
    dio.options.baseUrl = Constants.BASE_URL;
    dio.options.headers[HttpHeaders.acceptHeader] = 'application/json';
    setAuthorizationHeader();
  }

  setAuthorizationHeader() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (Options options) async {
          Token currentToken = await PreferenceHelper.getToken();
          if (currentToken == null) {
            return options;
          } else {
            int expiresAt = DateTime.now().millisecondsSinceEpoch +
                (currentToken.expiresIn * Duration.millisecondsPerSecond);
            int currentDateTime = DateTime.now().millisecondsSinceEpoch;
            if (expiresAt > currentDateTime) {
              options.headers[HttpHeaders.authorizationHeader] =
                  'Bearer ' + currentToken.accessToken;
              return options;
            }
            Token newToken = await getRefreshToken(dio, currentToken);
            if (newToken == null) {
              return options;
            } else {
              options.headers[HttpHeaders.authorizationHeader] =
                  'Bearer' + newToken.accessToken;
              return options;
            }
          }
        },
        onError: (DioError error) {
          if (error.type == DioErrorType.RESPONSE) {
            switch (error.response.statusCode) {
              case 401:
                logOut();
                return error;
              case 500:
                AppUtils.showToast("500, server broken");
                break;
              case 404:
                AppUtils.showToast("404 Forbidden");
                break;
              case 403:
                AppUtils.showToast("403 Forbidden");
                break;
              case 405:
                AppUtils.showToast("Method Not allowed");
                break;
              case 429:
                AppUtils.showToast(
                    "Too many requests - ${error.request.uri.toString()}");
                break;
            }
          } else if (error.type == DioErrorType.DEFAULT) {
            AppUtils.showToast("Check your internet connection");
          } else {
            AppUtils.showToast(error.message);
          }
          return error;
        },
      ),
    );
  }

  getRefreshToken(Dio dio, Token token) async {
    try {
      Response response = await dio.post(HttpUrls.refreshTokenUrl, data: {
        "client_id": Constants.CLIENT_ID,
        "client_secret": Constants.CLIENT_SECRET,
        "grant_type": Constants.REFRESH_GRANT_TYPE,
        "refresh_token": token.refreshToken,
      });

      Token tokenResponse = Token.fromJson(response.data);
      if (tokenResponse != null) {
        await PreferenceHelper.saveToken(tokenResponse);
      }
      return tokenResponse;
    } catch (error) {
      return;
    }
  }

  logOut() {
    PreferenceHelper.clearStorage();
    Get.off(LoginScreen());
  }
}

final Dio dio = DioHelper().dio;
