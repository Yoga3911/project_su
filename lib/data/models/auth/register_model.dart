import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @Default("") String? userId,
    required String username,
    required String password,
    required int desaId,
    required String image,
    @Default(false) bool? isAdmin,
    @Default("") String? fullName,
    @Default("") String? nik,
    @Default(0) int? birthDate,
    @Default("") String? birthPlace,
    @Default("") String? telpon,
    @Default("") String? address,
    @Default("") String? gender,
    @Default("") String? loginToken,
    required int createdAt,
    required int updatedAt,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
