import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/filter/domain/filter.dart';

final filterNotifierProvider =
    StateNotifierProvider<FilterNotifier, Filter>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier() : super(const Filter());

  void reset() {
    state = const Filter();
  }

  void onDateRangeChange(DateTimeRange dateRange) {
    if (dateRange != state.dateRange) {
      state = state.copyWith(dateRange: dateRange);
    }
  }

  void onSortBySelect(SortBy sortBy) {
    if (sortBy != state.sortBy) {
      state = state.copyWith(sortBy: sortBy);
    }
  }

  void onChooseCategoryChange(List<Category> categories) {
    if (categories != state.selectedCategory) {
      state = state.copyWith(selectedCategory: categories);
    }
  }

  void updateFetchingDates(FetchingDates fetchingDates) {
    if (fetchingDates != state.fetchingDates) {
      DateTime _now = DateTime.now();
      if (fetchingDates == FetchingDates.month) {
        state = state.copyWith(
          fetchingDates: fetchingDates,
          dateRange: DateTimeRange(
            start: _now.subtract(const Duration(days: 30)),
            end: _now,
          ),
        );
      } else if (fetchingDates == FetchingDates.year) {
        state = state.copyWith(
          fetchingDates: fetchingDates,
          dateRange: DateTimeRange(
            start: _now.subtract(const Duration(days: 30)),
            end: _now,
          ),
        );
      } else if (fetchingDates == FetchingDates.week) {
        state = state.copyWith(
          fetchingDates: fetchingDates,
          dateRange: DateTimeRange(
            start: _now.subtract(const Duration(days: 6)),
            end: _now,
          ),
        );
      } else {
        state = state.copyWith(
          fetchingDates: fetchingDates,
          dateRange: null,
        );
      }
    }
  }
}
