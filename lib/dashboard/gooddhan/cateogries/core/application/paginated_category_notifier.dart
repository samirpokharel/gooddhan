import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';

part 'paginated_category_notifier.freezed.dart';

typedef CategoryGetter = Future<Either<GooddhanFailure, Fresh<List<Category>>>>
    Function(int page);

@freezed
class PaginatedCategoryState with _$PaginatedCategoryState {
  const PaginatedCategoryState._();
  const factory PaginatedCategoryState.initial(
    Fresh<List<Category>> categories,
  ) = _Initial;
  const factory PaginatedCategoryState.loadInProgress(
    Fresh<List<Category>> categories,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedCategoryState.success(
    Fresh<List<Category>> categories, {
    required bool isNextPageAvilabel,
  }) = _Success;
  const factory PaginatedCategoryState.failed(
    Fresh<List<Category>> categories,
    GooddhanFailure gooddhanFailure,
  ) = _Failed;
}

class PaginatedCategoryNotifier extends StateNotifier<PaginatedCategoryState> {
  PaginatedCategoryNotifier()
      : super(PaginatedCategoryState.initial(Fresh.yes([])));

  int _page = 1;

  @protected
  void resetPage() {
    _page = 1;
    state = PaginatedCategoryState.initial(Fresh.yes([]));
  }

  void getNextPage(CategoryGetter getter) async {
    state = PaginatedCategoryState.loadInProgress(
      state.categories,
      PaginationConfig.itermsPerPage,
    );
    final failureOrCategory = await getter(_page);
    state = failureOrCategory.fold(
      (l) => PaginatedCategoryState.failed(state.categories, l),
      (r) {
        _page++;
        return PaginatedCategoryState.success(
          r.copyWith(entity: [...state.categories.entity, ...r.entity]),
          isNextPageAvilabel: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}