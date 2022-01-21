import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:gooddhan/core/infrastructure/dio_extension.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/core/infrastructure/remote_response.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_headers.dart';

abstract class ExpensesRemoteService {
  final Dio _dio;
  final Connectivity _connectivity;
  final GooddhanHeaderCache _headerCache;

  ExpensesRemoteService(this._dio, this._connectivity, this._headerCache);

  Future<RemoteResponse<List<ExpenseDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
    GooddhanHeaders? previousHeader,
  }) async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        return const RemoteResponse.noConnection();
      }
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {"If-None-Match": previousHeader?.etag ?? ""},
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          totalPage: previousHeader?.totalPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GooddhanHeaders.parse(response);
        await _headerCache.saveHeader(requestUri, headers);
        final convertedData = jsonDataSelector(response.data)
            .map((e) => ExpenseDTO.fromJson(e))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          totalpage: headers.totalPage ?? 1,
        );
      } else {
        throw RestApiException(
          response.statusCode,
          message: response.data["error"],
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(
          e.response?.statusCode,
          message: e.response?.data["error"],
        );
      } else {
        rethrow;
      }
    }
  }

  Future<ExpenseDTO> createExpense({
    required Uri requestUri,
    required String categoryId,
    required String title,
    required num amount,
  }) async {
    try {
      final response = await _dio.postUri(
        requestUri,
        data: json.encode({
          "category": categoryId,
          "title": title,
          "amount": amount,
        }),
      );
      if (response.statusCode == 200) {
        return ExpenseDTO.fromJson(response.data["data"]);
      } else {
        throw RestApiException(
          response.statusCode,
          message: response.data["error"],
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw RestApiException(
          e.response?.statusCode,
          message: e.response?.data["error"],
        );
      } else if (e.isNoConnectionError) {
        throw RestApiException(null, message: "No internet Connection");
      }
      rethrow;
    }
  }

  Future<ExpenseDTO> updateExpense({
    required Uri requestUri,
    required String categoryId,
    required String title,
    required num amount,
  }) async {
    try {
      final response = await _dio.putUri(
        requestUri,
        data: json.encode({
          "category": categoryId,
          "title": title,
          "amount": amount,
        }),
      );
      if (response.statusCode == 200) {
        return ExpenseDTO.fromJson(response.data["data"]);
      } else {
        throw RestApiException(
          response.statusCode,
          message: response.data["error"],
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw RestApiException(
          e.response?.statusCode,
          message: e.response?.data["error"],
        );
      } else if (e.isNoConnectionError) {
        throw RestApiException(null, message: "No internet Connection");
      }
      rethrow;
    }
  }

  Future<void> deleteExpense({
    required Uri requestUri,
  }) async {
    try {
      await _dio.deleteUri(requestUri);
    } on DioError catch (e) {
      if (e.response != null) {
        throw RestApiException(
          e.response?.statusCode,
          message: e.response?.data["error"],
        );
      } else if (e.isNoConnectionError) {
        throw RestApiException(null, message: "No internet Connection");
      }
      rethrow;
    }
  }
}
