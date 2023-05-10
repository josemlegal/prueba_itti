import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final _dio = Dio();
  String baseUrl = dotenv.env['SERVER_ADDRESS']!;

  HttpService() {
    _dio.options.baseUrl = baseUrl;
  }
  Dio get dio => _dio;
}
