import 'dart:developer';

import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/auth/domain/entity/auth_credentails.dart';
import 'package:buy_and_dot/feature/auth/domain/repo/auth_repo.dart';

class AuthViewModel {
  final AuthRepo _authRepository;

  AuthViewModel({
    required AuthRepo authRepository,
  }) : _authRepository = authRepository;

  Future<void> signIn(String phone, String password) async {
    final result = await _authRepository.signIn(
      phone: phone,
      password: password,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  Future<void> signUp(String phone, String password) async {
    final result = await _authRepository.signUp(
      phone: phone,
      password: password,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }
}
