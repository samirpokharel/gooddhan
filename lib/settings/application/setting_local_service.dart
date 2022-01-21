import 'package:gooddhan/core/infrastructure/sembast_database.dart';
import 'package:gooddhan/settings/infrastructure/setting_data.dart';
import 'package:sembast/sembast.dart';

class SettingLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = StoreRef<String, dynamic>.main();

  SettingLocalService({required SembastDatabase sembastDatabase})
      : _sembastDatabase = sembastDatabase;

  Future<void> upsertSetting(SettingLocalData user) async {
    await _store.record("settings").put(
          _sembastDatabase.instance,
          user.toJson(),
        );
  }

  Future<SettingLocalData> getSetting() async {
    final data = await _store.record("settings").getSnapshot(
          _sembastDatabase.instance,
        );
    return SettingLocalData.fromJson(data?.value);
  }
}
