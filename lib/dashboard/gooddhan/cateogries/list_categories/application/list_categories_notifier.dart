import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/application/paginated_category_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_repository.dart';

class ListCategoryNotifer extends PaginatedCategoryNotifier {
  final ListCategoriesRepository _repository;

  ListCategoryNotifer(this._repository) {
    getFirstCategoryListPage();
  }

  Future<void> getFirstCategoryListPage() async {
    super.resetPage();
    await getNextCategoryListPage();
  }

  Future<void> getNextCategoryListPage() async {
    super.getNextPage((page) => _repository.getCategoryList(page));
  }

  Future<void> createCategory(String categoryName) async {
    state = PaginatedCategoryState.loadInProgress(state.categories, 1);
    final failureOrCategory = await _repository.createCategory(categoryName);
    state = failureOrCategory.fold(
      (l) => PaginatedCategoryState.failed(state.categories, l),
      (r) => PaginatedCategoryState.success(
        Fresh.yes([...state.categories.entity, r.toDomain()]),
        isNextPageAvilabel: true,
      ),
    );
  }
}
