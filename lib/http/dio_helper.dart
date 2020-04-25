import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tart_labs_store/utils/constants.dart';

class DioHelper{
  Dio dio = Dio();
  DioHelper() {
    dio.options.baseUrl = Constants.BASE_URL;
    dio.options.headers[HttpHeaders.acceptHeader] = 'application/json'; 
  }
}

final Dio dio = DioHelper().dio;