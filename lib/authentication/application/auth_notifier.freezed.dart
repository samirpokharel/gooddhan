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

  _AuthInitial initial({AuthStatus? status = AuthStatus.ideal}) {
    return _AuthInitial(
      status: status,
    );
  }

  _AuthUnauthenticated unauthenticated(
      {AuthStatus? status = AuthStatus.ideal}) {
    return _AuthUnauthenticated(
      status: status,
    );
  }

  _AuthAuthenticated authenticated(
      {AuthStatus? status = AuthStatus.ideal, required User user}) {
    return _AuthAuthenticated(
      status: status,
      user: user,
    );
  }

  _AuthFailed failure(AuthFailure failure,
      {AuthStatus? status = AuthStatus.ideal}) {
    return _AuthFailed(
      failure,
      status: status,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  AuthStatus? get status => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status) initial,
    required TResult Function(AuthStatus? status) unauthenticated,
    required TResult Function(AuthStatus? status, User user) authenticated,
    required TResult Function(AuthFailure failure, AuthStatus? status) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
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

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call({AuthStatus? status});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }
}

/// @nodoc
abstract class _$AuthInitialCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthInitialCopyWith(
          _AuthInitial value, $Res Function(_AuthInitial) then) =
      __$AuthInitialCopyWithImpl<$Res>;
  @override
  $Res call({AuthStatus? status});
}

/// @nodoc
class __$AuthInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthInitialCopyWith<$Res> {
  __$AuthInitialCopyWithImpl(
      _AuthInitial _value, $Res Function(_AuthInitial) _then)
      : super(_value, (v) => _then(v as _AuthInitial));

  @override
  _AuthInitial get _value => super._value as _AuthInitial;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_AuthInitial(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }
}

/// @nodoc

class _$_AuthInitial extends _AuthInitial {
  const _$_AuthInitial({this.status = AuthStatus.ideal}) : super._();

  @JsonKey()
  @override
  final AuthStatus? status;

  @override
  String toString() {
    return 'AuthState.initial(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthInitial &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$AuthInitialCopyWith<_AuthInitial> get copyWith =>
      __$AuthInitialCopyWithImpl<_AuthInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status) initial,
    required TResult Function(AuthStatus? status) unauthenticated,
    required TResult Function(AuthStatus? status, User user) authenticated,
    required TResult Function(AuthFailure failure, AuthStatus? status) failure,
  }) {
    return initial(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
  }) {
    return initial?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(status);
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
  const factory _AuthInitial({AuthStatus? status}) = _$_AuthInitial;
  const _AuthInitial._() : super._();

  @override
  AuthStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$AuthInitialCopyWith<_AuthInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthUnauthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthUnauthenticatedCopyWith(_AuthUnauthenticated value,
          $Res Function(_AuthUnauthenticated) then) =
      __$AuthUnauthenticatedCopyWithImpl<$Res>;
  @override
  $Res call({AuthStatus? status});
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

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_AuthUnauthenticated(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }
}

/// @nodoc

class _$_AuthUnauthenticated extends _AuthUnauthenticated {
  const _$_AuthUnauthenticated({this.status = AuthStatus.ideal}) : super._();

  @JsonKey()
  @override
  final AuthStatus? status;

  @override
  String toString() {
    return 'AuthState.unauthenticated(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthUnauthenticated &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$AuthUnauthenticatedCopyWith<_AuthUnauthenticated> get copyWith =>
      __$AuthUnauthenticatedCopyWithImpl<_AuthUnauthenticated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status) initial,
    required TResult Function(AuthStatus? status) unauthenticated,
    required TResult Function(AuthStatus? status, User user) authenticated,
    required TResult Function(AuthFailure failure, AuthStatus? status) failure,
  }) {
    return unauthenticated(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
  }) {
    return unauthenticated?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(status);
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
  const factory _AuthUnauthenticated({AuthStatus? status}) =
      _$_AuthUnauthenticated;
  const _AuthUnauthenticated._() : super._();

  @override
  AuthStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$AuthUnauthenticatedCopyWith<_AuthUnauthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthAuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthAuthenticatedCopyWith(
          _AuthAuthenticated value, $Res Function(_AuthAuthenticated) then) =
      __$AuthAuthenticatedCopyWithImpl<$Res>;
  @override
  $Res call({AuthStatus? status, User user});

  $UserCopyWith<$Res> get user;
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

  @override
  $Res call({
    Object? status = freezed,
    Object? user = freezed,
  }) {
    return _then(_AuthAuthenticated(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_AuthAuthenticated extends _AuthAuthenticated {
  const _$_AuthAuthenticated(
      {this.status = AuthStatus.ideal, required this.user})
      : super._();

  @JsonKey()
  @override
  final AuthStatus? status;
  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(status: $status, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthAuthenticated &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$AuthAuthenticatedCopyWith<_AuthAuthenticated> get copyWith =>
      __$AuthAuthenticatedCopyWithImpl<_AuthAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status) initial,
    required TResult Function(AuthStatus? status) unauthenticated,
    required TResult Function(AuthStatus? status, User user) authenticated,
    required TResult Function(AuthFailure failure, AuthStatus? status) failure,
  }) {
    return authenticated(status, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
  }) {
    return authenticated?.call(status, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(status, user);
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
  const factory _AuthAuthenticated({AuthStatus? status, required User user}) =
      _$_AuthAuthenticated;
  const _AuthAuthenticated._() : super._();

  @override
  AuthStatus? get status;
  User get user;
  @override
  @JsonKey(ignore: true)
  _$AuthAuthenticatedCopyWith<_AuthAuthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthFailedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthFailedCopyWith(
          _AuthFailed value, $Res Function(_AuthFailed) then) =
      __$AuthFailedCopyWithImpl<$Res>;
  @override
  $Res call({AuthFailure failure, AuthStatus? status});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$AuthFailedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthFailedCopyWith<$Res> {
  __$AuthFailedCopyWithImpl(
      _AuthFailed _value, $Res Function(_AuthFailed) _then)
      : super(_value, (v) => _then(v as _AuthFailed));

  @override
  _AuthFailed get _value => super._value as _AuthFailed;

  @override
  $Res call({
    Object? failure = freezed,
    Object? status = freezed,
  }) {
    return _then(_AuthFailed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failure {
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_AuthFailed extends _AuthFailed {
  const _$_AuthFailed(this.failure, {this.status = AuthStatus.ideal})
      : super._();

  @override
  final AuthFailure failure;
  @JsonKey()
  @override
  final AuthStatus? status;

  @override
  String toString() {
    return 'AuthState.failure(failure: $failure, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthFailed &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$AuthFailedCopyWith<_AuthFailed> get copyWith =>
      __$AuthFailedCopyWithImpl<_AuthFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status) initial,
    required TResult Function(AuthStatus? status) unauthenticated,
    required TResult Function(AuthStatus? status, User user) authenticated,
    required TResult Function(AuthFailure failure, AuthStatus? status) failure,
  }) {
    return failure(this.failure, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
  }) {
    return failure?.call(this.failure, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status)? initial,
    TResult Function(AuthStatus? status)? unauthenticated,
    TResult Function(AuthStatus? status, User user)? authenticated,
    TResult Function(AuthFailure failure, AuthStatus? status)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, status);
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
  const factory _AuthFailed(AuthFailure failure, {AuthStatus? status}) =
      _$_AuthFailed;
  const _AuthFailed._() : super._();

  AuthFailure get failure;
  @override
  AuthStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$AuthFailedCopyWith<_AuthFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
