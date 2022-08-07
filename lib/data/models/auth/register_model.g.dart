// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterModel _$$_RegisterModelFromJson(Map<String, dynamic> json) =>
    _$_RegisterModel(
      userId: json['userId'] as String? ?? "",
      username: json['username'] as String,
      password: json['password'] as String,
      desaId: json['desaId'] as int,
      image: json['image'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      fullName: json['fullName'] as String? ?? "",
      nik: json['nik'] as String? ?? "",
      birthDate: json['birthDate'] as int? ?? 0,
      birthPlace: json['birthPlace'] as String? ?? "",
      telpon: json['telpon'] as String? ?? "",
      address: json['address'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      loginToken: json['loginToken'] as String? ?? "",
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$_RegisterModelToJson(_$_RegisterModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'password': instance.password,
      'desaId': instance.desaId,
      'image': instance.image,
      'isAdmin': instance.isAdmin,
      'fullName': instance.fullName,
      'nik': instance.nik,
      'birthDate': instance.birthDate,
      'birthPlace': instance.birthPlace,
      'telpon': instance.telpon,
      'address': instance.address,
      'gender': instance.gender,
      'loginToken': instance.loginToken,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
