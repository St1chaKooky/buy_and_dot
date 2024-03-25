import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/entity/forgot_password_credentails.dart';

abstract interface class ForgotPasswordRepo {
  Future<UseCaseResult<ForgotPasswordCredentials>> sendPhoneNumber(
    final String phone,
  );

  Future<UseCaseResult<ForgotPasswordCredentials>> sendCode(
    final String code,
  );
  Future<UseCaseResult<ForgotPasswordCredentials>> checkNewPassword({
    required final String password,
    required final String newPassword,
  });
}
