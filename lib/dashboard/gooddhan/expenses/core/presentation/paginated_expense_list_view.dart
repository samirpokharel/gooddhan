import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';

import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_list_item.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/pagination_wrapper.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/expense_list_item.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/expense_list/application/expense_list_notifier.dart';

class PaginatedExpensesListView extends StatefulWidget {
  final AutoDisposeStateNotifierProvider<ListExpenseNotifer, PaginatedState>
      paginatedExpenseNotifierProvider;

  final void Function() getNextPage;
  final void Function(Category category)? onSelectCategory;
  final void Function() onRefresh;

  final String noResultMessage;

  const PaginatedExpensesListView({
    Key? key,
    required this.paginatedExpenseNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
    required this.onRefresh,
    this.onSelectCategory,
  }) : super(key: key);

  @override
  _PaginatedExpensesListViewState createState() =>
      _PaginatedExpensesListViewState();
}

class _PaginatedExpensesListViewState extends State<PaginatedExpensesListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, chield) {
        ref.listen<PaginatedState>(
          widget.paginatedExpenseNotifierProvider,
          (previous, state) {
            state.map(
              initial: (_) => canLoadNextPage = true,
              loadInProgress: (_) => canLoadNextPage = false,
              success: (_) {
                if (!_.items.isFresh && !hasAlreadyShownNoConnectionToast) {
                  hasAlreadyShownNoConnectionToast = true;
                  showFlashToast(
                    context,
                    message: "You're offile. Some data"
                        "may be outdated.",
                    flavouer: ToastFlavouer.warn,
                  );
                } else if (_.successType == SuccessType.created) {
                  showFlashToast(
                    context,
                    message: "Expense successfully Created",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                } else if (_.successType == SuccessType.deleted) {
                  showFlashToast(
                    context,
                    message: "Expense Successfully deleted",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                } else if (_.successType == SuccessType.updated) {
                  showFlashToast(
                    context,
                    message: "Expense Successfully Updated",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                }
                return canLoadNextPage = _.isNextPageAvilabel;
              },
              failed: (_) {
                canLoadNextPage = false;
                showFlashToast(
                  context,
                  message: _.gooddhanFailure.message,
                  flavouer: ToastFlavouer.error,
                  dismissDuration: const Duration(seconds: 3),
                );
              },
            );
          },
        );
        final state = ref.watch(widget.paginatedExpenseNotifierProvider);
        final notifier = ref.watch(
          widget.paginatedExpenseNotifierProvider.notifier,
        );

        return PaginationWrapper(
          canLoadNextPage: canLoadNextPage,
          getNextPage: () => widget.getNextPage(),
          child: state.maybeWhen(
            success: (categories, _, successTyple) => categories.entity.isEmpty,
            orElse: () => false,
          )
              ? SingleChildScrollView(
                  child: NoData(onRefresh: () => widget.onRefresh()),
                )
              : PaginatedListView<Expense>(
                  state: state,
                  initialItem: (_) => const LoadingListTile(),
                  succesItem: (expense) => ExpenseListItem(
                    expense: expense,
                    onDeleteExpense: () => notifier.deleteExpense(expense.id),
                    onUpdate: () {
                      AutoRouter.of(context).push(
                        CreateExpenseRoute(
                          isUpdate: true,
                          previousExpense: expense,
                        ),
                      );
                    },
                  ),
                  failedItem: (expense) => ExpenseListItem(
                    expense: expense,
                    onDeleteExpense: () => notifier.deleteExpense(expense.id),
                    onUpdate: () {
                      AutoRouter.of(context).push(
                        CreateExpenseRoute(
                          isUpdate: true,
                          previousExpense: expense,
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
