// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthInitial initial() {
    return const _AuthInitial();
  }

  _AuthUnauthenticated unauthenticated() {
    return const _AuthUnauthenticated();
  }

  _AuthAuthenticated authenticated() {
    return const _AuthAuthenticated();
  }

  _AuthFailed failure() {
    return const _AuthFailed();
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$AuthInitialCopyWith<$Res> {
  factory _$AuthInitialCopyWith(
          _AuthInitial value, $Res Function(_AuthInitial) then) =
      __$AuthInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthInitialCopyWith<$Res> {
  __$AuthInitialCopyWithImpl(
      _AuthInitial _value, $Res Function(_AuthInitial) _then)
      : super(_value, (v) => _then(v as _AuthInitial));

  @override
  _AuthInitial get _value => super._value as _AuthInitial;
}

/// @nodoc

class _$_AuthInitial extends _AuthInitial {
  const _$_AuthInitial() : super._();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitial extends AuthState {
  const factory _AuthInitial() = _$_AuthInitial;
  const _AuthInitial._() : super._();
}

/// @nodoc
abstract class _$AuthUnauthenticatedCopyWith<$Res> {
  factory _$AuthUnauthenticatedCopyWith(_AuthUnauthenticated value,
          $Res Function(_AuthUnauthenticated) then) =
      __$AuthUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthUnauthenticatedCopyWith<$Res> {
  __$AuthUnauthenticatedCopyWithImpl(
      _AuthUnauthenticated _value, $Res Function(_AuthUnauthenticated) _then)
      : super(_value, (v) => _then(v as _AuthUnauthenticated));

  @override
  _AuthUnauthenticated get _value => super._value as _AuthUnauthenticated;
}

/// @nodoc

class _$_AuthUnauthenticated extends _AuthUnauthenticated {
  const _$_AuthUnauthenticated() : super._();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() failure,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthUnauthenticated extends AuthState {
  const factory _AuthUnauthenticated() = _$_AuthUnauthenticated;
  const _AuthUnauthenticated._() : super._();
}

/// @nodoc
abstract class _$AuthAuthenticatedCopyWith<$Res> {
  factory _$AuthAuthenticatedCopyWith(
          _AuthAuthenticated value, $Res Function(_AuthAuthenticated) then) =
      __$AuthAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthAuthenticatedCopyWith<$Res> {
  __$AuthAuthenticatedCopyWithImpl(
      _AuthAuthenticated _value, $Res Function(_AuthAuthenticated) _then)
      : super(_value, (v) => _then(v as _AuthAuthenticated));

  @override
  _AuthAuthenticated get _value => super._value as _AuthAuthenticated;
}

/// @nodoc

class _$_AuthAuthenticated extends _AuthAuthenticated {
  const _$_AuthAuthenticated() : super._();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() failure,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticated extends AuthState {
  const factory _AuthAuthenticated() = _$_AuthAuthenticated;
  const _AuthAuthenticated._() : super._();
}

/// @nodoc
abstract class _$AuthFailedCopyWith<$Res> {
  factory _$AuthFailedCopyWith(
          _AuthFailed value, $Res Function(_AuthFailed) then) =
      __$AuthFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthFailedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthFailedCopyWith<$Res> {
  __$AuthFailedCopyWithImpl(
      _AuthFailed _value, $Res Function(_AuthFailed) _then)
      : super(_value, (v) => _then(v as _AuthFailed));

  @override
  _AuthFailed get _value => super._value as _AuthFailed;
}

/// @nodoc

class _$_AuthFailed extends _AuthFailed {
  const _$_AuthFailed() : super._();

  @override
  String toString() {
    return 'AuthState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AuthFailed extends AuthState {
  const factory _AuthFailed() = _$_AuthFailed;
  const _AuthFailed._() : super._();
}
