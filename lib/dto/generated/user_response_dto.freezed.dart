// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) {
  return _UserResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UserResponseDto {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profileImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseDtoCopyWith<UserResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDtoCopyWith<$Res> {
  factory $UserResponseDtoCopyWith(
          UserResponseDto value, $Res Function(UserResponseDto) then) =
      _$UserResponseDtoCopyWithImpl<$Res, UserResponseDto>;
  @useResult
  $Res call({String email, String name, String profileImagePath});
}

/// @nodoc
class _$UserResponseDtoCopyWithImpl<$Res, $Val extends UserResponseDto>
    implements $UserResponseDtoCopyWith<$Res> {
  _$UserResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? profileImagePath = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImagePath: null == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserResponseDtoImplCopyWith<$Res>
    implements $UserResponseDtoCopyWith<$Res> {
  factory _$$UserResponseDtoImplCopyWith(_$UserResponseDtoImpl value,
          $Res Function(_$UserResponseDtoImpl) then) =
      __$$UserResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String name, String profileImagePath});
}

/// @nodoc
class __$$UserResponseDtoImplCopyWithImpl<$Res>
    extends _$UserResponseDtoCopyWithImpl<$Res, _$UserResponseDtoImpl>
    implements _$$UserResponseDtoImplCopyWith<$Res> {
  __$$UserResponseDtoImplCopyWithImpl(
      _$UserResponseDtoImpl _value, $Res Function(_$UserResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? profileImagePath = null,
  }) {
    return _then(_$UserResponseDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImagePath: null == profileImagePath
          ? _value.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDtoImpl implements _UserResponseDto {
  const _$UserResponseDtoImpl(
      {required this.email,
      required this.name,
      required this.profileImagePath});

  factory _$UserResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final String profileImagePath;

  @override
  String toString() {
    return 'UserResponseDto(email: $email, name: $name, profileImagePath: $profileImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, profileImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDtoImplCopyWith<_$UserResponseDtoImpl> get copyWith =>
      __$$UserResponseDtoImplCopyWithImpl<_$UserResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UserResponseDto implements UserResponseDto {
  const factory _UserResponseDto(
      {required final String email,
      required final String name,
      required final String profileImagePath}) = _$UserResponseDtoImpl;

  factory _UserResponseDto.fromJson(Map<String, dynamic> json) =
      _$UserResponseDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  String get profileImagePath;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseDtoImplCopyWith<_$UserResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
