// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginatedStateTearOff {
  const _$PaginatedStateTearOff();

  _Initial<T> initial<T>(T items) {
    return _Initial<T>(
      items,
    );
  }

  _LoadInProgress<T> loadInProgress<T>(T items, int itemsPerPage) {
    return _LoadInProgress<T>(
      items,
      itemsPerPage,
    );
  }

  _Success<T> success<T>(T items,
      {required bool isNextPageAvilabel, required SuccessType successType}) {
    return _Success<T>(
      items,
      isNextPageAvilabel: isNextPageAvilabel,
      successType: successType,
    );
  }

  _Failed<T> failed<T>(T items, GooddhanFailure gooddhanFailure) {
    return _Failed<T>(
      items,
      gooddhanFailure,
    );
  }
}

/// @nodoc
const $PaginatedState = _$PaginatedStateTearOff();

/// @nodoc
mixin _$PaginatedState<T> {
  T get items => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T items) initial,
    required TResult Function(T items, int itemsPerPage) loadInProgress,
    required TResult Function(
            T items, bool isNextPageAvilabel, SuccessType successType)
        success,
    required TResult Function(T items, GooddhanFailure gooddhanFailure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failed<T> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedStateCopyWith<T, PaginatedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStateCopyWith<T, $Res> {
  factory $PaginatedStateCopyWith(
          PaginatedState<T> value, $Res Function(PaginatedState<T>) then) =
      _$PaginatedStateCopyWithImpl<T, $Res>;
  $Res call({T items});
}

/// @nodoc
class _$PaginatedStateCopyWithImpl<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  _$PaginatedStateCopyWithImpl(this._value, this._then);

  final PaginatedState<T> _value;
  // ignore: unused_field
  final $Res Function(PaginatedState<T>) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  factory _$InitialCopyWith(
          _Initial<T> value, $Res Function(_Initial<T>) then) =
      __$InitialCopyWithImpl<T, $Res>;
  @override
  $Res call({T items});
}

/// @nodoc
class __$InitialCopyWithImpl<T, $Res>
    extends _$PaginatedStateCopyWithImpl<T, $Res>
    implements _$InitialCopyWith<T, $Res> {
  __$InitialCopyWithImpl(_Initial<T> _value, $Res Function(_Initial<T>) _then)
      : super(_value, (v) => _then(v as _Initial<T>));

  @override
  _Initial<T> get _value => super._value as _Initial<T>;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_Initial<T>(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Initial<T> extends _Initial<T> {
  const _$_Initial(this.items) : super._();

  @override
  final T items;

  @override
  String toString() {
    return 'PaginatedState<$T>.initial(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial<T> &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<T, _Initial<T>> get copyWith =>
      __$InitialCopyWithImpl<T, _Initial<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T items) initial,
    required TResult Function(T items, int itemsPerPage) loadInProgress,
    required TResult Function(
            T items, bool isNextPageAvilabel, SuccessType successType)
        success,
    required TResult Function(T items, GooddhanFailure gooddhanFailure) failed,
  }) {
    return initial(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
  }) {
    return initial?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failed<T> value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> extends PaginatedState<T> {
  const factory _Initial(T items) = _$_Initial<T>;
  const _Initial._() : super._();

  @override
  T get items;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<T, _Initial<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress<T> value, $Res Function(_LoadInProgress<T>) then) =
      __$LoadInProgressCopyWithImpl<T, $Res>;
  @override
  $Res call({T items, int itemsPerPage});
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<T, $Res>
    extends _$PaginatedStateCopyWithImpl<T, $Res>
    implements _$LoadInProgressCopyWith<T, $Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress<T> _value, $Res Function(_LoadInProgress<T>) _then)
      : super(_value, (v) => _then(v as _LoadInProgress<T>));

  @override
  _LoadInProgress<T> get _value => super._value as _LoadInProgress<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? itemsPerPage = freezed,
  }) {
    return _then(_LoadInProgress<T>(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as T,
      itemsPerPage == freezed
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress<T> extends _LoadInProgress<T> {
  const _$_LoadInProgress(this.items, this.itemsPerPage) : super._();

  @override
  final T items;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'PaginatedState<$T>.loadInProgress(items: $items, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInProgress<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.itemsPerPage, itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(itemsPerPage));

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<T, _LoadInProgress<T>> get copyWith =>
      __$LoadInProgressCopyWithImpl<T, _LoadInProgress<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T items) initial,
    required TResult Function(T items, int itemsPerPage) loadInProgress,
    required TResult Function(
            T items, bool isNextPageAvilabel, SuccessType successType)
        success,
    required TResult Function(T items, GooddhanFailure gooddhanFailure) failed,
  }) {
    return loadInProgress(items, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
  }) {
    return loadInProgress?.call(items, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(items, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failed<T> value) failed,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress<T> extends PaginatedState<T> {
  const factory _LoadInProgress(T items, int itemsPerPage) =
      _$_LoadInProgress<T>;
  const _LoadInProgress._() : super._();

  @override
  T get items;
  int get itemsPerPage;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<T, _LoadInProgress<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) then) =
      __$SuccessCopyWithImpl<T, $Res>;
  @override
  $Res call({T items, bool isNextPageAvilabel, SuccessType successType});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res>
    extends _$PaginatedStateCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? isNextPageAvilabel = freezed,
    Object? successType = freezed,
  }) {
    return _then(_Success<T>(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as T,
      isNextPageAvilabel: isNextPageAvilabel == freezed
          ? _value.isNextPageAvilabel
          : isNextPageAvilabel // ignore: cast_nullable_to_non_nullable
              as bool,
      successType: successType == freezed
          ? _value.successType
          : successType // ignore: cast_nullable_to_non_nullable
              as SuccessType,
    ));
  }
}

