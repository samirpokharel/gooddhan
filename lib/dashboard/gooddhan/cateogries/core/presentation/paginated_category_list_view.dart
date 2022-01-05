import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:gooddhan/core/shared/widgets/custom_conformation_sheet.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/PaginatedState.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';

class PaginatedCategoriesListView extends StatefulWidget {
  final AutoDisposeStateNotifierProvider<ListCategoryNotifer,
      PaginatedCategoryState> paginatedCategoriesNotifierProvider;

  final void Function(WidgetRef ref) getNextPage;
  final void Function() onRefresh;

  final String noResultMessage;

  const PaginatedCategoriesListView({
    Key? key,
    required this.paginatedCategoriesNotifierProvider,
    required this.getNextPage,
    required this.noResultMessage,
    required this.onRefresh,
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
        ref.listen<PaginatedCategoryState>(
          widget.paginatedCategoriesNotifierProvider,
          (previous, state) {
            state.map(
              initial: (_) => canLoadNextPage = true,
              loadInProgress: (_) => canLoadNextPage = false,
              success: (_) {
                if (!_.categories.isFresh &&
                    !hasAlreadyShownNoConnectionToast) {
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

        return NotificationListener<ScrollNotification>(
          onNotification: (notifications) {
            final metrics = notifications.metrics;
            final limit =
                metrics.maxScrollExtent - metrics.viewportDimension / 3;

            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;
              widget.getNextPage(ref);
            }
            return false;
          },
          child: state.maybeWhen(
            success: (categories, _) => categories.entity.isEmpty,
            orElse: () => false,
          )
              ? SingleChildScrollView(
                  child: NoData(onRefresh: () => widget.onRefresh()))
              : _PaginatedListView(notifier: notifier, state: state),
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.notifier,
    required this.state,
  }) : super(key: key);

  final ListCategoryNotifer notifier;
  final PaginatedCategoryState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.categories.entity.length + _.itemsPerPage,
        success: (_) => _.categories.entity.length,
        failed: (_) => _.categories.entity.length,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => CategoryItemTile(
            category: _.categories.entity[index],
          ),
          loadInProgress: (_) {
            if (index < _.categories.entity.length) {
              return CategoryListItem(
                category: _.categories.entity[index],
                deleteCategory: () => notifier.deleteCategory(
                  _.categories.entity[index].id,
                ),
              );
            } else {
              return const LoadingListTile();
            }
          },
          success: (_) => CategoryListItem(
            category: _.categories.entity[index],
            deleteCategory: () => notifier.deleteCategory(
              _.categories.entity[index].id,
            ),
          ),
          failed: (_) {
            return CategoryListItem(
              category: _.categories.entity[index],
              deleteCategory: () => notifier.deleteCategory(
                _.categories.entity[index].id,
              ),
            );
          },
        );
      },
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key? key,
    required this.category,
    required this.deleteCategory,
  }) : super(key: key);

  final Category category;
  final Function deleteCategory;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          onDismissed: () => deleteCategory(),
          confirmDismiss: () async {
            return await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ConformationSheet(
                  leadTitle: "Remove Category ?",
                  summary: "Are you sure wanna Remove this category",
                  onNo: () => Navigator.of(context).pop(false),
                  onYes: () => Navigator.of(context).pop(true),
                );
              },
            );
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red[100]!,
            foregroundColor: Colors.red,
            icon: CupertinoIcons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: CategoryItemTile(category: category),
    );
  }
}
