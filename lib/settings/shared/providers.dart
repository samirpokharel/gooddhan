import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/settings/application/setting_local_service.dart';
import 'package:gooddhan/settings/application/setting_notifier.dart';
import 'package:gooddhan/settings/infrastructure/setting_data.dart';

final settingLocalServiceProvider = Provider<SettingLocalService>((ref) {
  return SettingLocalService(sembastDatabase: ref.watch(sembastProvider));
});

final settingNotiferProvider =
    StateNotifierProvider<SettingNotifier, SettingLocalData>((ref) {
  return SettingNotifier(ref.watch(settingLocalServiceProvider));
});
