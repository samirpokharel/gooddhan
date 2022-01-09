import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/paginated_category_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';

const String noResultMessage =
    "That's about everything we could find in your starred repos right now.";

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  late TextEditingController _categoryNameController;

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController();
    Future.microtask(() {
      ref
          .read(listCategoryNotifierProvider.notifier)
          .getFirstCategoryListPage();
    });
  }

  void createCategory() {
    if (_categoryNameController.text.isEmpty) return;
    final notifier = ref.watch(listCategoryNotifierProvider.notifier);
    FocusScope.of(context).unfocus();
    notifier.createCategory(_categoryNameController.text);
    _categoryNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(listCategoryNotifierProvider.notifier);
    ref.listen<PaginatedState>(
      listCategoryNotifierProvider,
      (_, next) {
        next.maybeMap(
          failed: (_) {
            showFlashToast(
              context,
              message: _.gooddhanFailure.message,
              dismissDuration: const Duration(seconds: 5),
            );
          },
          orElse: () {},
        );
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        notifier.getFirstCategoryListPage();
      },
      child: ClearFocus(
        child: Scaffold(
          appBar: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => AutoRouter.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (val) {
                        notifier.getFirstCategoryListPage(searchTerm: val);
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: "Search...",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(100),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  child: TextFormField(
                    controller: _categoryNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      prefixIcon: Icon(Icons.add),
                      hintText: "💡 Type To create",
                    ),
                    keyboardType: TextInputType.streetAddress,
                    onEditingComplete: createCategory,
                  ),
                ),
                const Divider(),
                const Divider(),
                CustomLoadingWraper(
                  isLoading: ref.watch(listCategoryNotifierProvider).when(
                        initial: (_) => false,
                        loadInProgress: (_, __) => true,
                        success: (_, __, ___) => false,
                        failed: (_, __) => false,
                      ),
                  child: PaginatedCategoriesListView(
                    paginatedCategoriesNotifierProvider:
                        listCategoryNotifierProvider,
                    getNextPage: () => notifier.getNextCategoryListPage(),
                    onRefresh: () => notifier.getFirstCategoryListPage(),
                    noResultMessage: noResultMessage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
