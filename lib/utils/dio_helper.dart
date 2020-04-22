import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tart_labs_store/constants/strings.dart';

class DioHelper{
  Dio dio = Dio();
  DioHelper(){
    dio.options.baseUrl = BASE_URL;
    dio.options.headers[HttpHeaders.acceptHeader] = 'application/json'; 
  }
}

final Dio dio = DioHelper().dio;