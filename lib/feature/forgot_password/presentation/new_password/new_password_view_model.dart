import 'dart:developer';

import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/entity/forgot_password_credentails.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/repo/forgot_password_repo.dart';

class NewPasswordViewModel {
  final ForgotPasswordRepo _forgotPasswordRepo;

  NewPasswordViewModel({
    required ForgotPasswordRepo forgotPasswordRepo,
  }) : _forgotPasswordRepo = forgotPasswordRepo;

  Future<void> checkNewPassword(
      {required String password, required String newPassword}) async {
    final result = await _forgotPasswordRepo.checkNewPassword(
        password: password, newPassword: newPassword);

    switch (result) {
      case GoodUseCaseResult<ForgotPasswordCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<ForgotPasswordCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }
}
