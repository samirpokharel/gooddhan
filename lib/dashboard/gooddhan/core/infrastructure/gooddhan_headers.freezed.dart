// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gooddhan_headers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GooddhanHeaders _$GooddhanHeadersFromJson(Map<String, dynamic> json) {
  return _GithubHeaders.fromJson(json);
}

/// @nodoc
class _$GooddhanHeadersTearOff {
  const _$GooddhanHeadersTearOff();

  _GithubHeaders call({String? etag, int? totalPage}) {
    return _GithubHeaders(
      etag: etag,
      totalPage: totalPage,
    );
  }

  GooddhanHeaders fromJson(Map<String, Object?> json) {
    return GooddhanHeaders.fromJson(json);
  }
}

/// @nodoc
const $GooddhanHeaders = _$GooddhanHeadersTearOff();

/// @nodoc
mixin _$GooddhanHeaders {
  String? get etag => throw _privateConstructorUsedError;
  int? get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GooddhanHeadersCopyWith<GooddhanHeaders> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooddhanHeadersCopyWith<$Res> {
  factory $GooddhanHeadersCopyWith(
          GooddhanHeaders value, $Res Function(GooddhanHeaders) then) =
      _$GooddhanHeadersCopyWithImpl<$Res>;
  $Res call({String? etag, int? totalPage});
}

/// @nodoc
class _$GooddhanHeadersCopyWithImpl<$Res>
    implements $GooddhanHeadersCopyWith<$Res> {
  _$GooddhanHeadersCopyWithImpl(this._value, this._then);

  final GooddhanHeaders _value;
  // ignore: unused_field
  final $Res Function(GooddhanHeaders) _then;

  @override
  $Res call({
    Object? etag = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_value.copyWith(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPage: totalPage == freezed
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$GithubHeadersCopyWith<$Res>
    implements $GooddhanHeadersCopyWith<$Res> {
  factory _$GithubHeadersCopyWith(
          _GithubHeaders value, $Res Function(_GithubHeaders) then) =
      __$GithubHeadersCopyWithImpl<$Res>;
  @override
  $Res call({String? etag, int? totalPage});
}

/// @nodoc
class __$GithubHeadersCopyWithImpl<$Res>
    extends _$GooddhanHeadersCopyWithImpl<$Res>
    implements _$GithubHeadersCopyWith<$Res> {
  __$GithubHeadersCopyWithImpl(
      _GithubHeaders _value, $Res Function(_GithubHeaders) _then)
      : super(_value, (v) => _then(v as _GithubHeaders));

  @override
  _GithubHeaders get _value => super._value as _GithubHeaders;

  @override
  $Res call({
    Object? etag = freezed,
    Object? totalPage = freezed,
  }) {
    return _then(_GithubHeaders(
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPage: totalPage == freezed
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubHeaders extends _GithubHeaders {
  const _$_GithubHeaders({this.etag, this.totalPage}) : super._();

  factory _$_GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$$_GithubHeadersFromJson(json);

  @override
  final String? etag;
  @override
  final int? totalPage;

  @override
  String toString() {
    return 'GooddhanHeaders(etag: $etag, totalPage: $totalPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubHeaders &&
            const DeepCollectionEquality().equals(other.etag, etag) &&
            const DeepCollectionEquality().equals(other.totalPage, totalPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(etag),
      const DeepCollectionEquality().hash(totalPage));

  @JsonKey(ignore: true)
  @override
  _$GithubHeadersCopyWith<_GithubHeaders> get copyWith =>
      __$GithubHeadersCopyWithImpl<_GithubHeaders>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubHeadersToJson(this);
  }
}

abstract class _GithubHeaders extends GooddhanHeaders {
  const factory _GithubHeaders({String? etag, int? totalPage}) =
      _$_GithubHeaders;
  const _GithubHeaders._() : super._();

  factory _GithubHeaders.fromJson(Map<String, dynamic> json) =
      _$_GithubHeaders.fromJson;

  @override
  String? get etag;
  @override
  int? get totalPage;
  @override
  @JsonKey(ignore: true)
  _$GithubHeadersCopyWith<_GithubHeaders> get copyWith =>
      throw _privateConstructorUsedError;
}
