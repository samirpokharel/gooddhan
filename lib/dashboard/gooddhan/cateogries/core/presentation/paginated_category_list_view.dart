import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/application/paginated_category_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/failure_category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/loading_category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/application/list_categories_notifier.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';

class PaginatedCategoriesListView extends StatefulWidget {
  final StateNotifierProvider<ListCategoryNotifer, PaginatedCategoryState>
      paginatedCategoriesNotifierProvider;

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
              ? NoData(onRefresh: () => widget.onRefresh())
              : _PaginatedListView(state: state),
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.state,
  }) : super(key: key);

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
        failed: (_) => _.categories.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => CategoryItemTile(
            category: _.categories.entity[index],
          ),
          loadInProgress: (_) {
            if (index < _.categories.entity.length) {
              return CategoryItemTile(category: _.categories.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          success: (_) => CategoryItemTile(
            category: _.categories.entity[index],
          ),
          failed: (_) {
            if (index < _.categories.entity.length) {
              return CategoryItemTile(category: _.categories.entity[index]);
            } else {
              return FailureCategoryTile(failure: _.gooddhanFailure);
            }
          },
        );
      },
    );
  }
}
