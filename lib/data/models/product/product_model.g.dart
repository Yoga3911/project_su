// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String? ?? "-",
      productName: json['productName'] as String? ?? "-",
      netto: json['netto'] as int? ?? 0,
      hargaAgen: json['hargaAgen'] as int? ?? 0,
      hargaDistributor: json['hargaDistributor'] as int? ?? 0,
      hargaSwalayan: json['hargaSwalayan'] as int? ?? 0,
      hargaReseller: json['hargaReseller'] as int? ?? 0,
      hargaKonsumen: json['hargaKonsumen'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'netto': instance.netto,
      'hargaAgen': instance.hargaAgen,
      'hargaDistributor': instance.hargaDistributor,
      'hargaSwalayan': instance.hargaSwalayan,
      'hargaReseller': instance.hargaReseller,
      'hargaKonsumen': instance.hargaKonsumen,
    };
