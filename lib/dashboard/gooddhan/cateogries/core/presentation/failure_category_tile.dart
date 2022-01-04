import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';

class FailureCategoryTile extends ConsumerWidget {
  final GooddhanFailure failure;
  const FailureCategoryTile({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      iconColor: Theme.of(context).colorScheme.onError,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        color: Theme.of(context).errorColor,
        child: ListTile(
          title: const Text('An error ocurred, please retry'),
          subtitle: Text(
            failure.map(api: (_) => 'API returned ${_.statusCode}'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // context
              //     .findAncestorWidgetOfExactType<PaginatedReposListView>()
              //     ?.getNextPage(ref);
            },
          ),
        ),
      ),
    );
  }
}
