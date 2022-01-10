import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/core/presentation/themes/app_theme.dart';
import 'package:gooddhan/core/utils/date_utils.dart';

part 'setting_data.freezed.dart';
part 'setting_data.g.dart';

@freezed
class SettingLocalData with _$SettingLocalData {
  const SettingLocalData._();
  const factory SettingLocalData({
    @Default("english") String savedLanguage,
    @Default("english") String savedDateFormat,
    @Default("light") String savedTheme,
  }) = _SettingLocalData;
  factory SettingLocalData.fromJson(Map<String, dynamic> json) =>
      _$SettingLocalDataFromJson(json);

  ThemeData get themeData =>
      savedTheme == "dark" ? AppTheme.dark() : AppTheme.light();
  bool get isDark => savedTheme == "dark" ? true : false;

  Locale get locale =>
      savedLanguage == "english" ? const Locale("en") : const Locale("ne");

  String formatDate(DateTime date) {
    if (savedDateFormat == "english") {
      return AppDateUtils.format(
        date,
        dateFormatOption: DateFormatOption.english,
      );
    }
    return AppDateUtils.format(
      date,
      dateFormatOption: DateFormatOption.nepali,
    );
  }
}
