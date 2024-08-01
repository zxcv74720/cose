// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../place_preview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlacePreviewDto _$PlacePreviewDtoFromJson(Map<String, dynamic> json) {
  return _PlacePreviewDto.fromJson(json);
}

/// @nodoc
mixin _$PlacePreviewDto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacePreviewDtoCopyWith<PlacePreviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePreviewDtoCopyWith<$Res> {
  factory $PlacePreviewDtoCopyWith(
          PlacePreviewDto value, $Res Function(PlacePreviewDto) then) =
      _$PlacePreviewDtoCopyWithImpl<$Res, PlacePreviewDto>;
  @useResult
  $Res call(
      {String name,
      String url,
      String? category,
      String address,
      double longitude,
      double latitude});
}

/// @nodoc
class _$PlacePreviewDtoCopyWithImpl<$Res, $Val extends PlacePreviewDto>
    implements $PlacePreviewDtoCopyWith<$Res> {
  _$PlacePreviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? category = freezed,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacePreviewDtoImplCopyWith<$Res>
    implements $PlacePreviewDtoCopyWith<$Res> {
  factory _$$PlacePreviewDtoImplCopyWith(_$PlacePreviewDtoImpl value,
          $Res Function(_$PlacePreviewDtoImpl) then) =
      __$$PlacePreviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String url,
      String? category,
      String address,
      double longitude,
      double latitude});
}

/// @nodoc
class __$$PlacePreviewDtoImplCopyWithImpl<$Res>
    extends _$PlacePreviewDtoCopyWithImpl<$Res, _$PlacePreviewDtoImpl>
    implements _$$PlacePreviewDtoImplCopyWith<$Res> {
  __$$PlacePreviewDtoImplCopyWithImpl(
      _$PlacePreviewDtoImpl _value, $Res Function(_$PlacePreviewDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? category = freezed,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_$PlacePreviewDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacePreviewDtoImpl implements _PlacePreviewDto {
  const _$PlacePreviewDtoImpl(
      {required this.name,
      required this.url,
      this.category,
      required this.address,
      required this.longitude,
      required this.latitude});

  factory _$PlacePreviewDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacePreviewDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final String? category;
  @override
  final String address;
  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'PlacePreviewDto(name: $name, url: $url, category: $category, address: $address, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePreviewDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, url, category, address, longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePreviewDtoImplCopyWith<_$PlacePreviewDtoImpl> get copyWith =>
      __$$PlacePreviewDtoImplCopyWithImpl<_$PlacePreviewDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacePreviewDtoImplToJson(
      this,
    );
  }
}

abstract class _PlacePreviewDto implements PlacePreviewDto {
  const factory _PlacePreviewDto(
      {required final String name,
      required final String url,
      final String? category,
      required final String address,
      required final double longitude,
      required final double latitude}) = _$PlacePreviewDtoImpl;

  factory _PlacePreviewDto.fromJson(Map<String, dynamic> json) =
      _$PlacePreviewDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  String? get category;
  @override
  String get address;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(ignore: true)
  _$$PlacePreviewDtoImplCopyWith<_$PlacePreviewDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
