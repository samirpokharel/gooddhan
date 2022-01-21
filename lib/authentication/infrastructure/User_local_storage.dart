import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';

class UserLocalStorage {
  final SembastDatabase _sembastDatabase;
  final _store = StoreRef.main();

  UserLocalStorage({required SembastDatabase sembastDatabase})
      : _sembastDatabase = sembastDatabase;

  Future<void> upserUser(User user) async {
    await _store.record("current_user").put(
          _sembastDatabase.instance,
          user.toJson(),
        );
  }

  Future<User> getUser() async {
    final user = await _store.record("current_user").get(
          _sembastDatabase.instance,
        );
    return User.fromJson(user);
  }

  Future<void> clear() async {
    await _store.record("current_user").delete(_sembastDatabase.instance);
  }
}
