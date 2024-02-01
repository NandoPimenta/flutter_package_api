import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('----------------------------------------------------------');
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    log('Data[${options.data}] ');
    debugPrint('----------------------------------------------------------');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('----------------------------------------------------------');
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    log('Data[${response.data}] ');
    debugPrint('----------------------------------------------------------');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('----------------------------------------------------------');
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    log('Data[${err.response?.data}] ');
    debugPrint('----------------------------------------------------------');
    super.onError(err, handler);
  }
}