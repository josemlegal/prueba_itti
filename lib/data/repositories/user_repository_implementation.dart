import 'package:dio/dio.dart';
import 'package:prueba_itti/core/error/error_handling.dart';
import 'package:prueba_itti/core/services/http_service.dart';
import 'package:prueba_itti/domain/models/user_model.dart';
import 'package:prueba_itti/domain/repostories/user_repository.dart';

class UserRepositoryImplementation implements UserRepository {
  final HttpService _httpService;

  UserRepositoryImplementation({required HttpService httpService})
      : _httpService = httpService;

  @override
  Future<List<User>> getUsers() {
    return _call(
      () async {
        final response = await _httpService.dio.get(
          "/users",
        );
        final data = response.data as List;
        final users = data.map((e) => User.fromJson(e)).toList();
        return users;
      },
      errorMessage: "Error while fetching users",
    );
  }

  @override
  Future<User> getUser(int id) {
    return _call(
      () async {
        final response = await _httpService.dio.get(
          "/users/$id",
        );
        final data = response.data;
        final user = User.fromJson(data);
        return user;
      },
      errorMessage: "Error while fetching user",
    );
  }

  Future<T> _call<T>(Future<T> Function() function,
      {String? errorMessage}) async {
    try {
      return await function();
    } on DioError catch (err) {
      throw CustomErrorHandler.fromDioError(
        err: err,
        errorMessage:
            errorMessage ?? "Something went wrong, please try again later.",
      );
    } catch (err) {
      throw CustomErrorHandler.fromGenericError(message: err.toString());
    }
  }
}
