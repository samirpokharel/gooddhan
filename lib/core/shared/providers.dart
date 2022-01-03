import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/sembast_database.dart';

final sembastProvider = Provider((ref) {
  return SembastDatabase();
});
