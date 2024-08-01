// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../course_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseUserDTO _$CourseUserDTOFromJson(Map<String, dynamic> json) {
  return _CourseUserDTO.fromJson(json);
}

/// @nodoc
mixin _$CourseUserDTO {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profileImagePath => throw _privateConstructorUsedError;
  EditPermission get editPermission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseUserDTOCopyWith<CourseUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseUserDTOCopyWith<$Res> {
  factory $CourseUserDTOCopyWith(
          CourseUserDTO value, $Res Function(CourseUserDTO) then) =
      _$CourseUserDTOCopyWithImpl<$Res, CourseUserDTO>;
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String profileImagePath,
      EditPermission editPermission});
}

/// @nodoc
class _$CourseUserDTOCopyWithImpl<$Res, $Val extends CourseUserDTO>
    implements $CourseUserDTOCopyWith<$Res> {
  _$CourseUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? profileImagePath = null,
    Object? editPermission = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      editPermission: null == editPermission
          ? _value.editPermission
          : editPermission // ignore: cast_nullable_to_non_nullable
              as EditPermission,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseUserDTOImplCopyWith<$Res>
    implements $CourseUserDTOCopyWith<$Res> {
  factory _$$CourseUserDTOImplCopyWith(
          _$CourseUserDTOImpl value, $Res Function(_$CourseUserDTOImpl) then) =
      __$$CourseUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String profileImagePath,
      EditPermission editPermission});
}

/// @nodoc
class __$$CourseUserDTOImplCopyWithImpl<$Res>
    extends _$CourseUserDTOCopyWithImpl<$Res, _$CourseUserDTOImpl>
    implements _$$CourseUserDTOImplCopyWith<$Res> {
  __$$CourseUserDTOImplCopyWithImpl(
      _$CourseUserDTOImpl _value, $Res Function(_$CourseUserDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? profileImagePath = null,
    Object? editPermission = null,
  }) {
    return _then(_$CourseUserDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      editPermission: null == editPermission
          ? _value.editPermission
          : editPermission // ignore: cast_nullable_to_non_nullable
              as EditPermission,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseUserDTOImpl implements _CourseUserDTO {
  const _$CourseUserDTOImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.profileImagePath,
      required this.editPermission});

  factory _$CourseUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseUserDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String profileImagePath;
  @override
  final EditPermission editPermission;

  @override
  String toString() {
    return 'CourseUserDTO(id: $id, email: $email, name: $name, profileImagePath: $profileImagePath, editPermission: $editPermission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseUserDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath) &&
            (identical(other.editPermission, editPermission) ||
                other.editPermission == editPermission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, name, profileImagePath, editPermission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseUserDTOImplCopyWith<_$CourseUserDTOImpl> get copyWith =>
      __$$CourseUserDTOImplCopyWithImpl<_$CourseUserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseUserDTOImplToJson(
      this,
    );
  }
}

abstract class _CourseUserDTO implements CourseUserDTO {
  const factory _CourseUserDTO(
      {required final int id,
      required final String email,
      required final String name,
      required final String profileImagePath,
      required final EditPermission editPermission}) = _$CourseUserDTOImpl;

  factory _CourseUserDTO.fromJson(Map<String, dynamic> json) =
      _$CourseUserDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String get profileImagePath;
  @override
  EditPermission get editPermission;
  @override
  @JsonKey(ignore: true)
  _$$CourseUserDTOImplCopyWith<_$CourseUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
