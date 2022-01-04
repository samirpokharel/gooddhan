import 'package:gooddhan/core/infrastructure/sembast_database.dart';
import 'package:sembast/sembast.dart';

import 'gooddhan_headers.dart';

class GooddhanHeaderCache {
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store("headers");

  GooddhanHeaderCache(this._sembastDatabase);

  Future<void> saveHeader(Uri uri, GooddhanHeaders headers) async {
    await _store.record(uri.toString()).put(
          _sembastDatabase.instance,
          headers.toJson(),
        );
  }

  Future<GooddhanHeaders?> getHeaders(Uri uri) async {
    final json =
        await _store.record(uri.toString()).get(_sembastDatabase.instance);
    return json == null ? null : GooddhanHeaders.fromJson(json);
  }

  Future<void> deleteHeaders(Uri uri) async {
    await _store.record(uri.toString()).delete(_sembastDatabase.instance);
  }
}
