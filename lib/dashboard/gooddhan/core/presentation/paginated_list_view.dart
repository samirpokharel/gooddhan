import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';

class PaginatedListView<T> extends StatelessWidget {
  final Widget Function(T item) initialItem;
  final Widget Function(T item) succesItem;
  final Widget Function(T item) failedItem;
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
        loadInProgress: (_) => _.items.entity.length + _.itemsPerPage,
        success: (_) => _.items.entity.length,
        failed: (_) => _.items.entity.length,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => initialItem(_.items.entity[index]),
          loadInProgress: (_) {
            if (index < _.items.entity.length) {
              return succesItem(_.items.entity[index]);
            }
            return const LoadingListTile();
          },
          success: (_) => succesItem(_.items.entity[index]),
          failed: (_) => failedItem(_.items.entity[index]),
        );
      },
    );
  }
}
