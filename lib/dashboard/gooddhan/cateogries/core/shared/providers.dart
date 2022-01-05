import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_local_service.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_remote_service.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_repository.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';

final githuHeaderCacheProvider = Provider<GooddhanHeaderCache>((ref) {
  return GooddhanHeaderCache(ref.watch(sembastProvider));
});

final listCategoriesRemoteServiceProvider =
    Provider<ListCategoryRemoteService>((ref) {
  return ListCategoryRemoteService(
    ref.watch(dioProvider),
    ref.watch(connectivityProvider),
    ref.watch(githuHeaderCacheProvider),
  );
});

final listCategoryLocalServiceProvider =
    Provider<ListCategoriesLocalService>((ref) {
  return ListCategoriesLocalService(ref.watch(sembastProvider));
});

final listCategoriesRepositoryProvider =
    Provider<ListCategoriesRepository>((ref) {
  return ListCategoriesRepository(
    ref.watch(listCategoryLocalServiceProvider),
    ref.watch(listCategoriesRemoteServiceProvider),
  );
});

final listCategoryNotifierProvider =
    StateNotifierProvider.autoDispose<ListCategoryNotifer, PaginatedState>(
        (ref) {
  return ListCategoryNotifer(ref.watch(listCategoriesRepositoryProvider));
});
