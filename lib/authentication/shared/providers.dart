import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/authentication/infrastructure/Credential_storage/credential_storage.dart';
import 'package:gooddhan/authentication/infrastructure/Credential_storage/secure_credential_storage.dart';
import 'package:gooddhan/authentication/infrastructure/User_local_storage.dart';
import 'package:gooddhan/authentication/infrastructure/auth_interceptor.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/shared/providers.dart';
import 'package:google_sign_in/google_sign_in.dart';

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final userlocalStorageProvider = Provider<UserLocalStorage>((ref) {
  return UserLocalStorage(sembastDatabase: ref.watch(sembastProvider));
});

final credentialStorageProvider = Provider<CredentialStorage>((ref) {
  return SecureCredentialStorage(ref.watch(flutterSecureStorageProvider));
});

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    signInOption: SignInOption.standard,
    scopes: ['email'],
  );
});
final dioForAuthProvider = Provider<Dio>((ref) {
  return Dio();
});
final authenticatorProvidr = Provider<Authenticator>(
  (ref) {
    return Authenticator(
      listExpensesLocalService: ref.watch(listExpenseLocalServiceProvider),
      userLocalStorage: ref.watch(userlocalStorageProvider),
      credentialStorage: ref.watch(credentialStorageProvider),
      googleSignIn: ref.watch(googleSignInProvider),
      dio: ref.watch(dioForAuthProvider),
    );
  },
);

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(ref.watch(authenticatorProvidr));
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authenticatorProvidr)),
);
