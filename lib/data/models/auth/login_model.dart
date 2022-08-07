import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String username,
    required String password,
  }) = _LoginModel;
}
