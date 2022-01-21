import 'package:dartz/dartz.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/infrastructure/extensions.dart';
import 'package:gooddhan/filter/domain/filter.dart';

import 'list_expenses_local_service.dart';
import 'list_cxpenses_remote_service.dart';

class ListExpensesRepository {
  final ListExpensesLocalService _localService;
  final ListExpenseRemoteService _remoteService;

  ListExpensesRepository(this._localService, this._remoteService);

  Future<Either<GooddhanFailure, Fresh<List<Expense>>>> getExpensesList(
    int page, {
    Filter? filter,
  }) async {
    try {
      final remotePageItem =
          await _remoteService.getExpensesListPage(page, filter: filter);
      return right(
        await remotePageItem.when(
          noConnection: () async {
            return Fresh.no(
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable:
                  page < await _localService.getLocalPageCount(),
            );
          },
          notModified: (totalPage) async {
            return Fresh.yes(
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable: page < totalPage,
            );
          },
          withNewData: (data, totalPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < totalPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode));
    }
  }

  Future<Either<GooddhanFailure, ExpenseDTO>> createExpense(
    String categoryId,
    num amount,
    String title,
  ) async {
    try {
      await _localService.clearData();
      return right(
        await _remoteService.createNewExpense(categoryId, amount, title),
      );
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }

  Future<Either<GooddhanFailure, ExpenseDTO>> updateSingleExpense({
    required String categoryId,
    required num amount,
    required String title,
    required String expenseId,
  }) async {
    try {
      await _localService.clearData();
      return right(
        await _remoteService.updateSingleExpense(
          amount: amount,
          categoryId: categoryId,
          title: title,
          expenseId: expenseId,
        ),
      );
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }

  Future<Either<GooddhanFailure, Unit>> deleteExpense(
    String id,
  ) async {
    try {
      await _remoteService.deleteSingleExpense(id);
      return right(unit);
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }
}
