import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/feature/auth/data/model/auth_credentials.dart';

abstract interface class AuthDataSource {
  Future<RemoteResponse<AuthCredentialsModel>> signIn({
    required final String phone,
    required final String password,
  });

  Future<RemoteResponse<AuthCredentialsModel>> signUp({
    required final String phone,
    required final String password,
  });
}
