import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gooddhan/core/infrastructure/dio_extension.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/core/shared/constant.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';

class ReportRemoteService {
  final Dio _dio;

  ReportRemoteService(this._dio);

  Future<Report> getReport({DateTimeRange? range}) async {
    try {
      final url = range != null
          ? "$baseUrl/report?start=${range.start.toIso8601String()}&end=${range.end.toIso8601String()}"
          : "$baseUrl/report";
      final response = await _dio.get(url);
      return Report.fromJson(response.data["data"]);
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
