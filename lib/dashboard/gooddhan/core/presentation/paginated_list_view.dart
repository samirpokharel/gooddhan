import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';
import 'package:gooddhan/dashboard/gooddhan/core/presentation/loading_list_tile.dart';

class PaginatedListView<T> extends StatelessWidget {
  final Widget Function(T item) initialItem;
  final Widget Function(T item) succesItem;
  final Widget Function(T item) failedItem;
  final bool srinkWrap;

  final dynamic state;

  const PaginatedListView({
    Key? key,
    required this.initialItem,
    required this.succesItem,
    // this.onSelect,
    required this.failedItem,
    this.srinkWrap = false,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.items.entity.length + _.itemsPerPage,
        success: (_) => _.items.entity.length,
        failed: (_) => _.items.entity.length,
      ),
      shrinkWrap: srinkWrap,
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => const LoadingListTile(),
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
