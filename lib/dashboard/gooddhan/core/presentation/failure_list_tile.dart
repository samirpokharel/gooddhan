import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/paginated_category_list_view.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';

class FailureListTile extends ConsumerWidget {
  final GooddhanFailure failure;
  const FailureListTile({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTileTheme(
      textColor: Theme.of(context).errorColor,
      iconColor: Theme.of(context).errorColor,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        color: Colors.red[100],
        child: ListTile(
          title: const Text(
            'An error ocurred, please retry',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          subtitle: Text(
            failure.map(
              api: (_) => _.message ?? 'API returned ${_.statusCode}',
            ),
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
              context
                  .findAncestorWidgetOfExactType<PaginatedCategoriesListView>()
                  ?.getNextPage();
            },
          ),
        ),
      ),
    );
  }
}
