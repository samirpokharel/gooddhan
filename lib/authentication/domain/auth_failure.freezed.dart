// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  _Searver server(int? status, [String? message]) {
    return _Searver(
      status,
      message,
    );
  }

  _Storage storage() {
    return const _Storage();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? status, String? message) server,
    required TResult Function() storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searver value) server,
    required TResult Function(_Storage value) storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$SearverCopyWith<$Res> {
  factory _$SearverCopyWith(_Searver value, $Res Function(_Searver) then) =
      __$SearverCopyWithImpl<$Res>;
  $Res call({int? status, String? message});
}

/// @nodoc
class __$SearverCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$SearverCopyWith<$Res> {
  __$SearverCopyWithImpl(_Searver _value, $Res Function(_Searver) _then)
      : super(_value, (v) => _then(v as _Searver));

  @override
  _Searver get _value => super._value as _Searver;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_Searver(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Searver extends _Searver {
  const _$_Searver(this.status, [this.message]) : super._();

  @override
  final int? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthFailure.server(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Searver &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SearverCopyWith<_Searver> get copyWith =>
      __$SearverCopyWithImpl<_Searver>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? status, String? message) server,
    required TResult Function() storage,
  }) {
    return server(status, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
  }) {
    return server?.call(status, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(status, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searver value) server,
    required TResult Function(_Storage value) storage,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Searver extends AuthFailure {
  const factory _Searver(int? status, [String? message]) = _$_Searver;
  const _Searver._() : super._();

  int? get status;
  String? get message;
  @JsonKey(ignore: true)
  _$SearverCopyWith<_Searver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StorageCopyWith<$Res> {
  factory _$StorageCopyWith(_Storage value, $Res Function(_Storage) then) =
      __$StorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$StorageCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$StorageCopyWith<$Res> {
  __$StorageCopyWithImpl(_Storage _value, $Res Function(_Storage) _then)
      : super(_value, (v) => _then(v as _Storage));

  @override
  _Storage get _value => super._value as _Storage;
}

/// @nodoc

class _$_Storage extends _Storage {
  const _$_Storage() : super._();

  @override
  String toString() {
    return 'AuthFailure.storage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Storage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? status, String? message) server,
    required TResult Function() storage,
  }) {
    return storage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
  }) {
    return storage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? status, String? message)? server,
    TResult Function()? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searver value) server,
    required TResult Function(_Storage value) storage,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searver value)? server,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class _Storage extends AuthFailure {
  const factory _Storage() = _$_Storage;
  const _Storage._() : super._();
}
