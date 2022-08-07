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
      isAdmin: json['isAdmin'] as bool? ?? false,
      fullName: json['fullName'] as String? ?? "",
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$_RegisterModelToJson(_$_RegisterModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'fullName': instance.fullName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
