import 'package:gooddhan/core/infrastructure/remote_response.dart';
import 'package:gooddhan/core/shared/constant.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';
import 'package:dio/src/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/infrastructure/expenses_remote_service.dart';

class SearchedExpenseRemoteService extends ExpensesRemoteService {
  SearchedExpenseRemoteService(
    Dio dio,
    Connectivity connectivity,
    GooddhanHeaderCache headerCache,
  ) : super(dio, connectivity, headerCache);

  Future<RemoteResponse<List<ExpenseDTO>>> getSearchedExpensePage(
    String query,
    int page,
  ) async =>
      super.getPage(
        requestUri: Uri.parse(
          "$baseUrl/expenses?title[regex]=$query&title[options]=i",
        ),
        jsonDataSelector: (json) => json['data'] as List<dynamic>,
      );
}
