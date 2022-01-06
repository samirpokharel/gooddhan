import 'package:gooddhan/filter/domain/filter.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/application/paginated_expense_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/infrastructure/list_expenses_repository.dart';

class ListExpenseNotifer extends PaginatedExpensesNotifier {
  final ListExpensesRepository _repository;

  ListExpenseNotifer(this._repository);

  Future<void> getFirstExpenseListPage({Filter? filter}) async {
    super.resetPage();
    await getNextExpenseListPage(filter: filter);
  }

  Future<void> getNextExpenseListPage({Filter? filter}) async {
    super.getNextPage(
      (page) => _repository.getExpensesList(page, filter: filter),
    );
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

  Future<void> updateExpense({
    required String categoryId,
    required num amount,
    required String title,
    required String expenseId,
  }) async {
    state = PaginatedState.loadInProgress(state.items, 0);
    final failureOrExpense = await _repository.updateSingleExpense(
      amount: amount,
      categoryId: categoryId,
      title: title,
      expenseId: expenseId,
    );
    state = failureOrExpense.fold(
      (l) => PaginatedState.failed(state.items, l),
      (r) {
        final expenseSelect = state.items.entity.firstWhere(
          (element) => element.id == r.toDomain().id,
        );
        final copy = [...state.items.entity];
        copy[copy.indexOf(expenseSelect)] = r.toDomain();
        return PaginatedState.success(
          Fresh.yes(copy),
          isNextPageAvilabel: false,
          successType: SuccessType.updated,
        );
      },
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
