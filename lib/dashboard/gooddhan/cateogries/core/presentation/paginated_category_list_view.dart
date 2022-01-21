import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:gooddhan/core/shared/widgets/custom_conformation_sheet.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_list_item.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/pagination_wrapper.dart';

class PaginatedCategoriesListView extends StatefulWidget {
  final AutoDisposeStateNotifierProvider<ListCategoryNotifer, PaginatedState>
      paginatedCategoriesNotifierProvider;

  final void Function() getNextPage;
  final void Function(Category category)? onSelectCategory;
  final void Function() onRefresh;

  final String noResultMessage;

  const PaginatedCategoriesListView({
    Key? key,
    required this.paginatedCategoriesNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
    required this.onRefresh,
    this.onSelectCategory,
  }) : super(key: key);

  @override
  _PaginatedCategoriesListViewState createState() =>
      _PaginatedCategoriesListViewState();
}

class _PaginatedCategoriesListViewState
    extends State<PaginatedCategoriesListView> {
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
                } else if (_.successType == SuccessType.created) {
                  showFlashToast(
                    context,
                    message: "Category successfully Created",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                } else if (_.successType == SuccessType.deleted) {
                  showFlashToast(
                    context,
                    message: "Category Successfully deleted",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
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
                  succesItem: (_) => CategoryListItem(
                    category: _,
                    deleteCategory: () => notifier.deleteCategory(_.id),
                  ),
                  failedItem: (_) => CategoryListItem(
                    category: _,
                    deleteCategory: () => notifier.deleteCategory(_.id),
                  ),
                ),
        );
      },
    );
  }
}
