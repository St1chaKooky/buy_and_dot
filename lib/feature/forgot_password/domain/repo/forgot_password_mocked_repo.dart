import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/core/domain/app_error/app_error.dart';
import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/forgot_password/data/model/forgot_password_credentails.dart';
import 'package:buy_and_dot/feature/forgot_password/data/source/forgot_password_data.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/entity/forgot_password_credentails.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:buy_and_dot/util/rest_api_error_list_ext.dart';

class ForgotPasswordMockedRepo implements ForgotPasswordRepo {
  final ForgotPasswordDataSource _forgotDataSource;

  ForgotPasswordMockedRepo(this._forgotDataSource);

  @override
  Future<UseCaseResult<ForgotPasswordCredentials>> checkNewPassword(
      {required String password, required String newPassword}) async {
    final sourceResult = await _forgotDataSource.checkNewPassword(
        newPassword: newPassword, password: password);

    return switch (sourceResult) {
      DataRemoteResponse<ForgotPasswordCredentialsModel>(:final data) =>
        UseCaseResult.good(ForgotPasswordCredentials.fromModel(data)),
      VoidRemoteResponse<ForgotPasswordCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('error void')]),
      ErrorRemoteResponse<ForgotPasswordCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  @override
  Future<UseCaseResult<ForgotPasswordCredentials>> sendCode(String code) async {
    final sourceResult = await _forgotDataSource.sendCode(code);

    return switch (sourceResult) {
      DataRemoteResponse<ForgotPasswordCredentialsModel>(:final data) =>
        UseCaseResult.good(ForgotPasswordCredentials.fromModel(data)),
      VoidRemoteResponse<ForgotPasswordCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('error void')]),
      ErrorRemoteResponse<ForgotPasswordCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  @override
  Future<UseCaseResult<ForgotPasswordCredentials>> sendPhoneNumber(
      String phone) async {
    final sourceResult = await _forgotDataSource.sendPhoneNumber(phone);

    return switch (sourceResult) {
      DataRemoteResponse<ForgotPasswordCredentialsModel>(:final data) =>
        UseCaseResult.good(ForgotPasswordCredentials.fromModel(data)),
      VoidRemoteResponse<ForgotPasswordCredentialsModel>() =>
        const UseCaseResult.bad([SelfValidationError('error void')]),
      ErrorRemoteResponse<ForgotPasswordCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
