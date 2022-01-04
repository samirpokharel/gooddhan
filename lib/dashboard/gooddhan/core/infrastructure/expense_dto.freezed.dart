// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expense_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseDTO _$ExpenseDTOFromJson(Map<String, dynamic> json) {
  return _ExpenseDTO.fromJson(json);
}

/// @nodoc
class _$ExpenseDTOTearOff {
  const _$ExpenseDTOTearOff();

  _ExpenseDTO call(
      {@JsonKey(name: "_id") required String id,
      required String title,
      required CategoryDTO category,
      required num amount,
      required DateTime createdAt,
      required DateTime updatedAt}) {
    return _ExpenseDTO(
      id: id,
      title: title,
      category: category,
      amount: amount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  ExpenseDTO fromJson(Map<String, Object?> json) {
    return ExpenseDTO.fromJson(json);
  }
}

/// @nodoc
const $ExpenseDTO = _$ExpenseDTOTearOff();

/// @nodoc
mixin _$ExpenseDTO {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  CategoryDTO get category => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseDTOCopyWith<ExpenseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDTOCopyWith<$Res> {
  factory $ExpenseDTOCopyWith(
          ExpenseDTO value, $Res Function(ExpenseDTO) then) =
      _$ExpenseDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "_id") String id,
      String title,
      CategoryDTO category,
      num amount,
      DateTime createdAt,
      DateTime updatedAt});

  $CategoryDTOCopyWith<$Res> get category;
}

/// @nodoc
class _$ExpenseDTOCopyWithImpl<$Res> implements $ExpenseDTOCopyWith<$Res> {
  _$ExpenseDTOCopyWithImpl(this._value, this._then);

  final ExpenseDTO _value;
  // ignore: unused_field
  final $Res Function(ExpenseDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $CategoryDTOCopyWith<$Res> get category {
    return $CategoryDTOCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$ExpenseDTOCopyWith<$Res> implements $ExpenseDTOCopyWith<$Res> {
  factory _$ExpenseDTOCopyWith(
          _ExpenseDTO value, $Res Function(_ExpenseDTO) then) =
      __$ExpenseDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "_id") String id,
      String title,
      CategoryDTO category,
      num amount,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $CategoryDTOCopyWith<$Res> get category;
}

/// @nodoc
class __$ExpenseDTOCopyWithImpl<$Res> extends _$ExpenseDTOCopyWithImpl<$Res>
    implements _$ExpenseDTOCopyWith<$Res> {
  __$ExpenseDTOCopyWithImpl(
      _ExpenseDTO _value, $Res Function(_ExpenseDTO) _then)
      : super(_value, (v) => _then(v as _ExpenseDTO));

  @override
  _ExpenseDTO get _value => super._value as _ExpenseDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_ExpenseDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseDTO extends _ExpenseDTO {
  const _$_ExpenseDTO(
      {@JsonKey(name: "_id") required this.id,
      required this.title,
      required this.category,
      required this.amount,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$_ExpenseDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseDTOFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String title;
  @override
  final CategoryDTO category;
  @override
  final num amount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ExpenseDTO(id: $id, title: $title, category: $category, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$ExpenseDTOCopyWith<_ExpenseDTO> get copyWith =>
      __$ExpenseDTOCopyWithImpl<_ExpenseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseDTOToJson(this);
  }
}

abstract class _ExpenseDTO extends ExpenseDTO {
  const factory _ExpenseDTO(
      {@JsonKey(name: "_id") required String id,
      required String title,
      required CategoryDTO category,
      required num amount,
      required DateTime createdAt,
      required DateTime updatedAt}) = _$_ExpenseDTO;
  const _ExpenseDTO._() : super._();

  factory _ExpenseDTO.fromJson(Map<String, dynamic> json) =
      _$_ExpenseDTO.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get title;
  @override
  CategoryDTO get category;
  @override
  num get amount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$ExpenseDTOCopyWith<_ExpenseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
