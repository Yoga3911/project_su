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
      fullName: json['fullName'] as String,
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
      'fullName': instance.fullName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
