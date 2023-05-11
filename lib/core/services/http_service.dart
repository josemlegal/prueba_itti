import 'package:dio/dio.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = 'https://reqres.in/api';

  HttpService() {
    _dio.options.baseUrl = baseUrl;
  }
  Dio get dio => _dio;
}
