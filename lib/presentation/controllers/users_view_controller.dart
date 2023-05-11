import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prueba_itti/core/dependency_injection/locator.dart';
import 'package:prueba_itti/domain/models/user_model.dart';
import 'package:prueba_itti/domain/repostories/user_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewController extends ChangeNotifier {
  final SnackbarService _snackbarService;
  final UserRepository _userRepository;

  List<User> _usersList = [];
  List<User> get usersList => _usersList;
  bool isLoading = true;

  UsersViewController(
      {required SnackbarService snackbarService,
      required UserRepository userRepository})
      : _snackbarService = snackbarService,
        _userRepository = userRepository;

  void _handleError({String? title, String? message}) {
    _snackbarService.showSnackbar(
      title: title ?? "Something went wrong",
      message: message ?? "Please try again later",
    );
  }

  Future<void> getUsers() async {
    try {
      final response = await _userRepository.getUsers();
      _usersList = response;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      _handleError(title: "Can't get the users!");
    }
  }

  String setUserState() {
    Random random = Random();
    final num = random.nextInt(100) + 1;

    return num < 20
        ? 'Active'
        : num % 20 == 0
            ? 'Inactive'
            : 'Blocked';
  }
}

final usersProvider = ChangeNotifierProvider(
  (ref) => UsersViewController(
    snackbarService: locator<SnackbarService>(),
    userRepository: locator<UserRepository>(),
  ),
);
