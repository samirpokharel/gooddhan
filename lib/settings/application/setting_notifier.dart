import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/settings/application/setting_local_service.dart';
import 'package:gooddhan/settings/infrastructure/setting_data.dart';

class SettingNotifier extends StateNotifier<SettingLocalData> {
  final SettingLocalService _localService;

  SettingNotifier(this._localService) : super(const SettingLocalData());

  Future<void> loadSettings() async {
    state = await _localService.getSetting();
  }

  void updateTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.dark) {
      if (!state.isDark) {
        await _localService.upsertSetting(state.copyWith(savedTheme: "dark"));
        state = state.copyWith(savedTheme: "dark");
      }
    } else if (themeMode == ThemeMode.light) {
      if (state.isDark) {
        await _localService.upsertSetting(state.copyWith(savedTheme: "light"));
        state = state.copyWith(savedTheme: "light");
      }
    } else {
      await _localService.upsertSetting(state.copyWith(savedTheme: "dark"));
      state = state.copyWith(savedTheme: "light");
    }
  }

  void updateLanguage(String language) async {
    if (state.savedLanguage != language) {
      await _localService.upsertSetting(state.copyWith(
        savedLanguage: language,
      ));
      state = state.copyWith(savedLanguage: language);
    }
  }

  void updateDateFormat(String dateFormat) async {
    if (state.savedDateFormat != dateFormat) {
      await _localService.upsertSetting(
        state.copyWith(savedDateFormat: dateFormat),
      );
      state = state.copyWith(savedDateFormat: dateFormat);
    }
  }
}
