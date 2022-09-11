import 'package:freezed_annotation/freezed_annotation.dart';

part "product_model.freezed.dart";
part "product_model.g.dart";

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default("-") String? id,
    @Default("-") String? productName,
    @Default(0) int? netto,
    @Default(0) int? hargaAgen,
    @Default(0) int? hargaDistributor,
    @Default(0) int? hargaSwalayan,
    @Default(0) int? hargaReseller,
    @Default(0) int? hargaKonsumen,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
