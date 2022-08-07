// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserForgotPassword _$UserForgotPasswordFromJson(Map<String, dynamic> json) {
  return _UserForgotPassword.fromJson(json);
}

/// @nodoc
mixin _$UserForgotPassword {
  String get password => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserForgotPasswordCopyWith<UserForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserForgotPasswordCopyWith<$Res> {
  factory $UserForgotPasswordCopyWith(
          UserForgotPassword value, $Res Function(UserForgotPassword) then) =
      _$UserForgotPasswordCopyWithImpl<$Res>;
  $Res call({String password, int updatedAt});
}

/// @nodoc
class _$UserForgotPasswordCopyWithImpl<$Res>
    implements $UserForgotPasswordCopyWith<$Res> {
  _$UserForgotPasswordCopyWithImpl(this._value, this._then);

  final UserForgotPassword _value;
  // ignore: unused_field
  final $Res Function(UserForgotPassword) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_UserForgotPasswordCopyWith<$Res>
    implements $UserForgotPasswordCopyWith<$Res> {
  factory _$$_UserForgotPasswordCopyWith(_$_UserForgotPassword value,
          $Res Function(_$_UserForgotPassword) then) =
      __$$_UserForgotPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String password, int updatedAt});
}

/// @nodoc
class __$$_UserForgotPasswordCopyWithImpl<$Res>
    extends _$UserForgotPasswordCopyWithImpl<$Res>
    implements _$$_UserForgotPasswordCopyWith<$Res> {
  __$$_UserForgotPasswordCopyWithImpl(
      _$_UserForgotPassword _value, $Res Function(_$_UserForgotPassword) _then)
      : super(_value, (v) => _then(v as _$_UserForgotPassword));

  @override
  _$_UserForgotPassword get _value => super._value as _$_UserForgotPassword;

  @override
  $Res call({
    Object? password = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserForgotPassword(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserForgotPassword implements _UserForgotPassword {
  const _$_UserForgotPassword(
      {required this.password, required this.updatedAt});

  factory _$_UserForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$$_UserForgotPasswordFromJson(json);

  @override
  final String password;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'UserForgotPassword(password: $password, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserForgotPassword &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_UserForgotPasswordCopyWith<_$_UserForgotPassword> get copyWith =>
      __$$_UserForgotPasswordCopyWithImpl<_$_UserForgotPassword>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserForgotPasswordToJson(
      this,
    );
  }
}

abstract class _UserForgotPassword implements UserForgotPassword {
  const factory _UserForgotPassword(
      {required final String password,
      required final int updatedAt}) = _$_UserForgotPassword;

  factory _UserForgotPassword.fromJson(Map<String, dynamic> json) =
      _$_UserForgotPassword.fromJson;

  @override
  String get password;
  @override
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserForgotPasswordCopyWith<_$_UserForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
