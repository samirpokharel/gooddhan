import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gooddhan/core/shared/toasts.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/paginated_state.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/no_data_widget.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/paginated_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/pagination_wrapper.dart';

class PaginatedExpensesListView extends StatefulWidget {
  final void Function() getNextPage;
  final void Function() onRefresh;
  final PaginatedState paginatedState;
  final dynamic provider;

  final String noResultMessage;
  final PaginatedListView paginatedListWidget;

  const PaginatedExpensesListView({
    Key? key,
    required this.paginatedState,
    required this.getNextPage,
    required this.noResultMessage,
    required this.onRefresh,
    required this.provider,
    required this.paginatedListWidget,
  }) : super(key: key);

  @override
  _PaginatedExpensesListViewState createState() =>
      _PaginatedExpensesListViewState();
}

class _PaginatedExpensesListViewState extends State<PaginatedExpensesListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, chield) {
        ref.listen<PaginatedState>(
          widget.provider,
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
                    message: "Expense successfully Created",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                } else if (_.successType == SuccessType.deleted) {
                  showFlashToast(
                    context,
                    message: "Expense Successfully deleted",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                } else if (_.successType == SuccessType.updated) {
                  showFlashToast(
                    context,
                    message: "Expense Successfully Updated",
                    flavouer: ToastFlavouer.success,
                    dismissDuration: const Duration(seconds: 3),
                  );
                }
                return canLoadNextPage = _.isNextPageAvilabel;
              },
              failed: (_) {
                canLoadNextPage = false;
              },
            );
          },
        );

        return PaginationWrapper(
          canLoadNextPage: canLoadNextPage,
          getNextPage: widget.getNextPage,
          child: widget.paginatedState.maybeWhen(
            success: (categories, _, successTyple) => categories.entity.isEmpty,
            orElse: () => false,
          )
              ? NoData(
                  errorMessage: widget.noResultMessage,
                  onRefresh: () => widget.onRefresh(),
                )
              : widget.paginatedListWidget,
        );
      },
    );
  }
}
