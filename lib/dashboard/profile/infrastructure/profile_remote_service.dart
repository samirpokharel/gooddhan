import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gooddhan/authentication/infrastructure/User_local_storage.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/core/infrastructure/dio_extension.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/core/shared/constant.dart';

class ProfileRemoteService {
  final Dio _dio;
  final UserLocalStorage _localStorage;

  ProfileRemoteService(this._dio, this._localStorage);

  Future<User> updateProfile({
    required String displayName,
    required String monthlyIncome,
    required String currency,
  }) async {
    try {
      final response = await _dio.put(
        "$baseUrl/user/update-account",
        data: json.encode({
          "displayName": displayName,
          "monthlyIncome": monthlyIncome,
          "currency": currency,
        }),
      );
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data["data"]);
        await _localStorage.upserUser(user);
        return user;
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
}
