import 'package:buy_and_dot/core/data/model/rest_api_error_model.dart';
import 'package:buy_and_dot/core/data/remote_response.dart';
import 'package:buy_and_dot/feature/forgot_password/data/model/forgot_password_credentails.dart';
import 'package:buy_and_dot/feature/forgot_password/data/source/forgot_password_data.dart';

class ForgetPasswordMockedDataSource implements ForgotPasswordDataSource {
  @override
  Future<RemoteResponse<ForgotPasswordCredentialsModel>> checkNewPassword(
      {required String password, required String newPassword}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (password == password) {
      return DataRemoteResponse(
        data: ForgotPasswordCredentialsModel(jvtToken: 'dasdfasdfas'),
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
  Future<RemoteResponse<ForgotPasswordCredentialsModel>> sendCode(
      String code) async {
    await Future.delayed(const Duration(seconds: 5));
    if (code == 'qqqq') {
      return DataRemoteResponse(
        data: ForgotPasswordCredentialsModel(jvtToken: 'dasdfasdfas'),
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
  Future<RemoteResponse<ForgotPasswordCredentialsModel>> sendPhoneNumber(
      String phone) async {
    await Future.delayed(const Duration(seconds: 5));
    if (phone == 'qqqq') {
      return DataRemoteResponse(
        data: ForgotPasswordCredentialsModel(jvtToken: 'dasdfasdfas'),
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
