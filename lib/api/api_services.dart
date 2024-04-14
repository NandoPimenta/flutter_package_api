// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'interceptors.dart';

class ApiService {
  late Dio dio;
  late String baseUrl;
  Map<String, dynamic>? headers;
  late Map<Enum,String> paths;

  init({required url,required paths,connectTimeout = 60, receiveTimeout = 60}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: Duration(seconds: connectTimeout),
      receiveTimeout: Duration(seconds: receiveTimeout),
    );
    this.paths = paths;
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

  _checkEnumExist({required Enum path}){
    if(paths[path] == null){
      throw Exception(["Path Does`n exist!"]);
    }
  }  

 Future<Response> get({required Enum path,Map<String,dynamic>? queryParameters}) async {
  _checkEnumExist(path: path);
    return await dio.get(paths[path]!,queryParameters:queryParameters );
  }

  Future<Response> post({required Enum path, Map<String, dynamic>? data}) async {
    _checkEnumExist(path: path);
    return await dio.post(paths[path]!, data: data);
  }
  Future<Response> put({required Enum path, Map<String, dynamic>? data}) async {
    _checkEnumExist(path: path);
    return await dio.put(paths[path]!, data: data);
  }
  Future<Response> patch({required Enum path, Map<String, dynamic>? data}) async {
    _checkEnumExist(path: path);
    return await dio.patch(paths[path]!, data: data);
  }
  Future<Response> delete({required Enum path, Map<String, dynamic>? data}) async {
    _checkEnumExist(path: path);
    return await dio.delete(paths[path]!, data: data);
  }
}
