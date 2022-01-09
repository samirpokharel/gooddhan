import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/expense_list_item.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/paginated_expense_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/shared/providers.dart';
import 'package:gooddhan/filter/presentation/filter_sheet.dart';
import 'package:gooddhan/search/presentation/search_bar.dart';

const String noResultMessage =
    "That's about everything we could find in your starred repos right now.";

class ExpensesPage extends ConsumerStatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<ExpensesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(listExpensesNotifierProvider.notifier).getFirstExpenseListPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(listExpensesNotifierProvider.notifier);
    final state = ref.watch(listExpensesNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async => notifier.getFirstExpenseListPage(),
      child: ClearFocus(
        child: SafeArea(
          child: Scaffold(
            body: SearchBar(
              title: 'Expenses',
              hint: 'Search Expense...',
              filter: OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => FilterSheet(
                      onApplyFilter: (_) => notifier.getFirstExpenseListPage(
                        filter: _,
                      ),
                    ),
                  );
                },
                child: const FittedBox(child: Icon(AppIcon.sort, size: 16)),
              ),
              onShouldNavigateToResultPage: (searchTerm) {
                AutoRouter.of(context).push(
                  SearchedExpenseRoute(searchTerm: searchTerm),
                );
              },
              body: CustomLoadingWraper(
                isLoading: false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaginatedExpensesListView(
                            provider: listExpensesNotifierProvider,
                            paginatedState: state,
                            paginatedListWidget: PaginatedListView<Expense>(
                              state: state,
                              initialItem: (_) => const LoadingListTile(),
                              succesItem: (expense) => ExpenseListItem(
                                expense: expense,
                                onDeleteExpense: () =>
                                    notifier.deleteExpense(expense.id),
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
                                onDeleteExpense: () =>
                                    notifier.deleteExpense(expense.id),
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
                            getNextPage: () {
                              notifier.getNextExpenseListPage();
                            },
                            onRefresh: () {},
                            noResultMessage: "No Expenses Found",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                AutoRouter.of(context).push(
                  CreateExpenseRoute(isUpdate: false, previousExpense: null),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
