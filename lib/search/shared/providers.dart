import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/search/application/search_history_notifier.dart';
import 'package:gooddhan/search/infrastructure/search_history_repository.dart';

final searchHistoryRepositoryProvider = Provider(
  (ref) => SearchHistoryRepository(ref.watch(sembastProvider)),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(
    ref.watch(searchHistoryRepositoryProvider),
  ),
);
