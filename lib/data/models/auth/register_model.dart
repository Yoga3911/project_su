import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @Default("") String? userId,
    required String username,
    required String password,
    @Default(false) bool? isAdmin,
    @Default("") String? fullName,
    required int createdAt,
    required int updatedAt,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
