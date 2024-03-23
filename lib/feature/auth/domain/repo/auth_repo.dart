import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/auth/domain/entity/auth_credentails.dart';

abstract interface class AuthRepo {
  Future<UseCaseResult<AuthCredentials>> signUp({
    required final String phone,
    required final String password,
  });

  Future<UseCaseResult<AuthCredentials>> signIn({
    required final String phone,
    required final String password,
  });
}
