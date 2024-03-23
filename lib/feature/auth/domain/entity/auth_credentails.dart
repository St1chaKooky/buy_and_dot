import 'package:buy_and_dot/feature/auth/data/model/auth_credentials.dart';

//сама модель сущности, в ентити под классы раписываются тоже.

class AuthCredentials {
  final String jvtToken;

  const AuthCredentials(this.jvtToken);

  factory AuthCredentials.fromModel(AuthCredentialsModel model) =>
      AuthCredentials(model.jvtToken);
}
