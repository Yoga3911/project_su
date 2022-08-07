import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_forgot_password.freezed.dart';
part 'user_forgot_password.g.dart';

@freezed
class UserForgotPassword with _$UserForgotPassword {
  const factory UserForgotPassword({
    required String password,
    required int updatedAt,
  }) = _UserForgotPassword;

  factory UserForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$UserForgotPasswordFromJson(json);
}
