// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userId: json['userId'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      desaId: json['desaId'] as int,
      isAdmin: json['isAdmin'] as bool,
      image: json['image'] as String,
      fullName: json['fullName'] as String,
      nik: json['nik'] as String,
      birthDate: json['birthDate'] as int,
      birthPlace: json['birthPlace'] as String,
      telpon: json['telpon'] as String,
      address: json['address'] as String,
      gender: json['gender'] as String,
      loginToken: json['loginToken'] as String,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'password': instance.password,
      'desaId': instance.desaId,
      'isAdmin': instance.isAdmin,
      'image': instance.image,
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
