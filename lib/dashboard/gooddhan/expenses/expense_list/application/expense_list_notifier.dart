import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/application/paginated_expense_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/infrastructure/list_expenses_repository.dart';

class ListExpenseNotifer extends PaginatedExpensesNotifier {
  final ListExpensesRepository _repository;

  ListExpenseNotifer(this._repository);

  Future<void> getFirstExpenseListPage() async {
    super.resetPage();
    await getNextExpenseListPage();
  }

  Future<void> getNextExpenseListPage() async {
    super.getNextPage((page) => _repository.getExpensesList(page));
  }

  Future<void> createExpense(
    String categoryId,
    num amount,
    String title,
  ) async {
    state = PaginatedState.loadInProgress(state.items, 1);
    final failureOrCategory =
        await _repository.createExpense(categoryId, amount, title);
    state = failureOrCategory.fold(
      (l) => PaginatedState.failed(state.items, l),
      (r) => PaginatedState.success(
        Fresh.yes([...state.items.entity, r.toDomain()]),
        isNextPageAvilabel: false,
        successType: SuccessType.created,
      ),
    );
  }

  Future<void> deleteExpense(String id) async {
    state = PaginatedState.loadInProgress(state.items, 0);
    final failureOrCategory = await _repository.deleteExpense(id);
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
        successType: SuccessType.deleted,
      ),
    );
  }
}
