// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrencyTearOff {
  const _$CurrencyTearOff();

  _Currency call(
      {required String code,
      required String name,
      required String pluralName,
      required String symbol,
      required String flag}) {
    return _Currency(
      code: code,
      name: name,
      pluralName: pluralName,
      symbol: symbol,
      flag: flag,
    );
  }
}

/// @nodoc
const $Currency = _$CurrencyTearOff();

/// @nodoc
mixin _$Currency {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pluralName => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res>;
  $Res call(
      {String code,
      String name,
      String pluralName,
      String symbol,
      String flag});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res> implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  final Currency _value;
  // ignore: unused_field
  final $Res Function(Currency) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? pluralName = freezed,
    Object? symbol = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pluralName: pluralName == freezed
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$CurrencyCopyWith(_Currency value, $Res Function(_Currency) then) =
      __$CurrencyCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      String name,
      String pluralName,
      String symbol,
      String flag});
}

/// @nodoc
class __$CurrencyCopyWithImpl<$Res> extends _$CurrencyCopyWithImpl<$Res>
    implements _$CurrencyCopyWith<$Res> {
  __$CurrencyCopyWithImpl(_Currency _value, $Res Function(_Currency) _then)
      : super(_value, (v) => _then(v as _Currency));

  @override
  _Currency get _value => super._value as _Currency;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? pluralName = freezed,
    Object? symbol = freezed,
    Object? flag = freezed,
  }) {
    return _then(_Currency(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pluralName: pluralName == freezed
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Currency with DiagnosticableTreeMixin implements _Currency {
  _$_Currency(
      {required this.code,
      required this.name,
      required this.pluralName,
      required this.symbol,
      required this.flag});

  @override
  final String code;
  @override
  final String name;
  @override
  final String pluralName;
  @override
  final String symbol;
  @override
  final String flag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Currency(code: $code, name: $name, pluralName: $pluralName, symbol: $symbol, flag: $flag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Currency'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('pluralName', pluralName))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('flag', flag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Currency &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.pluralName, pluralName) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.flag, flag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(pluralName),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(flag));

  @JsonKey(ignore: true)
  @override
  _$CurrencyCopyWith<_Currency> get copyWith =>
      __$CurrencyCopyWithImpl<_Currency>(this, _$identity);
}

abstract class _Currency implements Currency {
  factory _Currency(
      {required String code,
      required String name,
      required String pluralName,
      required String symbol,
      required String flag}) = _$_Currency;

  @override
  String get code;
  @override
  String get name;
  @override
  String get pluralName;
  @override
  String get symbol;
  @override
  String get flag;
  @override
  @JsonKey(ignore: true)
  _$CurrencyCopyWith<_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}
