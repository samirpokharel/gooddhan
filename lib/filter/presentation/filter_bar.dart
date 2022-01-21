import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/filter/application/filter_notifier.dart';
import 'package:gooddhan/filter/domain/filter.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/filter/presentation/filter_sheet.dart';

class FilterBar extends ConsumerWidget {
  final bool showFilter;
  final Function(Filter filter) onApplyFilter;
  final Function(Filter filter) onFetchingDate;

  const FilterBar({
    Key? key,
    required this.onApplyFilter,
    required this.onFetchingDate,
    this.showFilter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final filterNotifier = ref.watch(filterNotifierProvider.notifier);
    final filterState = ref.watch(filterNotifierProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        children: [
          const Spacer(),
          if (showFilter)
            Container(
              alignment: Alignment.center,
              width: 50,
              child: OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => FilterSheet(
                      onApplyFilter: onApplyFilter,
                    ),
                  );
                },
                child: const FittedBox(
                  child: Icon(AppIcon.sort, size: 16),
                ),
              ),
            )
        ],
      ),
    );
  }
}
