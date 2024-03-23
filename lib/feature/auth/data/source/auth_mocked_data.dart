import 'package:buy_and_dot/core/data/model/rest_api_error_model.dart';
import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/feature/auth/data/model/auth_credentials.dart';
import 'package:buy_and_dot/feature/auth/data/source/auth_data.dart';

class AuthMockedDataSource implements AuthDataSource {
  @override
  Future<RemoteResponse<AuthCredentialsModel>> signIn(
      {required String phone, required String password}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (phone == password) {
      return DataRemoteResponse(
        data: AuthCredentialsModel(jvtToken: 'dasdfasdfas'),
      );
    } else {
      return ErrorRemoteResponse(
        title: 'auth failed',
        detail: 'warafak',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'phone',
            errorList: [
              (code: 'warafak phone', params: null),
            ],
          ),
          RestApiValidationErrorModel(
            fieldName: 'password',
            errorList: [
              (code: 'warafak password', params: null),
            ],
          ),
        ],
      );
    }
  }

  @override
  Future<RemoteResponse<AuthCredentialsModel>> signUp({
    required String phone,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 5));
    if (password.length > 3) {
      return DataRemoteResponse(
        data: AuthCredentialsModel(jvtToken: 'dasdfasdfas'),
      );
    } else {
      return ErrorRemoteResponse(
        title: 'auth failed',
        detail: 'warafak',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'phone',
            errorList: [
              (code: 'warafak phone', params: null),
            ],
          ),
          RestApiValidationErrorModel(
            fieldName: 'password',
            errorList: [
              (code: 'warafak password', params: null),
            ],
          ),
        ],
      );
    }
  }
}
