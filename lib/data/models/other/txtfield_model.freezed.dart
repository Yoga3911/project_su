// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'txtfield_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextFieldModel {
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  bool get isSecure => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextFieldModelCopyWith<TextFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldModelCopyWith<$Res> {
  factory $TextFieldModelCopyWith(
          TextFieldModel value, $Res Function(TextFieldModel) then) =
      _$TextFieldModelCopyWithImpl<$Res>;
  $Res call(
      {String label,
      IconData icon,
      bool isSecure,
      TextEditingController controller,
      String hint});
}

/// @nodoc
class _$TextFieldModelCopyWithImpl<$Res>
    implements $TextFieldModelCopyWith<$Res> {
  _$TextFieldModelCopyWithImpl(this._value, this._then);

  final TextFieldModel _value;
  // ignore: unused_field
  final $Res Function(TextFieldModel) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
    Object? isSecure = freezed,
    Object? controller = freezed,
    Object? hint = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      isSecure: isSecure == freezed
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TextFieldModelCopyWith<$Res>
    implements $TextFieldModelCopyWith<$Res> {
  factory _$$_TextFieldModelCopyWith(
          _$_TextFieldModel value, $Res Function(_$_TextFieldModel) then) =
      __$$_TextFieldModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      IconData icon,
      bool isSecure,
      TextEditingController controller,
      String hint});
}

/// @nodoc
class __$$_TextFieldModelCopyWithImpl<$Res>
    extends _$TextFieldModelCopyWithImpl<$Res>
    implements _$$_TextFieldModelCopyWith<$Res> {
  __$$_TextFieldModelCopyWithImpl(
      _$_TextFieldModel _value, $Res Function(_$_TextFieldModel) _then)
      : super(_value, (v) => _then(v as _$_TextFieldModel));

  @override
  _$_TextFieldModel get _value => super._value as _$_TextFieldModel;

  @override
  $Res call({
    Object? label = freezed,
    Object? icon = freezed,
    Object? isSecure = freezed,
    Object? controller = freezed,
    Object? hint = freezed,
  }) {
    return _then(_$_TextFieldModel(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      isSecure: isSecure == freezed
          ? _value.isSecure
          : isSecure // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextFieldModel implements _TextFieldModel {
  const _$_TextFieldModel(
      {required this.label,
      required this.icon,
      required this.isSecure,
      required this.controller,
      required this.hint});

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final bool isSecure;
  @override
  final TextEditingController controller;
  @override
  final String hint;

  @override
  String toString() {
    return 'TextFieldModel(label: $label, icon: $icon, isSecure: $isSecure, controller: $controller, hint: $hint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextFieldModel &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.isSecure, isSecure) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality().equals(other.hint, hint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(isSecure),
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(hint));

  @JsonKey(ignore: true)
  @override
  _$$_TextFieldModelCopyWith<_$_TextFieldModel> get copyWith =>
      __$$_TextFieldModelCopyWithImpl<_$_TextFieldModel>(this, _$identity);
}

abstract class _TextFieldModel implements TextFieldModel {
  const factory _TextFieldModel(
      {required final String label,
      required final IconData icon,
      required final bool isSecure,
      required final TextEditingController controller,
      required final String hint}) = _$_TextFieldModel;

  @override
  String get label;
  @override
  IconData get icon;
  @override
  bool get isSecure;
  @override
  TextEditingController get controller;
  @override
  String get hint;
  @override
  @JsonKey(ignore: true)
  _$$_TextFieldModelCopyWith<_$_TextFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}
