import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/presentation/category_picker.dart';
import 'package:gooddhan/filter/application/filter_notifier.dart';
import 'package:gooddhan/filter/domain/filter.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';
import 'package:gooddhan/settings/shared/providers.dart';
import 'package:intl/intl.dart';

class FilterSheet extends ConsumerWidget {
  final Function(Filter filter) onApplyFilter;
  const FilterSheet({
    Key? key,
    required this.onApplyFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;

    final filterNotifier = ref.watch(filterNotifierProvider.notifier);
    final filterState = ref.watch(filterNotifierProvider);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    String formatDate(DateTime date) {
      return ref.watch(settingNotiferProvider).formatDate(date);
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 35,
              color: primaryColor.withOpacity(.2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Filter Expenses",
                style: textTheme.headline2,
              ),
              const Spacer(),
              TextButton(
                child: const Text('reset'),
                onPressed: () => filterNotifier.reset(),
              )
            ],
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 16),
          Text(
            "Filter By Date Range",
            style: textTheme.headline2,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              OutlinedButton(
                onPressed: () async {
                  final dateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                    initialDateRange: DateTimeRange(
                      start: filterState.dateRange?.start ?? DateTime.now(),
                      end: filterState.dateRange?.end ?? DateTime.now(),
                    ),
                  );
                  if (dateRange != null) {
                    filterNotifier.onDateRangeChange(dateRange);
                  }
                },
                child: Text(
                  filterState.dateRange != null
                      ? "${formatDate(filterState.dateRange!.start)}"
                          " - ${formatDate(filterState.dateRange!.end)}"
                      : 'Select date by range',
                  style: textTheme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDark ? Colors.grey[800]! : const Color(0xffE9E9E9),
                    width: 1,
                  ),
                ),
                child: DropdownButton<FetchingDates>(
                  iconSize: 5,
                  value: filterState.fetchingDates,
                  onChanged: (FetchingDates? val) {
                    if (val != null) {
                      filterNotifier.updateFetchingDates(val);
                    }
                  },
                  iconEnabledColor: Theme.of(context).primaryColor,
                  icon: const Icon(AppIcon.arrowDown),
                  underline: const SizedBox(),
                  items: _mapFetchingDatesToDropDown(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Sort By",
            style: textTheme.headline2,
          ),
          const SizedBox(height: 16),
          Wrap(
            children: SortBy.values.map(
              (item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ChoiceChip(
                    onSelected: (bool val) {
                      filterNotifier.onSortBySelect(item);
                    },
                    label: Text(item.name),
                    selected: filterState.sortBy == item,
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            "Category",
            style: textTheme.headline2,
          ),
          const SizedBox(height: 16),
          CustomValueTile(
            title: "Choose Category",
            onTap: () async {
              final categories = await showCategoryPicker(
                context: context,
                selectableType: SelectableType.multiple,
                initialCategories: filterState.selectedCategory,
              );
              if (categories != null) {
                filterNotifier.onChooseCategoryChange(categories);
              }
            },
            value: "${filterState.selectedCategory.length} selected",
          ),
          const Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            height: 56,
            color: primaryColor,
            child: Text(
              "Apply",
              style: textTheme.bodyText1?.copyWith(color: Colors.white),
            ),
            onPressed: () {
              onApplyFilter(filterState);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<FetchingDates>> _mapFetchingDatesToDropDown() {
    return FetchingDates.values
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.name),
            value: e,
          ),
        )
        .toList();
  }
}
