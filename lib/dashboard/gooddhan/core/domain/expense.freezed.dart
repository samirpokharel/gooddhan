// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExpenseTearOff {
  const _$ExpenseTearOff();

  _Expense call(
      {required String title,
      required String id,
      required Category category,
      required Currency currency,
      required num amount,
      required DateTime createdAt,
      required DateTime updatedAt}) {
    return _Expense(
      title: title,
      id: id,
      category: category,
      currency: currency,
      amount: amount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// @nodoc
const $Expense = _$ExpenseTearOff();

/// @nodoc
mixin _$Expense {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String id,
      Category category,
      Currency currency,
      num amount,
      DateTime createdAt,
      DateTime updatedAt});

  $CategoryCopyWith<$Res> get category;
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res> implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  final Expense _value;
  // ignore: unused_field
  final $Res Function(Expense) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? category = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
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
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value));
    });
  }
}

/// @nodoc
abstract class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) then) =
      __$ExpenseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String id,
      Category category,
      Currency currency,
      num amount,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$ExpenseCopyWithImpl<$Res> extends _$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(_Expense _value, $Res Function(_Expense) _then)
      : super(_value, (v) => _then(v as _Expense));

  @override
  _Expense get _value => super._value as _Expense;

  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? category = freezed,
    Object? currency = freezed,
    Object? amount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Expense(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
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

class _$_Expense extends _Expense {
  const _$_Expense(
      {required this.title,
      required this.id,
      required this.category,
      required this.currency,
      required this.amount,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  @override
  final String title;
  @override
  final String id;
  @override
  final Category category;
  @override
  final Currency currency;
  @override
  final num amount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Expense(title: $title, id: $id, category: $category, currency: $currency, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Expense &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$ExpenseCopyWith<_Expense> get copyWith =>
      __$ExpenseCopyWithImpl<_Expense>(this, _$identity);
}

abstract class _Expense extends Expense {
  const factory _Expense(
      {required String title,
      required String id,
      required Category category,
      required Currency currency,
      required num amount,
      required DateTime createdAt,
      required DateTime updatedAt}) = _$_Expense;
  const _Expense._() : super._();

  @override
  String get title;
  @override
  String get id;
  @override
  Category get category;
  @override
  Currency get currency;
  @override
  num get amount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$ExpenseCopyWith<_Expense> get copyWith =>
      throw _privateConstructorUsedError;
}
