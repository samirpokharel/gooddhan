// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_category_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaginatedCategoryStateTearOff {
  const _$PaginatedCategoryStateTearOff();

  _Initial initial(Fresh<List<Category>> categories) {
    return _Initial(
      categories,
    );
  }

  _LoadInProgress loadInProgress(
      Fresh<List<Category>> categories, int itemsPerPage) {
    return _LoadInProgress(
      categories,
      itemsPerPage,
    );
  }

  _Success success(Fresh<List<Category>> categories,
      {required bool isNextPageAvilabel}) {
    return _Success(
      categories,
      isNextPageAvilabel: isNextPageAvilabel,
    );
  }

  _Failed failed(
      Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure) {
    return _Failed(
      categories,
      gooddhanFailure,
    );
  }
}

/// @nodoc
const $PaginatedCategoryState = _$PaginatedCategoryStateTearOff();

/// @nodoc
mixin _$PaginatedCategoryState {
  Fresh<List<Category>> get categories => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Category>> categories) initial,
    required TResult Function(
            Fresh<List<Category>> categories, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<Category>> categories, bool isNextPageAvilabel)
        success,
    required TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedCategoryStateCopyWith<PaginatedCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCategoryStateCopyWith<$Res> {
  factory $PaginatedCategoryStateCopyWith(PaginatedCategoryState value,
          $Res Function(PaginatedCategoryState) then) =
      _$PaginatedCategoryStateCopyWithImpl<$Res>;
  $Res call({Fresh<List<Category>> categories});

  $FreshCopyWith<List<Category>, $Res> get categories;
}

