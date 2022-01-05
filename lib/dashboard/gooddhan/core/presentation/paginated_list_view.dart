import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

class PaginatedListView extends StatelessWidget {
  final Widget Function(Category category) initialItem;
  final Widget Function(Category category) succesItem;
  final Widget Function(Category category) failedItem;
  // final void Function(Category category)? onSelect;

  final dynamic state;

  const PaginatedListView({
    Key? key,
    required this.initialItem,
    required this.succesItem,
    // this.onSelect,
    required this.failedItem,
    required this.state,
  }) : super(key: key);

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
          initial: (_) => initialItem(_.categories.entity[index]),
          loadInProgress: (_) {
            if (index < _.categories.entity.length) {
              return succesItem(_.categories.entity[index]);
            }
            return const LoadingListTile();
          },
          success: (_) => succesItem(_.categories.entity[index]),
          failed: (_) => failedItem(_.categories.entity[index]),
        );
      },
    );
  }
}
