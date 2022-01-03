import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gooddhan/authentication/domain/auth_failure.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/core/shared/constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Credential_storage/credential_storage.dart';

class Authenticator {
  final CredentialStorage _credentialStorage;
  final GoogleSignIn _googleSignIn;
  final Dio _dio;

  Authenticator({
    required CredentialStorage credentialStorage,
    required Dio dio,
    required GoogleSignIn googleSignIn,
  })  : _credentialStorage = credentialStorage,
        _dio = dio,
        _googleSignIn = googleSignIn;

  Future<String?> getSignedCredentials() async {
    try {
      final storedCredentials = await _credentialStorage.read();
      if (storedCredentials != null) return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> get isSigned {
    return _credentialStorage.read().then((token) => token != null);
  }

  Future<String?> getGoogleIdToken() async {
    final signInAccount = await _googleSignIn.signIn();
    if (signInAccount == null) return null;
    final googleSignInAuth = await signInAccount.authentication;
    return googleSignInAuth.idToken;
  }

  Future<Either<AuthFailure, User>> createAccount({
    required String currency,
    required String monthlyIncome,
    required String token,
  }) async {
    try {
      final requestObj = {
        "currency": currency,
        "monthlyIncome": monthlyIncome,
        "token": token,
      };
      final response = await _dio.post(
        "$baseUrl/user/create-account",
        data: json.encode(requestObj),
      );
      final responseData = response.data as Map<String, dynamic>;
      await _credentialStorage.save(responseData["token"]);
      User user = User.fromJson(responseData["user"]);
      return right(user);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response?.data["error"]);

        return left(
          AuthFailure.server(
            e.response?.statusCode,
            e.response?.data["error"],
          ),
        );
      }
      return left(const AuthFailure.storage());
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, User>> loginAccount({
    required String token,
  }) async {
    try {
      debugPrint(token);
      final requestObj = {"token": token};
      final response = await _dio.post(
        "$baseUrl/user/login-account",
        data: json.encode(requestObj),
      );
      final responseData = response.data as Map<String, dynamic>;
      await _credentialStorage.save(responseData["token"]);
      User user = User.fromJson(responseData["user"]);
      return right(user);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response?.data["error"]);
        return left(
          AuthFailure.server(
            e.response?.statusCode,
            e.response?.data["error"],
          ),
        );
      }
      return left(const AuthFailure.storage());
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _credentialStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
