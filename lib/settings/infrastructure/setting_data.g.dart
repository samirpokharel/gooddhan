// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingLocalData _$$_SettingLocalDataFromJson(Map<String, dynamic> json) =>
    _$_SettingLocalData(
      savedLanguage: json['savedLanguage'] as String? ?? "english",
      savedDateFormat: json['savedDateFormat'] as String? ?? "english",
      savedTheme: json['savedTheme'] as String? ?? "light",
    );

Map<String, dynamic> _$$_SettingLocalDataToJson(_$_SettingLocalData instance) =>
    <String, dynamic>{
      'savedLanguage': instance.savedLanguage,
      'savedDateFormat': instance.savedDateFormat,
      'savedTheme': instance.savedTheme,
    };
