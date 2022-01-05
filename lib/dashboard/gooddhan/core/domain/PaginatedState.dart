import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
part 'PaginatedState.freezed.dart';

@freezed
class PaginatedCategoryState<T> with _$PaginatedCategoryState<T> {
  const PaginatedCategoryState._();
  const factory PaginatedCategoryState.initial(
    T categories,
  ) = _Initial;
  const factory PaginatedCategoryState.loadInProgress(
    T categories,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedCategoryState.success(
    T categories, {
    required bool isNextPageAvilabel,
  }) = _Success;
  const factory PaginatedCategoryState.failed(
    T categories,
    GooddhanFailure gooddhanFailure,
  ) = _Failed;
}
