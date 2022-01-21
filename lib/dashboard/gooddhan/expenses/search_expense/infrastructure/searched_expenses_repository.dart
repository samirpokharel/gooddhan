import 'package:dartz/dartz.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/infrastructure/extensions.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/search_expense/infrastructure/searched_expense_remote_service.dart';

class SearchedExpensesRepository {
  final SearchedExpenseRemoteService _remoteService;

  SearchedExpensesRepository(this._remoteService);

  Future<Either<GooddhanFailure, Fresh<List<Expense>>>> getSearchedReposPage(
    String query,
    int page,
  ) async {
    try {
      final remotePageItems =
          await _remoteService.getSearchedExpensePage(query, page);
      return right(
        remotePageItems.maybeWhen(
          withNewData: (data, maxPage) => Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: page < maxPage,
          ),
          orElse: () => Fresh.no([], isNextPageAvailable: false),
        ),
      );
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }
}
