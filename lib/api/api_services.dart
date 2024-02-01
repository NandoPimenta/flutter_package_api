// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'interceptors.dart';

class ApiService {
  late Dio dio;
  late String baseUrl;
  Map<String, dynamic>? headers;

  init({required url, connectTimeout = 60, receiveTimeout = 60}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: Duration(seconds: connectTimeout),
      receiveTimeout: Duration(seconds: receiveTimeout),
    );
    dio = Dio(options);
    dio.interceptors.add(
      CustomInterceptors(),
    );
  }

  changeContentType(String contentType) {
    dio.options.contentType = contentType;
  }

  setHeaders(Map<String, dynamic> h) {
    headers = h;
    dio.options.headers = headers;
  }

 Future<Response> get({required String path}) async {
    return await dio.get(path);
  }

  Future<Response> post({required String path, Map<String, dynamic>? data}) async {
    return await dio.post(path, data: data);
  }
}
