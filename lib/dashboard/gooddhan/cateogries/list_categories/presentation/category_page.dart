import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/clear_foucs.dart';
import 'package:gooddhan/core/shared/toasts.dart';
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
  late TextEditingController _categoryNameController;

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController();
    // Future.microtask(() {
    //   ref
    //       .read(listCategoryNotifierProvider.notifier)
    //       .getFirstCategoryListPage();
    // });
  }

  void createCategory() {
    if (_categoryNameController.text.isEmpty) return;
    final notifier = ref.watch(listCategoryNotifierProvider.notifier);
    FocusScope.of(context).unfocus();
    notifier.createCategory(_categoryNameController.text).whenComplete(() {
      _categoryNameController.clear();
      notifier.state.maybeWhen(
        orElse: () {},
        failed: (_, __) {
          showFlashToast(
            context,
            message: "Category Create Failed",
            flavouer: ToastFlavouer.error,
            dismissDuration: const Duration(seconds: 3),
          );
        },
        success: (_, __) {
          showFlashToast(
            context,
            message: "Category Created successfully",
            flavouer: ToastFlavouer.success,
            dismissDuration: const Duration(seconds: 3),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(listCategoryNotifierProvider.notifier);
    return RefreshIndicator(
      onRefresh: () async {
        notifier.getFirstCategoryListPage();
      },
      child: ClearFocus(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Categories"),
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
          body: Scaffold(
            primary: true,
            body: PaginatedCategoriesListView(
              paginatedCategoriesNotifierProvider: listCategoryNotifierProvider,
              getNextPage: (ref) => notifier.getNextCategoryListPage(),
              onRefresh: () => notifier.getFirstCategoryListPage(),
              noResultMessage: noResultMessage,
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _categoryNameController,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          hintText: "💡 Category Name...",
                          suffixIcon: ElevatedButton(
                            onPressed: createCategory,
                            child: const Icon(Icons.add),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
