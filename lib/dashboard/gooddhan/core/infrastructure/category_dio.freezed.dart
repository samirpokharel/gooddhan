// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_dio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDTO.fromJson(json);
}

/// @nodoc
class _$CategoryDTOTearOff {
  const _$CategoryDTOTearOff();

  _CategoryDTO call(
      {required String categoryName,
      @JsonKey(name: "_id") required String id}) {
    return _CategoryDTO(
      categoryName: categoryName,
      id: id,
    );
  }

  CategoryDTO fromJson(Map<String, Object?> json) {
    return CategoryDTO.fromJson(json);
  }
}

/// @nodoc
const $CategoryDTO = _$CategoryDTOTearOff();

/// @nodoc
mixin _$CategoryDTO {
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDTOCopyWith<CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDTOCopyWith<$Res> {
  factory $CategoryDTOCopyWith(
          CategoryDTO value, $Res Function(CategoryDTO) then) =
      _$CategoryDTOCopyWithImpl<$Res>;
  $Res call({String categoryName, @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$CategoryDTOCopyWithImpl<$Res> implements $CategoryDTOCopyWith<$Res> {
  _$CategoryDTOCopyWithImpl(this._value, this._then);

  final CategoryDTO _value;
  // ignore: unused_field
  final $Res Function(CategoryDTO) _then;

  @override
  $Res call({
    Object? categoryName = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CategoryDTOCopyWith<$Res>
    implements $CategoryDTOCopyWith<$Res> {
  factory _$CategoryDTOCopyWith(
          _CategoryDTO value, $Res Function(_CategoryDTO) then) =
      __$CategoryDTOCopyWithImpl<$Res>;
  @override
  $Res call({String categoryName, @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$CategoryDTOCopyWithImpl<$Res> extends _$CategoryDTOCopyWithImpl<$Res>
    implements _$CategoryDTOCopyWith<$Res> {
  __$CategoryDTOCopyWithImpl(
      _CategoryDTO _value, $Res Function(_CategoryDTO) _then)
      : super(_value, (v) => _then(v as _CategoryDTO));

  @override
  _CategoryDTO get _value => super._value as _CategoryDTO;

  @override
  $Res call({
    Object? categoryName = freezed,
    Object? id = freezed,
  }) {
    return _then(_CategoryDTO(
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryDTO extends _CategoryDTO {
  const _$_CategoryDTO(
      {required this.categoryName, @JsonKey(name: "_id") required this.id})
      : super._();

  factory _$_CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryDTOFromJson(json);

  @override
  final String categoryName;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'CategoryDTO(categoryName: $categoryName, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDTO &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$CategoryDTOCopyWith<_CategoryDTO> get copyWith =>
      __$CategoryDTOCopyWithImpl<_CategoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDTOToJson(this);
  }
}

abstract class _CategoryDTO extends CategoryDTO {
  const factory _CategoryDTO(
      {required String categoryName,
      @JsonKey(name: "_id") required String id}) = _$_CategoryDTO;
  const _CategoryDTO._() : super._();

  factory _CategoryDTO.fromJson(Map<String, dynamic> json) =
      _$_CategoryDTO.fromJson;

  @override
  String get categoryName;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$CategoryDTOCopyWith<_CategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
