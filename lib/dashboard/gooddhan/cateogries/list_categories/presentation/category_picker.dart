import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_check_box.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';

import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/pagination_wrapper.dart';

enum SelectableType { single, multiple }

Future<List<Category>?> showCategoryPicker({
  required BuildContext context,
  Category? initialCategory,
  bool rootNavigator = true,
  SelectableType selectableType = SelectableType.single,
}) async {
  final categories = await Navigator.of(context).push<List<Category>>(
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (_) => _CategoryPicker(
        initialCategory: initialCategory,
        selectableType: selectableType,
      ),
    ),
  );
  return categories;
}

class _CategoryPicker extends ConsumerStatefulWidget {
  final Category? initialCategory;
  final SelectableType selectableType;
  const _CategoryPicker({
    Key? key,
    this.initialCategory,
    this.selectableType = SelectableType.single,
  }) : super(key: key);

  @override
  ConsumerState<_CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends ConsumerState<_CategoryPicker> {
  final List<Category> _selectedCategories = [];

  @override
  void initState() {
    if (widget.initialCategory != null) {
      _selectedCategories.add(widget.initialCategory!);
    }
    Future.microtask(() {
      ref
          .read(listCategoryNotifierProvider.notifier)
          .getFirstCategoryListPage();
    });

    super.initState();
  }

  void onTermChange(String text) {
    // setState(() => searchtedCurrency = search(text));
  }

  void checkCategory(Category category, SelectableType selectableType) {
    if (selectableType == SelectableType.multiple) {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
      setState(() {});
    } else {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        if (_selectedCategories.isEmpty) {
          _selectedCategories.add(category);
        } else {
          _selectedCategories[0] = category;
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                textInputAction: TextInputAction.search,
                onChanged: onTermChange,
                decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: "Search...",
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(60),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context, _selectedCategories);
            },
          ),
          title: const Text("Select Category"),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.check_mark),
              onPressed: () {
                Navigator.pop(context, _selectedCategories);
              },
            ),
          ],
        ),
        body: Consumer(
          builder: (context, ref, _) {
            final notifier = ref.watch(listCategoryNotifierProvider.notifier);
            return CustomLoadingWraper(
              isLoading: ref.watch(listCategoryNotifierProvider).when(
                    initial: (_) => false,
                    loadInProgress: (_, __) => true,
                    success: (_, __, ___) => false,
                    failed: (_, __) => false,
                  ),
              child: Scaffold(
                primary: true,
                body: PaginatedCategoriesPickerListView(
                  paginatedCategoriesNotifierProvider:
                      listCategoryNotifierProvider,
                  getNextPage: () => notifier.getNextCategoryListPage(),
                  selectedCategories: _selectedCategories,
                  onRefresh: () => notifier.getFirstCategoryListPage(),
                  noResultMessage: "No category Found",
                  onSelectCategory: (category) => checkCategory(
                    category,
                    widget.selectableType,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaginatedCategoriesPickerListView extends StatefulWidget {
  final AutoDisposeStateNotifierProvider<ListCategoryNotifer, PaginatedState>
      paginatedCategoriesNotifierProvider;

  final void Function() getNextPage;
  final void Function(Category category)? onSelectCategory;
  final List<Category> selectedCategories;

  final void Function() onRefresh;

  final String noResultMessage;

  const PaginatedCategoriesPickerListView({
    Key? key,
    required this.paginatedCategoriesNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
    required this.onRefresh,
    required this.selectedCategories,
    this.onSelectCategory,
  }) : super(key: key);

  @override
  _PaginatedCategoriesPickerListViewState createState() =>
      _PaginatedCategoriesPickerListViewState();
}

class _PaginatedCategoriesPickerListViewState
    extends State<PaginatedCategoriesPickerListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, chield) {
        ref.listen<PaginatedState>(
          widget.paginatedCategoriesNotifierProvider,
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
                }
                return canLoadNextPage = _.isNextPageAvilabel;
              },
              failed: (_) => canLoadNextPage = false,
            );
          },
        );
        final state = ref.watch(widget.paginatedCategoriesNotifierProvider);
        final notifier = ref.watch(
          widget.paginatedCategoriesNotifierProvider.notifier,
        );

        return PaginationWrapper(
          canLoadNextPage: canLoadNextPage,
          getNextPage: () => widget.getNextPage(),
          child: state.maybeWhen(
            success: (categories, _, __) => categories.entity.isEmpty,
            orElse: () => false,
          )
              ? SingleChildScrollView(
                  child: NoData(onRefresh: () => widget.onRefresh()),
                )
              : PaginatedListView<Category>(
                  state: state,
                  initialItem: (_) => CategoryItemTile(category: _),
                  succesItem: (category) => GestureDetector(
                    onTap: () => widget.onSelectCategory?.call(category),
                    child: CategoryItemTile(
                      category: category,
                      trailing: CustomCheckBox(
                        value: widget.selectedCategories.contains(category),
                        onChanged: (_) =>
                            widget.onSelectCategory?.call(category),
                      ),
                    ),
                  ),
                  failedItem: (category) => GestureDetector(
                    onTap: () => widget.onSelectCategory?.call(category),
                    child: CategoryItemTile(
                      category: category,
                      trailing: CustomCheckBox(
                        value: widget.selectedCategories.contains(category),
                        onChanged: (_) =>
                            widget.onSelectCategory?.call(category),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
