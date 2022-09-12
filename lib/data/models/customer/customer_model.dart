import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    @Default("") String? id,
    @Default("") String? name,
    @Default("") String? address,
    @Default("") String? telp,
    @Default(0) int? priceCategory,
    @Default(false) bool? isDeleted,
    @Default(0) int? createdAt,
    @Default(0) int? updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
