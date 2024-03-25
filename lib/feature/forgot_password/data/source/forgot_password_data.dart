import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/feature/forgot_password/data/model/forgot_password_credentails.dart';

abstract interface class ForgotPasswordDataSource {
  Future<RemoteResponse<ForgotPasswordCredentialsModel>> sendPhoneNumber(
    final String phone,
  );

  Future<RemoteResponse<ForgotPasswordCredentialsModel>> sendCode(
    final String code,
  );
  Future<RemoteResponse<ForgotPasswordCredentialsModel>> checkNewPassword({
    required final String password,
    required final String newPassword,
  });
}
