import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prueba_itti/core/dependency_injection/locator.dart';
import 'package:prueba_itti/domain/models/user_model.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewController extends ChangeNotifier {
  final SnackbarService _snackbarService;

  LoginViewController({required SnackbarService snackbarService})
      : _snackbarService = snackbarService;

  bool isLoading = true;
  User? _currentUser;

  User? get currentUser => _currentUser;

  String? textInputEmptyValidator(value) {
    if (value!.isEmpty) {
      return 'El campo esta vacio';
    } else {
      return null;
    }
  }

  String? userTextInfoValidator(value) {}
}

final loginViewControllerProvider = ChangeNotifierProvider(
  (ref) => LoginViewController(
    snackbarService: locator<SnackbarService>(),
  ),
);
