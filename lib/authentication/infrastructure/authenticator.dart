import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:gooddhan/authentication/domain/auth_failure.dart';
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

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _credentialStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
