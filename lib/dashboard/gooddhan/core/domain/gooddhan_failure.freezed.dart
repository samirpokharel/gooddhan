// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gooddhan_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GooddhanFailureTearOff {
  const _$GooddhanFailureTearOff();

  _API api(int? statusCode, [String? message]) {
    return _API(
      statusCode,
      message,
    );
  }
}

/// @nodoc
const $GooddhanFailure = _$GooddhanFailureTearOff();

/// @nodoc
mixin _$GooddhanFailure {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode, String? message) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? statusCode, String? message)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode, String? message)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_API value) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_API value)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_API value)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GooddhanFailureCopyWith<GooddhanFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooddhanFailureCopyWith<$Res> {
  factory $GooddhanFailureCopyWith(
          GooddhanFailure value, $Res Function(GooddhanFailure) then) =
      _$GooddhanFailureCopyWithImpl<$Res>;
  $Res call({int? statusCode, String? message});
}

/// @nodoc
class _$GooddhanFailureCopyWithImpl<$Res>
    implements $GooddhanFailureCopyWith<$Res> {
  _$GooddhanFailureCopyWithImpl(this._value, this._then);

  final GooddhanFailure _value;
  // ignore: unused_field
  final $Res Function(GooddhanFailure) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$APICopyWith<$Res> implements $GooddhanFailureCopyWith<$Res> {
  factory _$APICopyWith(_API value, $Res Function(_API) then) =
      __$APICopyWithImpl<$Res>;
  @override
  $Res call({int? statusCode, String? message});
}

/// @nodoc
class __$APICopyWithImpl<$Res> extends _$GooddhanFailureCopyWithImpl<$Res>
    implements _$APICopyWith<$Res> {
  __$APICopyWithImpl(_API _value, $Res Function(_API) _then)
      : super(_value, (v) => _then(v as _API));

  @override
  _API get _value => super._value as _API;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_API(
      statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_API extends _API {
  const _$_API(this.statusCode, [this.message]) : super._();

  @override
  final int? statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'GooddhanFailure.api(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _API &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$APICopyWith<_API> get copyWith =>
      __$APICopyWithImpl<_API>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode, String? message) api,
  }) {
    return api(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? statusCode, String? message)? api,
  }) {
    return api?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode, String? message)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(statusCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_API value) api,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_API value)? api,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_API value)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class _API extends GooddhanFailure {
  const factory _API(int? statusCode, [String? message]) = _$_API;
  const _API._() : super._();

  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$APICopyWith<_API> get copyWith => throw _privateConstructorUsedError;
}
