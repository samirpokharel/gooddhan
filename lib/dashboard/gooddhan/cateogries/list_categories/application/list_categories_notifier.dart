import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/application/paginated_category_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_repository.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';

class ListCategoryNotifer extends PaginatedCategoryNotifier {
  final ListCategoriesRepository _repository;

  ListCategoryNotifer(this._repository);

  Future<void> getFirstCategoryListPage() async {
    super.resetPage();
    await getNextCategoryListPage();
  }

  Future<void> getNextCategoryListPage() async {
    super.getNextPage((page) => _repository.getCategoryList(page));
  }

  Future<void> createCategory(String categoryName) async {
    state = PaginatedState.loadInProgress(state.items, 1);
    final failureOrCategory = await _repository.createCategory(categoryName);
    state = failureOrCategory.fold(
      (l) => PaginatedState.failed(state.items, l),
      (r) => PaginatedState.success(
          Fresh.yes([...state.items.entity, r.toDomain()]),
          isNextPageAvilabel: false,
          successType: SuccessType.created),
    );
  }

  Future<void> deleteCategory(String id) async {
    state = PaginatedState.loadInProgress(state.items, 0);
    final failureOrCategory = await _repository.deleteCategory(id);
    state = failureOrCategory.fold(
      (l) => PaginatedState.failed(state.items, l),
      (r) => PaginatedState.success(
          Fresh.yes(
            state.items.entity
              ..removeWhere(
                (element) => element.id == id,
              ),
          ),
          isNextPageAvilabel: false,
          successType: SuccessType.deleted),
    );
  }
}
