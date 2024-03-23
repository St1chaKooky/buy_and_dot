import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/core/domain/app_error/app_error.dart';
import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/auth/data/model/auth_credentials.dart';
import 'package:buy_and_dot/feature/auth/data/source/auth_data.dart';
import 'package:buy_and_dot/feature/auth/domain/entity/auth_credentails.dart';
import 'package:buy_and_dot/feature/auth/domain/repo/auth_repo.dart';
import 'package:buy_and_dot/util/rest_api_error_list_ext.dart';

class AuthMockedRepo implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthMockedRepo(this._authDataSource);
  @override
  Future<UseCaseResult<AuthCredentials>> signIn({
    required final String phone,
    required final String password,
  }) async {
    final sourceResult =
        await _authDataSource.signIn(phone: phone, password: password);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('error void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  @override
  Future<UseCaseResult<AuthCredentials>> signUp({
    required final String phone,
    required final String password,
  }) async {
    final sourceResult =
        await _authDataSource.signIn(phone: phone, password: password);

    return switch (sourceResult) {
      DataRemoteResponse<AuthCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthCredentials.fromModel(data)),
      VoidRemoteResponse<AuthCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('error void')]),
      ErrorRemoteResponse<AuthCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
