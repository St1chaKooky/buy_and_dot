import 'package:buy_and_dot/feature/forgot_password/data/model/forgot_password_credentails.dart';

class ForgotPasswordCredentials {
  final String jvtToken;

  const ForgotPasswordCredentials(this.jvtToken);

  factory ForgotPasswordCredentials.fromModel(
          ForgotPasswordCredentialsModel model) =>
      ForgotPasswordCredentials(model.jvtToken);
}
