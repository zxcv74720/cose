// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceResponseDto _$PlaceResponseDtoFromJson(Map<String, dynamic> json) {
  return _PlaceResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceResponseDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  int get placeOrder => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceResponseDtoCopyWith<PlaceResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceResponseDtoCopyWith<$Res> {
  factory $PlaceResponseDtoCopyWith(
          PlaceResponseDto value, $Res Function(PlaceResponseDto) then) =
      _$PlaceResponseDtoCopyWithImpl<$Res, PlaceResponseDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String url,
      String category,
      String address,
      double longitude,
      double latitude,
      int placeOrder,
      String content});
}

/// @nodoc
class _$PlaceResponseDtoCopyWithImpl<$Res, $Val extends PlaceResponseDto>
    implements $PlaceResponseDtoCopyWith<$Res> {
  _$PlaceResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? category = null,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? placeOrder = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      placeOrder: null == placeOrder
          ? _value.placeOrder
          : placeOrder // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceResponseDtoImplCopyWith<$Res>
    implements $PlaceResponseDtoCopyWith<$Res> {
  factory _$$PlaceResponseDtoImplCopyWith(_$PlaceResponseDtoImpl value,
          $Res Function(_$PlaceResponseDtoImpl) then) =
      __$$PlaceResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String url,
      String category,
      String address,
      double longitude,
      double latitude,
      int placeOrder,
      String content});
}

/// @nodoc
class __$$PlaceResponseDtoImplCopyWithImpl<$Res>
    extends _$PlaceResponseDtoCopyWithImpl<$Res, _$PlaceResponseDtoImpl>
    implements _$$PlaceResponseDtoImplCopyWith<$Res> {
  __$$PlaceResponseDtoImplCopyWithImpl(_$PlaceResponseDtoImpl _value,
      $Res Function(_$PlaceResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? category = null,
    Object? address = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? placeOrder = null,
    Object? content = null,
  }) {
    return _then(_$PlaceResponseDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      placeOrder: null == placeOrder
          ? _value.placeOrder
          : placeOrder // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceResponseDtoImpl extends _PlaceResponseDto {
  const _$PlaceResponseDtoImpl(
      {required this.id,
      required this.name,
      required this.url,
      required this.category,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.placeOrder,
      required this.content})
      : super._();

  factory _$PlaceResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceResponseDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String category;
  @override
  final String address;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final int placeOrder;
  @override
  final String content;

  @override
  String toString() {
    return 'PlaceResponseDto(id: $id, name: $name, url: $url, category: $category, address: $address, longitude: $longitude, latitude: $latitude, placeOrder: $placeOrder, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.placeOrder, placeOrder) ||
                other.placeOrder == placeOrder) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, category, address,
      longitude, latitude, placeOrder, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceResponseDtoImplCopyWith<_$PlaceResponseDtoImpl> get copyWith =>
      __$$PlaceResponseDtoImplCopyWithImpl<_$PlaceResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PlaceResponseDto extends PlaceResponseDto {
  const factory _PlaceResponseDto(
      {required final int id,
      required final String name,
      required final String url,
      required final String category,
      required final String address,
      required final double longitude,
      required final double latitude,
      required final int placeOrder,
      required final String content}) = _$PlaceResponseDtoImpl;
  const _PlaceResponseDto._() : super._();

  factory _PlaceResponseDto.fromJson(Map<String, dynamic> json) =
      _$PlaceResponseDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get url;
  @override
  String get category;
  @override
  String get address;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  int get placeOrder;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$PlaceResponseDtoImplCopyWith<_$PlaceResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
