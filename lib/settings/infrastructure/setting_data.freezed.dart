// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingLocalData _$SettingLocalDataFromJson(Map<String, dynamic> json) {
  return _SettingLocalData.fromJson(json);
}

/// @nodoc
class _$SettingLocalDataTearOff {
  const _$SettingLocalDataTearOff();

  _SettingLocalData call(
      {String savedLanguage = "english",
      String savedDateFormat = "english",
      String savedTheme = "light"}) {
    return _SettingLocalData(
      savedLanguage: savedLanguage,
      savedDateFormat: savedDateFormat,
      savedTheme: savedTheme,
    );
  }

  SettingLocalData fromJson(Map<String, Object?> json) {
    return SettingLocalData.fromJson(json);
  }
}

/// @nodoc
const $SettingLocalData = _$SettingLocalDataTearOff();

/// @nodoc
mixin _$SettingLocalData {
  String get savedLanguage => throw _privateConstructorUsedError;
  String get savedDateFormat => throw _privateConstructorUsedError;
  String get savedTheme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingLocalDataCopyWith<SettingLocalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingLocalDataCopyWith<$Res> {
  factory $SettingLocalDataCopyWith(
          SettingLocalData value, $Res Function(SettingLocalData) then) =
      _$SettingLocalDataCopyWithImpl<$Res>;
  $Res call({String savedLanguage, String savedDateFormat, String savedTheme});
}

/// @nodoc
class _$SettingLocalDataCopyWithImpl<$Res>
    implements $SettingLocalDataCopyWith<$Res> {
  _$SettingLocalDataCopyWithImpl(this._value, this._then);

  final SettingLocalData _value;
  // ignore: unused_field
  final $Res Function(SettingLocalData) _then;

  @override
  $Res call({
    Object? savedLanguage = freezed,
    Object? savedDateFormat = freezed,
    Object? savedTheme = freezed,
  }) {
    return _then(_value.copyWith(
      savedLanguage: savedLanguage == freezed
          ? _value.savedLanguage
          : savedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      savedDateFormat: savedDateFormat == freezed
          ? _value.savedDateFormat
          : savedDateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      savedTheme: savedTheme == freezed
          ? _value.savedTheme
          : savedTheme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SettingLocalDataCopyWith<$Res>
    implements $SettingLocalDataCopyWith<$Res> {
  factory _$SettingLocalDataCopyWith(
          _SettingLocalData value, $Res Function(_SettingLocalData) then) =
      __$SettingLocalDataCopyWithImpl<$Res>;
  @override
  $Res call({String savedLanguage, String savedDateFormat, String savedTheme});
}

/// @nodoc
class __$SettingLocalDataCopyWithImpl<$Res>
    extends _$SettingLocalDataCopyWithImpl<$Res>
    implements _$SettingLocalDataCopyWith<$Res> {
  __$SettingLocalDataCopyWithImpl(
      _SettingLocalData _value, $Res Function(_SettingLocalData) _then)
      : super(_value, (v) => _then(v as _SettingLocalData));

  @override
  _SettingLocalData get _value => super._value as _SettingLocalData;

  @override
  $Res call({
    Object? savedLanguage = freezed,
    Object? savedDateFormat = freezed,
    Object? savedTheme = freezed,
  }) {
    return _then(_SettingLocalData(
      savedLanguage: savedLanguage == freezed
          ? _value.savedLanguage
          : savedLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      savedDateFormat: savedDateFormat == freezed
          ? _value.savedDateFormat
          : savedDateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      savedTheme: savedTheme == freezed
          ? _value.savedTheme
          : savedTheme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingLocalData extends _SettingLocalData {
  const _$_SettingLocalData(
      {this.savedLanguage = "english",
      this.savedDateFormat = "english",
      this.savedTheme = "light"})
      : super._();

  factory _$_SettingLocalData.fromJson(Map<String, dynamic> json) =>
      _$$_SettingLocalDataFromJson(json);

  @JsonKey()
  @override
  final String savedLanguage;
  @JsonKey()
  @override
  final String savedDateFormat;
  @JsonKey()
  @override
  final String savedTheme;

  @override
  String toString() {
    return 'SettingLocalData(savedLanguage: $savedLanguage, savedDateFormat: $savedDateFormat, savedTheme: $savedTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingLocalData &&
            const DeepCollectionEquality()
                .equals(other.savedLanguage, savedLanguage) &&
            const DeepCollectionEquality()
                .equals(other.savedDateFormat, savedDateFormat) &&
            const DeepCollectionEquality()
                .equals(other.savedTheme, savedTheme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(savedLanguage),
      const DeepCollectionEquality().hash(savedDateFormat),
      const DeepCollectionEquality().hash(savedTheme));

  @JsonKey(ignore: true)
  @override
  _$SettingLocalDataCopyWith<_SettingLocalData> get copyWith =>
      __$SettingLocalDataCopyWithImpl<_SettingLocalData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingLocalDataToJson(this);
  }
}

abstract class _SettingLocalData extends SettingLocalData {
  const factory _SettingLocalData(
      {String savedLanguage,
      String savedDateFormat,
      String savedTheme}) = _$_SettingLocalData;
  const _SettingLocalData._() : super._();

  factory _SettingLocalData.fromJson(Map<String, dynamic> json) =
      _$_SettingLocalData.fromJson;

  @override
  String get savedLanguage;
  @override
  String get savedDateFormat;
  @override
  String get savedTheme;
  @override
  @JsonKey(ignore: true)
  _$SettingLocalDataCopyWith<_SettingLocalData> get copyWith =>
      throw _privateConstructorUsedError;
}
