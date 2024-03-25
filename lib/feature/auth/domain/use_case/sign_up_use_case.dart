import 'package:buy_and_dot/core/domain/use_case_result/use_case_result.dart';
import 'package:buy_and_dot/feature/auth/domain/entity/auth_credentails.dart';
import 'package:buy_and_dot/feature/auth/domain/repo/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  Future<UseCaseResult<AuthCredentials>> call({
    required final String phone,
    required final String password,
  }) {
    return _authRepo.signUp(phone: phone, password: password);
  }
}