/// @nodoc
class _$PaginatedCategoryStateCopyWithImpl<$Res>
    implements $PaginatedCategoryStateCopyWith<$Res> {
  _$PaginatedCategoryStateCopyWithImpl(this._value, this._then);

  final PaginatedCategoryState _value;
  // ignore: unused_field
  final $Res Function(PaginatedCategoryState) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Category>>,
    ));
  }

  @override
  $FreshCopyWith<List<Category>, $Res> get categories {
    return $FreshCopyWith<List<Category>, $Res>(_value.categories, (value) {
      return _then(_value.copyWith(categories: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $PaginatedCategoryStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Category>> categories});

  @override
  $FreshCopyWith<List<Category>, $Res> get categories;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$PaginatedCategoryStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_Initial(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Category>>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.categories) : super._();

  @override
  final Fresh<List<Category>> categories;

  @override
  String toString() {
    return 'PaginatedCategoryState.initial(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(categories));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Category>> categories) initial,
    required TResult Function(
            Fresh<List<Category>> categories, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<Category>> categories, bool isNextPageAvilabel)
        success,
    required TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)
        failed,
  }) {
    return initial(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
  }) {
    return initial?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PaginatedCategoryState {
  const factory _Initial(Fresh<List<Category>> categories) = _$_Initial;
  const _Initial._() : super._();

  @override
  Fresh<List<Category>> get categories;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $PaginatedCategoryStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Category>> categories, int itemsPerPage});

  @override
  $FreshCopyWith<List<Category>, $Res> get categories;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$PaginatedCategoryStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? categories = freezed,
    Object? itemsPerPage = freezed,
  }) {
    return _then(_LoadInProgress(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Category>>,
      itemsPerPage == freezed
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress(this.categories, this.itemsPerPage) : super._();

  @override
  final Fresh<List<Category>> categories;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'PaginatedCategoryState.loadInProgress(categories: $categories, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInProgress &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.itemsPerPage, itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(itemsPerPage));

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Category>> categories) initial,
    required TResult Function(
            Fresh<List<Category>> categories, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<Category>> categories, bool isNextPageAvilabel)
        success,
    required TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)
        failed,
  }) {
    return loadInProgress(categories, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
  }) {
    return loadInProgress?.call(categories, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(categories, itemsPerPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends PaginatedCategoryState {
  const factory _LoadInProgress(
      Fresh<List<Category>> categories, int itemsPerPage) = _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<Category>> get categories;
  int get itemsPerPage;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $PaginatedCategoryStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({Fresh<List<Category>> categories, bool isNextPageAvilabel});

  @override
  $FreshCopyWith<List<Category>, $Res> get categories;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$PaginatedCategoryStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? categories = freezed,
    Object? isNextPageAvilabel = freezed,
  }) {
    return _then(_Success(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Category>>,
      isNextPageAvilabel: isNextPageAvilabel == freezed
          ? _value.isNextPageAvilabel
          : isNextPageAvilabel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Success extends _Success {
  const _$_Success(this.categories, {required this.isNextPageAvilabel})
      : super._();

  @override
  final Fresh<List<Category>> categories;
  @override
  final bool isNextPageAvilabel;

  @override
  String toString() {
    return 'PaginatedCategoryState.success(categories: $categories, isNextPageAvilabel: $isNextPageAvilabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.isNextPageAvilabel, isNextPageAvilabel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(isNextPageAvilabel));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Category>> categories) initial,
    required TResult Function(
            Fresh<List<Category>> categories, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<Category>> categories, bool isNextPageAvilabel)
        success,
    required TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)
        failed,
  }) {
    return success(categories, isNextPageAvilabel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
  }) {
    return success?.call(categories, isNextPageAvilabel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories, isNextPageAvilabel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends PaginatedCategoryState {
  const factory _Success(Fresh<List<Category>> categories,
      {required bool isNextPageAvilabel}) = _$_Success;
  const _Success._() : super._();

  @override
  Fresh<List<Category>> get categories;
  bool get isNextPageAvilabel;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res>
    implements $PaginatedCategoryStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
  @override
  $Res call(
      {Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure});

  @override
  $FreshCopyWith<List<Category>, $Res> get categories;
  $GooddhanFailureCopyWith<$Res> get gooddhanFailure;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res>
    extends _$PaginatedCategoryStateCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(_Failed _value, $Res Function(_Failed) _then)
      : super(_value, (v) => _then(v as _Failed));

  @override
  _Failed get _value => super._value as _Failed;

  @override
  $Res call({
    Object? categories = freezed,
    Object? gooddhanFailure = freezed,
  }) {
    return _then(_Failed(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Category>>,
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

class _$_Failed extends _Failed {
  const _$_Failed(this.categories, this.gooddhanFailure) : super._();

  @override
  final Fresh<List<Category>> categories;
  @override
  final GooddhanFailure gooddhanFailure;

  @override
  String toString() {
    return 'PaginatedCategoryState.failed(categories: $categories, gooddhanFailure: $gooddhanFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.gooddhanFailure, gooddhanFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(gooddhanFailure));

  @JsonKey(ignore: true)
  @override
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Category>> categories) initial,
    required TResult Function(
            Fresh<List<Category>> categories, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<Category>> categories, bool isNextPageAvilabel)
        success,
    required TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)
        failed,
  }) {
    return failed(categories, gooddhanFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
  }) {
    return failed?.call(categories, gooddhanFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Category>> categories)? initial,
    TResult Function(Fresh<List<Category>> categories, int itemsPerPage)?
        loadInProgress,
    TResult Function(Fresh<List<Category>> categories, bool isNextPageAvilabel)?
        success,
    TResult Function(
            Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(categories, gooddhanFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_Success value) success,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_Success value)? success,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed extends PaginatedCategoryState {
  const factory _Failed(
          Fresh<List<Category>> categories, GooddhanFailure gooddhanFailure) =
      _$_Failed;
  const _Failed._() : super._();

  @override
  Fresh<List<Category>> get categories;
  GooddhanFailure get gooddhanFailure;
  @override
  @JsonKey(ignore: true)
  _$FailedCopyWith<_Failed> get copyWith => throw _privateConstructorUsedError;
}
