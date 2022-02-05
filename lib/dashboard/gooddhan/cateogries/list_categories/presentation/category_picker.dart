import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/core/shared/widgets/custom_check_box.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/core/shared/widgets/custom_state_button.dart';
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
  bool rootNavigator = true,
  List<Category> initialCategories = const [],
  SelectableType selectableType = SelectableType.single,
}) async {
  final categories = await showModalBottomSheet<List<Category>>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return _CategoryPicker(
        initialCategories: initialCategories,
        selectableType: selectableType,
      );
    },
  );
  return categories;
}

class _CategoryPicker extends ConsumerStatefulWidget {
  final List<Category> initialCategories;
  final SelectableType selectableType;
  const _CategoryPicker({
    Key? key,
    this.initialCategories = const [],
    this.selectableType = SelectableType.single,
  }) : super(key: key);

  @override
  ConsumerState<_CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends ConsumerState<_CategoryPicker> {
  List<Category> _selectedCategories = [];

  @override
  void initState() {
    if (widget.initialCategories.isNotEmpty) {
      _selectedCategories.addAll(widget.initialCategories);
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
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            icon: const Icon(Icons.close),
          ),
          title: Row(
            children: [
              Text(
                "Select Category",
                style: textTheme.headline2,
              ),
              const Spacer(),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.link),
              onPressed: () {
                AutoRouter.of(context).push(const CategoriesRoute());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, _) {
              final notifier = ref.watch(
                listCategoryNotifierProvider.notifier,
              );
              return PaginatedCategoriesPickerListView(
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
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _selectedCategories);
            },
            child: const Text("Done"),
          ),
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
                  srinkWrap: true,
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
