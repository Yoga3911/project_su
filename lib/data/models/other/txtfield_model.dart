import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'txtfield_model.freezed.dart';

@freezed
class TextFieldModel with _$TextFieldModel {
  const factory TextFieldModel({
    required String label,
    required IconData icon,
    required bool isSecure,
    required TextEditingController controller,
    required String hint,
  }) = _TextFieldModel;
}
