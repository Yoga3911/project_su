// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      address: json['address'] as String? ?? "",
      telp: json['telp'] as String? ?? "",
      priceCategory: json['priceCategory'] as int? ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] as int? ?? 0,
      updatedAt: json['updatedAt'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'telp': instance.telp,
      'priceCategory': instance.priceCategory,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
