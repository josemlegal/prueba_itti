import 'package:get_it/get_it.dart';
import 'package:prueba_itti/core/services/http_service.dart';
import 'package:prueba_itti/data/repositories/user_repository_implementation.dart';
import 'package:prueba_itti/domain/repostories/user_repository.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImplementation(
      httpService: locator<HttpService>(),
    ),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
}
