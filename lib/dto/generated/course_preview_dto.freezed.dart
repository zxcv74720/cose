// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../course_preview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoursePreviewDto _$CoursePreviewDtoFromJson(Map<String, dynamic> json) {
  return _CoursePreviewDto.fromJson(json);
}

/// @nodoc
mixin _$CoursePreviewDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get previewImagePath => throw _privateConstructorUsedError;
  String get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoursePreviewDtoCopyWith<CoursePreviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursePreviewDtoCopyWith<$Res> {
  factory $CoursePreviewDtoCopyWith(
          CoursePreviewDto value, $Res Function(CoursePreviewDto) then) =
      _$CoursePreviewDtoCopyWithImpl<$Res, CoursePreviewDto>;
  @useResult
  $Res call(
      {int id, String title, String previewImagePath, String lastUpdated});
}

/// @nodoc
class _$CoursePreviewDtoCopyWithImpl<$Res, $Val extends CoursePreviewDto>
    implements $CoursePreviewDtoCopyWith<$Res> {
  _$CoursePreviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? previewImagePath = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoursePreviewDtoImplCopyWith<$Res>
    implements $CoursePreviewDtoCopyWith<$Res> {
  factory _$$CoursePreviewDtoImplCopyWith(_$CoursePreviewDtoImpl value,
          $Res Function(_$CoursePreviewDtoImpl) then) =
      __$$CoursePreviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String title, String previewImagePath, String lastUpdated});
}

/// @nodoc
class __$$CoursePreviewDtoImplCopyWithImpl<$Res>
    extends _$CoursePreviewDtoCopyWithImpl<$Res, _$CoursePreviewDtoImpl>
    implements _$$CoursePreviewDtoImplCopyWith<$Res> {
  __$$CoursePreviewDtoImplCopyWithImpl(_$CoursePreviewDtoImpl _value,
      $Res Function(_$CoursePreviewDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? previewImagePath = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$CoursePreviewDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoursePreviewDtoImpl implements _CoursePreviewDto {
  const _$CoursePreviewDtoImpl(
      {required this.id,
      required this.title,
      required this.previewImagePath,
      required this.lastUpdated});

  factory _$CoursePreviewDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoursePreviewDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String previewImagePath;
  @override
  final String lastUpdated;

  @override
  String toString() {
    return 'CoursePreviewDto(id: $id, title: $title, previewImagePath: $previewImagePath, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursePreviewDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.previewImagePath, previewImagePath) ||
                other.previewImagePath == previewImagePath) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, previewImagePath, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursePreviewDtoImplCopyWith<_$CoursePreviewDtoImpl> get copyWith =>
      __$$CoursePreviewDtoImplCopyWithImpl<_$CoursePreviewDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoursePreviewDtoImplToJson(
      this,
    );
  }
}

abstract class _CoursePreviewDto implements CoursePreviewDto {
  const factory _CoursePreviewDto(
      {required final int id,
      required final String title,
      required final String previewImagePath,
      required final String lastUpdated}) = _$CoursePreviewDtoImpl;

  factory _CoursePreviewDto.fromJson(Map<String, dynamic> json) =
      _$CoursePreviewDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get previewImagePath;
  @override
  String get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$CoursePreviewDtoImplCopyWith<_$CoursePreviewDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
