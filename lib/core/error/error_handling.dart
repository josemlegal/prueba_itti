import 'package:dio/dio.dart';
import 'package:prueba_itti/core/error/custom_error.dart';

class CustomErrorHandler {
  static CustomError fromGenericError({required String message}) {
    return CustomError(message: message);
  }

  static CustomError fromDioError({
    required DioError err,
    required String errorMessage,
  }) {
    var message = "Server error";
    if (err.response != null &&
        err.response!.data != null &&
        err.response!.statusCode == 400) {
      message = errorMessage;
    }
    return CustomError(message: message);
  }
}
