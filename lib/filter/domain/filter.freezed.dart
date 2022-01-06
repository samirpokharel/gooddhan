// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterTearOff {
  const _$FilterTearOff();

  _Filter call(
      {SortBy sortBy = SortBy.newest,
      FetchingDates fetchingDates = FetchingDates.all,
      List<Category> selectedCategory = const [],
      required DateTimeRange? dateRange}) {
    return _Filter(
      sortBy: sortBy,
      fetchingDates: fetchingDates,
      selectedCategory: selectedCategory,
      dateRange: dateRange,
    );
  }
}

/// @nodoc
const $Filter = _$FilterTearOff();

/// @nodoc
mixin _$Filter {
  SortBy get sortBy => throw _privateConstructorUsedError;
  FetchingDates get fetchingDates => throw _privateConstructorUsedError;
  List<Category> get selectedCategory => throw _privateConstructorUsedError;
  DateTimeRange? get dateRange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterCopyWith<Filter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res>;
  $Res call(
      {SortBy sortBy,
      FetchingDates fetchingDates,
      List<Category> selectedCategory,
      DateTimeRange? dateRange});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res> implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  final Filter _value;
  // ignore: unused_field
  final $Res Function(Filter) _then;

  @override
  $Res call({
    Object? sortBy = freezed,
    Object? fetchingDates = freezed,
    Object? selectedCategory = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(_value.copyWith(
      sortBy: sortBy == freezed
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      fetchingDates: fetchingDates == freezed
          ? _value.fetchingDates
          : fetchingDates // ignore: cast_nullable_to_non_nullable
              as FetchingDates,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc
abstract class _$FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) then) =
      __$FilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {SortBy sortBy,
      FetchingDates fetchingDates,
      List<Category> selectedCategory,
      DateTimeRange? dateRange});
}

/// @nodoc
class __$FilterCopyWithImpl<$Res> extends _$FilterCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(_Filter _value, $Res Function(_Filter) _then)
      : super(_value, (v) => _then(v as _Filter));

  @override
  _Filter get _value => super._value as _Filter;

  @override
  $Res call({
    Object? sortBy = freezed,
    Object? fetchingDates = freezed,
    Object? selectedCategory = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(_Filter(
      sortBy: sortBy == freezed
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      fetchingDates: fetchingDates == freezed
          ? _value.fetchingDates
          : fetchingDates // ignore: cast_nullable_to_non_nullable
              as FetchingDates,
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _$_Filter extends _Filter {
  const _$_Filter(
      {this.sortBy = SortBy.newest,
      this.fetchingDates = FetchingDates.all,
      this.selectedCategory = const [],
      required this.dateRange})
      : super._();

  @JsonKey()
  @override
  final SortBy sortBy;
  @JsonKey()
  @override
  final FetchingDates fetchingDates;
  @JsonKey()
  @override
  final List<Category> selectedCategory;
  @override
  final DateTimeRange? dateRange;

  @override
  String toString() {
    return 'Filter(sortBy: $sortBy, fetchingDates: $fetchingDates, selectedCategory: $selectedCategory, dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Filter &&
            const DeepCollectionEquality().equals(other.sortBy, sortBy) &&
            const DeepCollectionEquality()
                .equals(other.fetchingDates, fetchingDates) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategory, selectedCategory) &&
            const DeepCollectionEquality().equals(other.dateRange, dateRange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sortBy),
      const DeepCollectionEquality().hash(fetchingDates),
      const DeepCollectionEquality().hash(selectedCategory),
      const DeepCollectionEquality().hash(dateRange));

  @JsonKey(ignore: true)
  @override
  _$FilterCopyWith<_Filter> get copyWith =>
      __$FilterCopyWithImpl<_Filter>(this, _$identity);
}

abstract class _Filter extends Filter {
  const factory _Filter(
      {SortBy sortBy,
      FetchingDates fetchingDates,
      List<Category> selectedCategory,
      required DateTimeRange? dateRange}) = _$_Filter;
  const _Filter._() : super._();

  @override
  SortBy get sortBy;
  @override
  FetchingDates get fetchingDates;
  @override
  List<Category> get selectedCategory;
  @override
  DateTimeRange? get dateRange;
  @override
  @JsonKey(ignore: true)
  _$FilterCopyWith<_Filter> get copyWith => throw _privateConstructorUsedError;
}
