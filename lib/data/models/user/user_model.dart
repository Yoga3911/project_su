import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String userId,
    required String username,
    required String password,
    required int desaId,
    required bool isAdmin,
    required String image,
    required String fullName,
    required String nik,
    required int birthDate,
    required String birthPlace,
    required String telpon,
    required String address,
    required String gender,
    required String loginToken,
    required int createdAt,
    required int updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
