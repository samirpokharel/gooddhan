import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';

part 'paginated_state.freezed.dart';

enum SuccessType { fetched, created, updated, deleted }

@freezed
class PaginatedState<T> with _$PaginatedState<T> {
  const PaginatedState._();
  const factory PaginatedState.initial(T items) = _Initial;
  const factory PaginatedState.loadInProgress(T items, int itemsPerPage) =
      _LoadInProgress;
  const factory PaginatedState.success(
    T items, {
    required bool isNextPageAvilabel,
    required SuccessType successType,
  }) = _Success;
  const factory PaginatedState.failed(
    T items,
    GooddhanFailure gooddhanFailure,
  ) = _Failed;
}
