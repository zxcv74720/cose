// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseResponseDto _$CourseResponseDtoFromJson(Map<String, dynamic> json) {
  return _CourseResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CourseResponseDto {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<PlaceResponseDto> get places => throw _privateConstructorUsedError;
  List<CourseUserDTO> get members => throw _privateConstructorUsedError;
  double get cameraLatitude => throw _privateConstructorUsedError;
  double get cameraLongitude => throw _privateConstructorUsedError;
  String get previewImagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseResponseDtoCopyWith<CourseResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseDtoCopyWith<$Res> {
  factory $CourseResponseDtoCopyWith(
          CourseResponseDto value, $Res Function(CourseResponseDto) then) =
      _$CourseResponseDtoCopyWithImpl<$Res, CourseResponseDto>;
  @useResult
  $Res call(
      {int id,
      String title,
      List<PlaceResponseDto> places,
      List<CourseUserDTO> members,
      double cameraLatitude,
      double cameraLongitude,
      String previewImagePath});
}

/// @nodoc
class _$CourseResponseDtoCopyWithImpl<$Res, $Val extends CourseResponseDto>
    implements $CourseResponseDtoCopyWith<$Res> {
  _$CourseResponseDtoCopyWithImpl(this._value, this._then);

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
    Object? members = null,
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
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<CourseUserDTO>,
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
abstract class _$$CourseResponseDtoImplCopyWith<$Res>
    implements $CourseResponseDtoCopyWith<$Res> {
  factory _$$CourseResponseDtoImplCopyWith(_$CourseResponseDtoImpl value,
          $Res Function(_$CourseResponseDtoImpl) then) =
      __$$CourseResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      List<PlaceResponseDto> places,
      List<CourseUserDTO> members,
      double cameraLatitude,
      double cameraLongitude,
      String previewImagePath});
}

/// @nodoc
class __$$CourseResponseDtoImplCopyWithImpl<$Res>
    extends _$CourseResponseDtoCopyWithImpl<$Res, _$CourseResponseDtoImpl>
    implements _$$CourseResponseDtoImplCopyWith<$Res> {
  __$$CourseResponseDtoImplCopyWithImpl(_$CourseResponseDtoImpl _value,
      $Res Function(_$CourseResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? places = null,
    Object? members = null,
    Object? cameraLatitude = null,
    Object? cameraLongitude = null,
    Object? previewImagePath = null,
  }) {
    return _then(_$CourseResponseDtoImpl(
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
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<CourseUserDTO>,
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
class _$CourseResponseDtoImpl implements _CourseResponseDto {
  const _$CourseResponseDtoImpl(
      {required this.id,
      required this.title,
      required final List<PlaceResponseDto> places,
      required final List<CourseUserDTO> members,
      required this.cameraLatitude,
      required this.cameraLongitude,
      required this.previewImagePath})
      : _places = places,
        _members = members;

  factory _$CourseResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseDtoImplFromJson(json);

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

  final List<CourseUserDTO> _members;
  @override
  List<CourseUserDTO> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final double cameraLatitude;
  @override
  final double cameraLongitude;
  @override
  final String previewImagePath;

  @override
  String toString() {
    return 'CourseResponseDto(id: $id, title: $title, places: $places, members: $members, cameraLatitude: $cameraLatitude, cameraLongitude: $cameraLongitude, previewImagePath: $previewImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
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
      const DeepCollectionEquality().hash(_members),
      cameraLatitude,
      cameraLongitude,
      previewImagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseDtoImplCopyWith<_$CourseResponseDtoImpl> get copyWith =>
      __$$CourseResponseDtoImplCopyWithImpl<_$CourseResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CourseResponseDto implements CourseResponseDto {
  const factory _CourseResponseDto(
      {required final int id,
      required final String title,
      required final List<PlaceResponseDto> places,
      required final List<CourseUserDTO> members,
      required final double cameraLatitude,
      required final double cameraLongitude,
      required final String previewImagePath}) = _$CourseResponseDtoImpl;

  factory _CourseResponseDto.fromJson(Map<String, dynamic> json) =
      _$CourseResponseDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  List<PlaceResponseDto> get places;
  @override
  List<CourseUserDTO> get members;
  @override
  double get cameraLatitude;
  @override
  double get cameraLongitude;
  @override
  String get previewImagePath;
  @override
  @JsonKey(ignore: true)
  _$$CourseResponseDtoImplCopyWith<_$CourseResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
