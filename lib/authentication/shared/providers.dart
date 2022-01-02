import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/authentication/infrastructure/Credential_storage/credential_storage.dart';
import 'package:gooddhan/authentication/infrastructure/Credential_storage/secure_credential_storage.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';
import 'package:google_sign_in/google_sign_in.dart';

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final credentialStorageProvider = Provider<CredentialStorage>((ref) {
  return SecureCredentialStorage(ref.read(flutterSecureStorageProvider));
});

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    signInOption: SignInOption.standard,
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
});
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final authenticatorProvidr = Provider<Authenticator>(
  (ref) {
    return Authenticator(
      credentialStorage: ref.read(credentialStorageProvider),
      googleSignIn: ref.read(googleSignInProvider),
      dio: ref.read(dioProvider),
    );
  },
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authenticatorProvidr)),
);
