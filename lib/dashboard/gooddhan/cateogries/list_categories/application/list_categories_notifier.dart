import 'package:gooddhan/dashboard/gooddhan/cateogries/core/application/paginated_category_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/infrastrucuture/list_categories_repository.dart';

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
}
