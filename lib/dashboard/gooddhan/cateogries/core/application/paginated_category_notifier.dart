import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';

typedef CategoryGetter = Future<Either<GooddhanFailure, Fresh<List<Category>>>>
    Function(int page);

class PaginatedCategoryNotifier
    extends StateNotifier<PaginatedState<Fresh<List<Category>>>> {
  PaginatedCategoryNotifier() : super(PaginatedState.initial(Fresh.yes([])));

  int _page = 1;

  @protected
  void resetPage() {
    _page = 1;
    state = PaginatedState.initial(Fresh.yes([]));
  }

  void getNextPage(CategoryGetter getter) async {
    state = PaginatedState.loadInProgress(
      state.items,
      PaginationConfig.itermsPerPage,
    );
    final failureOrCategory = await getter(_page);
    state = failureOrCategory.fold(
      (l) => PaginatedState.failed(state.items, l),
      (r) {
        _page++;
        return PaginatedState.success(
          r.copyWith(entity: [...state.items.entity, ...r.entity]),
          isNextPageAvilabel: r.isNextPageAvailable ?? false,
          successType: SuccessType.fetched,
        );
      },
    );
  }
}
