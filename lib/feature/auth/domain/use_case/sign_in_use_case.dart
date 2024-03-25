import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/auth/domain/entity/auth_credentails.dart';
import 'package:buy_and_dot/feature/auth/domain/repo/auth_repo.dart';

class SignInUseCase {
  final AuthRepo _authRepo;

  SignInUseCase(this._authRepo);

  Future<UseCaseResult<AuthCredentials>> call({
    required final String phone,
    required final String password,
  }) {
    return _authRepo.signIn(phone: phone, password: password);
  }
}
