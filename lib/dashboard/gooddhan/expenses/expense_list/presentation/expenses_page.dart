import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/paginated_category_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/paginated_expense_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/shared/providers.dart';

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

    return RefreshIndicator(
      onRefresh: () async {
        notifier.getFirstExpenseListPage();
      },
      child: ClearFocus(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Expenses"),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  onChanged: (val) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search),
                    hintText: "Search...",
                  ),
                ),
              ),
              preferredSize: const Size.fromHeight(60),
            ),
          ),
          body: CustomLoadingWraper(
            isLoading: ref.watch(listExpensesNotifierProvider).when(
                  initial: (_) => false,
                  loadInProgress: (_, __) => true,
                  success: (_, __, ___) => false,
                  failed: (_, __) => false,
                ),
            child: Scaffold(
              primary: true,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PaginatedExpensesListView(
                  paginatedExpenseNotifierProvider:
                      listExpensesNotifierProvider,
                  getNextPage: () => notifier.getNextExpenseListPage(),
                  onRefresh: () => notifier.getFirstExpenseListPage(),
                  noResultMessage: noResultMessage,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              AutoRouter.of(context).push(
                CreateExpenseRoute(
                  isUpdate: false,
                  previousExpense: null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}