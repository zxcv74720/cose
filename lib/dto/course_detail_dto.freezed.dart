// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseDetailDto _$CourseDetailDtoFromJson(Map<String, dynamic> json) {
  return _CourseDetailDto.fromJson(json);
}

/// @nodoc
mixin _$CourseDetailDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<PlaceResponseDto> get places => throw _privateConstructorUsedError;
  double get cameraLatitude => throw _privateConstructorUsedError;
  double get cameraLongitude => throw _privateConstructorUsedError;
  String get previewImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDetailDtoCopyWith<CourseDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDetailDtoCopyWith<$Res> {
  factory $CourseDetailDtoCopyWith(
          CourseDetailDto value, $Res Function(CourseDetailDto) then) =
      _$CourseDetailDtoCopyWithImpl<$Res, CourseDetailDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      List<PlaceResponseDto> places,
      double cameraLatitude,
      double cameraLongitude,
      String previewImagePath});
}

/// @nodoc
class _$CourseDetailDtoCopyWithImpl<$Res, $Val extends CourseDetailDto>
    implements $CourseDetailDtoCopyWith<$Res> {
  _$CourseDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? places = null,
    Object? cameraLatitude = null,
    Object? cameraLongitude = null,
    Object? previewImagePath = null,
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
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceResponseDto>,
      cameraLatitude: null == cameraLatitude
          ? _value.cameraLatitude
          : cameraLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      cameraLongitude: null == cameraLongitude
          ? _value.cameraLongitude
          : cameraLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDetailDtoImplCopyWith<$Res>
    implements $CourseDetailDtoCopyWith<$Res> {
  factory _$$CourseDetailDtoImplCopyWith(_$CourseDetailDtoImpl value,
          $Res Function(_$CourseDetailDtoImpl) then) =
      __$$CourseDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      List<PlaceResponseDto> places,
      double cameraLatitude,
      double cameraLongitude,
      String previewImagePath});
}

/// @nodoc
class __$$CourseDetailDtoImplCopyWithImpl<$Res>
    extends _$CourseDetailDtoCopyWithImpl<$Res, _$CourseDetailDtoImpl>
    implements _$$CourseDetailDtoImplCopyWith<$Res> {
  __$$CourseDetailDtoImplCopyWithImpl(
      _$CourseDetailDtoImpl _value, $Res Function(_$CourseDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? places = null,
    Object? cameraLatitude = null,
    Object? cameraLongitude = null,
    Object? previewImagePath = null,
  }) {
    return _then(_$CourseDetailDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceResponseDto>,
      cameraLatitude: null == cameraLatitude
          ? _value.cameraLatitude
          : cameraLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      cameraLongitude: null == cameraLongitude
          ? _value.cameraLongitude
          : cameraLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDetailDtoImpl implements _CourseDetailDto {
  const _$CourseDetailDtoImpl(
      {required this.id,
      required this.title,
      required final List<PlaceResponseDto> places,
      required this.cameraLatitude,
      required this.cameraLongitude,
      required this.previewImagePath})
      : _places = places;

  factory _$CourseDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDetailDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  final List<PlaceResponseDto> _places;
  @override
  List<PlaceResponseDto> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  final double cameraLatitude;
  @override
  final double cameraLongitude;
  @override
  final String previewImagePath;

  @override
  String toString() {
    return 'CourseDetailDto(id: $id, title: $title, places: $places, cameraLatitude: $cameraLatitude, cameraLongitude: $cameraLongitude, previewImagePath: $previewImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDetailDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.cameraLatitude, cameraLatitude) ||
                other.cameraLatitude == cameraLatitude) &&
            (identical(other.cameraLongitude, cameraLongitude) ||
                other.cameraLongitude == cameraLongitude) &&
            (identical(other.previewImagePath, previewImagePath) ||
                other.previewImagePath == previewImagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_places),
      cameraLatitude,
      cameraLongitude,
      previewImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDetailDtoImplCopyWith<_$CourseDetailDtoImpl> get copyWith =>
      __$$CourseDetailDtoImplCopyWithImpl<_$CourseDetailDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _CourseDetailDto implements CourseDetailDto {
  const factory _CourseDetailDto(
      {required final int id,
      required final String title,
      required final List<PlaceResponseDto> places,
      required final double cameraLatitude,
      required final double cameraLongitude,
      required final String previewImagePath}) = _$CourseDetailDtoImpl;

  factory _CourseDetailDto.fromJson(Map<String, dynamic> json) =
      _$CourseDetailDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  List<PlaceResponseDto> get places;
  @override
  double get cameraLatitude;
  @override
  double get cameraLongitude;
  @override
  String get previewImagePath;
  @override
  @JsonKey(ignore: true)
  _$$CourseDetailDtoImplCopyWith<_$CourseDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