/// @nodoc

class _$_Success<T> extends _Success<T> {
  const _$_Success(this.items,
      {required this.isNextPageAvilabel, required this.successType})
      : super._();

  @override
  final T items;
  @override
  final bool isNextPageAvilabel;
  @override
  final SuccessType successType;

  @override
  String toString() {
    return 'PaginatedState<$T>.success(items: $items, isNextPageAvilabel: $isNextPageAvilabel, successType: $successType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.isNextPageAvilabel, isNextPageAvilabel) &&
            const DeepCollectionEquality()
                .equals(other.successType, successType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(isNextPageAvilabel),
      const DeepCollectionEquality().hash(successType));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T items) initial,
    required TResult Function(T items, int itemsPerPage) loadInProgress,
    required TResult Function(
            T items, bool isNextPageAvilabel, SuccessType successType)
        success,
    required TResult Function(T items, GooddhanFailure gooddhanFailure) failed,
  }) {
    return success(items, isNextPageAvilabel, successType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
  }) {
    return success?.call(items, isNextPageAvilabel, successType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, isNextPageAvilabel, successType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failed<T> value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> extends PaginatedState<T> {
  const factory _Success(T items,
      {required bool isNextPageAvilabel,
      required SuccessType successType}) = _$_Success<T>;
  const _Success._() : super._();

  @override
  T get items;
  bool get isNextPageAvilabel;
  SuccessType get successType;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailedCopyWith<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  factory _$FailedCopyWith(_Failed<T> value, $Res Function(_Failed<T>) then) =
      __$FailedCopyWithImpl<T, $Res>;
  @override
  $Res call({T items, GooddhanFailure gooddhanFailure});

  $GooddhanFailureCopyWith<$Res> get gooddhanFailure;
}

/// @nodoc
class __$FailedCopyWithImpl<T, $Res>
    extends _$PaginatedStateCopyWithImpl<T, $Res>
    implements _$FailedCopyWith<T, $Res> {
  __$FailedCopyWithImpl(_Failed<T> _value, $Res Function(_Failed<T>) _then)
      : super(_value, (v) => _then(v as _Failed<T>));

  @override
  _Failed<T> get _value => super._value as _Failed<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? gooddhanFailure = freezed,
  }) {
    return _then(_Failed<T>(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as T,
      gooddhanFailure == freezed
          ? _value.gooddhanFailure
          : gooddhanFailure // ignore: cast_nullable_to_non_nullable
              as GooddhanFailure,
    ));
  }

  @override
  $GooddhanFailureCopyWith<$Res> get gooddhanFailure {
    return $GooddhanFailureCopyWith<$Res>(_value.gooddhanFailure, (value) {
      return _then(_value.copyWith(gooddhanFailure: value));
    });
  }
}

/// @nodoc

class _$_Failed<T> extends _Failed<T> {
  const _$_Failed(this.items, this.gooddhanFailure) : super._();

  @override
  final T items;
  @override
  final GooddhanFailure gooddhanFailure;

  @override
  String toString() {
    return 'PaginatedState<$T>.failed(items: $items, gooddhanFailure: $gooddhanFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.gooddhanFailure, gooddhanFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(gooddhanFailure));

  @JsonKey(ignore: true)
  @override
  _$FailedCopyWith<T, _Failed<T>> get copyWith =>
      __$FailedCopyWithImpl<T, _Failed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T items) initial,
    required TResult Function(T items, int itemsPerPage) loadInProgress,
    required TResult Function(
            T items, bool isNextPageAvilabel, SuccessType successType)
        success,
    required TResult Function(T items, GooddhanFailure gooddhanFailure) failed,
  }) {
    return failed(items, gooddhanFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
  }) {
    return failed?.call(items, gooddhanFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T items)? initial,
    TResult Function(T items, int itemsPerPage)? loadInProgress,
    TResult Function(T items, bool isNextPageAvilabel, SuccessType successType)?
        success,
    TResult Function(T items, GooddhanFailure gooddhanFailure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(items, gooddhanFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Failed<T> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Failed<T> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed<T> extends PaginatedState<T> {
  const factory _Failed(T items, GooddhanFailure gooddhanFailure) =
      _$_Failed<T>;
  const _Failed._() : super._();

  @override
  T get items;
  GooddhanFailure get gooddhanFailure;
  @override
  @JsonKey(ignore: true)
  _$FailedCopyWith<T, _Failed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
