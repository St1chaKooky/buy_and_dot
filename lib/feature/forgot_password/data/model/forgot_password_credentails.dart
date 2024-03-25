import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_credentails.g.dart';

@JsonSerializable()
class ForgotPasswordCredentialsModel {
  final String jvtToken;

  ForgotPasswordCredentialsModel({
    required this.jvtToken,
  });

  factory ForgotPasswordCredentialsModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordCredentialsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordCredentialsModelToJson(this);
}
