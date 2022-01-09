import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/expense_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/paginated_expense_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/shared/providers.dart';
import 'package:gooddhan/filter/presentation/filter_sheet.dart';
import 'package:gooddhan/search/presentation/search_bar.dart';

class SearchedExpensePage extends ConsumerStatefulWidget {
  final String searchTerm;
  const SearchedExpensePage(this.searchTerm, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchedExpensePageState();
}

class _SearchedExpensePageState extends ConsumerState<SearchedExpensePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.refresh(searchedExpenseNotifierProvider);
        ref
            .read(searchedExpenseNotifierProvider.notifier)
            .getFirstSearchedReposPage(
              widget.searchTerm,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(searchedExpenseNotifierProvider.notifier);
    final state = ref.watch(searchedExpenseNotifierProvider);

    return Scaffold(
      body: SearchBar(
        title: widget.searchTerm,
        hint: 'Search expenes..',
        onShouldNavigateToResultPage: (searchTerm) {
          AutoRouter.of(context).pushAndPopUntil(
            SearchedExpenseRoute(searchTerm: searchTerm),
            predicate: (route) =>
                route.settings.name == SearchedExpenseRoute.name,
          );
        },
        filter: OutlinedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => FilterSheet(
                onApplyFilter: (_) {},
              ),
            );
          },
          child: const FittedBox(child: Icon(AppIcon.sort, size: 16)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
          child: PaginatedExpensesListView(
            provider: listExpensesNotifierProvider,
            paginatedState: state,
            paginatedListWidget: PaginatedListView<Expense>(
              state: state,
              initialItem: (_) => const LoadingListTile(),
              succesItem: (expense) => ExpenseTile(expense: expense),
              failedItem: (expense) => ExpenseTile(expense: expense),
            ),
            getNextPage: () =>
                notifier.getNextSearchedReposPage(widget.searchTerm),
            onRefresh: () {},
            noResultMessage: "No result for '${widget.searchTerm}'",
          ),
        ),
      ),
    );
  }
}
