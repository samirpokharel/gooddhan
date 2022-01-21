import 'package:gooddhan/dashboard/gooddhan/expenses/core/application/paginated_expense_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/search_expense/infrastructure/searched_expenses_repository.dart';

class SearchedReposNotifier extends PaginatedExpensesNotifier {
  final SearchedExpensesRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getFirstSearchedReposPage(String query) async {
    super.resetPage();
    await getNextSearchedReposPage(query);
  }

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage(
      (page) => _repository.getSearchedReposPage(query, page),
    );
  }
}
