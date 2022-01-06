import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gooddhan/core/infrastructure/remote_response.dart';
import 'package:gooddhan/core/shared/constant.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/infrastructure/expenses_remote_service.dart';

class ListExpenseRemoteService extends ExpensesRemoteService {
  ListExpenseRemoteService(
    Dio dio,
    Connectivity connectivity,
    GooddhanHeaderCache headerCache,
  ) : super(dio, connectivity, headerCache);

  Future<RemoteResponse<List<ExpenseDTO>>> getExpensesListPage(int page) {
    return super.getPage(
      requestUri: Uri.parse(
        "$baseUrl/expenses?page=$page&limit=${PaginationConfig.itermsPerPage}&sort=createdAt",
      ),
      jsonDataSelector: (data) => data["data"] as List<dynamic>,
    );
  }

  Future<ExpenseDTO> createNewExpense(
    String categoryId,
    num amount,
    String title,
  ) {
    return super.createExpense(
      amount: amount,
      categoryId: categoryId,
      title: title,
      requestUri: Uri.parse("$baseUrl/expenses"),
    );
  }

  Future<ExpenseDTO> updateSingleExpense({
    required String categoryId,
    required num amount,
    required String title,
    required String expenseId,
  }) {
    return super.updateExpense(
      amount: amount,
      categoryId: categoryId,
      title: title,
      requestUri: Uri.parse("$baseUrl/expenses/$expenseId"),
    );
  }

  Future<void> deleteSingleExpense(String id) {
    return super.deleteExpense(
      requestUri: Uri.parse("$baseUrl/expenses/$id"),
    );
  }
}
