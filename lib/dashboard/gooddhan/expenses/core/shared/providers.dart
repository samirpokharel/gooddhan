import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/infrastructure/expenses_remote_service.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/application/expense_list_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/infrastructure/list_cxpenses_remote_service.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/infrastructure/list_expenses_local_service.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/infrastructure/list_expenses_repository.dart';

// final expenseRemoteServiceProvider = Provider<ExpensesRemoteService>((ref) {
//   return ExpensesRemoteService(
//     ref.watch(dioProvider),
//     ref.watch(connectivityProvider),
//     ref.watch(githuHeaderCacheProvider),
//   );
// });

final listExpensesRemoteServiceProvider = Provider<ListExpenseRemoteService>(
  (ref) {
    return ListExpenseRemoteService(
      ref.watch(dioProvider),
      ref.watch(connectivityProvider),
      ref.watch(githuHeaderCacheProvider),
    );
  },
);

final listExpenseLocalServiceProvider =
    Provider<ListExpensesLocalService>((ref) {
  return ListExpensesLocalService(ref.watch(sembastProvider));
});

final listExpensesRepositoryProvider = Provider<ListExpensesRepository>((ref) {
  return ListExpensesRepository(
    ref.watch(listExpenseLocalServiceProvider),
    ref.watch(listExpensesRemoteServiceProvider),
  );
});

final listExpensesNotifierProvider =
    StateNotifierProvider.autoDispose<ListExpenseNotifer, PaginatedState>(
        (ref) {
  return ListExpenseNotifer(ref.watch(listExpensesRepositoryProvider));
});
