import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/paginated_category_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';

const String noResultMessage =
    "That's about everything we could find in your starred repos right now.";

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(listCategoryNotifierProvider.notifier)
          .getFirstCategoryListPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(listCategoryNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Sameer")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: PaginatedCategoriesListView(
          paginatedCategoriesNotifierProvider: listCategoryNotifierProvider,
          getNextPage: (ref) => notifier.getNextCategoryListPage(),
          onRefresh: () => notifier.getFirstCategoryListPage(),
          noResultMessage: noResultMessage,
        ),
      ),
    );
  }
}
