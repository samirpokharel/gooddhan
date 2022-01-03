import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class SembastDatabase {
  late Database _instance;
  Database get instance => _instance;

  bool _hasBeenInitialized = false;
  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;
    final dbDir = await getApplicationDocumentsDirectory();
    await dbDir.create(recursive: true);
    final dbpath = join(dbDir.path, 'db.sembast');
    _instance = await databaseFactoryIo.openDatabase(dbpath);
  }
}
