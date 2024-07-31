// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginStatus _$LoginStatusFromJson(Map<String, dynamic> json) {
  return _LoginStatus.fromJson(json);
}

/// @nodoc
mixin _$LoginStatus {
  bool get loginStatus => throw _privateConstructorUsedError;
  LoginPlatform get loginPlatform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginStatusCopyWith<LoginStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStatusCopyWith<$Res> {
  factory $LoginStatusCopyWith(
          LoginStatus value, $Res Function(LoginStatus) then) =
      _$LoginStatusCopyWithImpl<$Res, LoginStatus>;
  @useResult
  $Res call({bool loginStatus, LoginPlatform loginPlatform});
}

/// @nodoc
class _$LoginStatusCopyWithImpl<$Res, $Val extends LoginStatus>
    implements $LoginStatusCopyWith<$Res> {
  _$LoginStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? loginPlatform = null,
  }) {
    return _then(_value.copyWith(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      loginPlatform: null == loginPlatform
          ? _value.loginPlatform
          : loginPlatform // ignore: cast_nullable_to_non_nullable
              as LoginPlatform,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStatusImplCopyWith<$Res>
    implements $LoginStatusCopyWith<$Res> {
  factory _$$LoginStatusImplCopyWith(
          _$LoginStatusImpl value, $Res Function(_$LoginStatusImpl) then) =
      __$$LoginStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loginStatus, LoginPlatform loginPlatform});
}

/// @nodoc
class __$$LoginStatusImplCopyWithImpl<$Res>
    extends _$LoginStatusCopyWithImpl<$Res, _$LoginStatusImpl>
    implements _$$LoginStatusImplCopyWith<$Res> {
  __$$LoginStatusImplCopyWithImpl(
      _$LoginStatusImpl _value, $Res Function(_$LoginStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? loginPlatform = null,
  }) {
    return _then(_$LoginStatusImpl(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      loginPlatform: null == loginPlatform
          ? _value.loginPlatform
          : loginPlatform // ignore: cast_nullable_to_non_nullable
              as LoginPlatform,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginStatusImpl implements _LoginStatus {
  const _$LoginStatusImpl(
      {required this.loginStatus, required this.loginPlatform});

  factory _$LoginStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginStatusImplFromJson(json);

  @override
  final bool loginStatus;
  @override
  final LoginPlatform loginPlatform;

  @override
  String toString() {
    return 'LoginStatus(loginStatus: $loginStatus, loginPlatform: $loginPlatform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStatusImpl &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.loginPlatform, loginPlatform) ||
                other.loginPlatform == loginPlatform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loginStatus, loginPlatform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStatusImplCopyWith<_$LoginStatusImpl> get copyWith =>
      __$$LoginStatusImplCopyWithImpl<_$LoginStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginStatusImplToJson(
      this,
    );
  }
}

abstract class _LoginStatus implements LoginStatus {
  const factory _LoginStatus(
      {required final bool loginStatus,
      required final LoginPlatform loginPlatform}) = _$LoginStatusImpl;

  factory _LoginStatus.fromJson(Map<String, dynamic> json) =
      _$LoginStatusImpl.fromJson;

  @override
  bool get loginStatus;
  @override
  LoginPlatform get loginPlatform;
  @override
  @JsonKey(ignore: true)
  _$$LoginStatusImplCopyWith<_$LoginStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
