import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

part 'filter.freezed.dart';

enum SortBy { highest, lowest, newest, oldest }
enum FetchingDates { week, month, year, all }

@freezed
class Filter with _$Filter {
  const Filter._();
  const factory Filter({
    @Default(SortBy.newest) SortBy sortBy,
    @Default(FetchingDates.all) FetchingDates fetchingDates,
    @Default([]) List<Category> selectedCategory,
    DateTimeRange? dateRange,
  }) = _Filter;

  String toQueryParam() {
    String queryParma = "?";

    if (sortBy == SortBy.highest) {
      queryParma += "sort=-amount";
    }
    if (sortBy == SortBy.lowest) {
      queryParma += "sort=amount";
    }
    if (sortBy == SortBy.newest) {
      queryParma += "sort=-createdAt";
    }
    if (sortBy == SortBy.oldest) {
      queryParma += "sort=createdAt";
    }
    if (selectedCategory.isNotEmpty) {
      // queryParma +=
      // "&category[in]=${selectedCategory.map((e) => e.id).join(",")}";
      String query =
          selectedCategory.map((e) => "category[in]=${e.id}").join('&');
      queryParma += "&$query";
    }
    if (dateRange != null) {
      queryParma +=
          "&createdAt[gte]=${dateRange!.start..toIso8601String()}&createdAt[lte]=${dateRange!.end.toIso8601String()}";
    }

    return queryParma;
  }
}
