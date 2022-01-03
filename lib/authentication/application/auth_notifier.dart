import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';
import 'package:gooddhan/core/domain/user.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.unauthenticated() = _AuthUnauthenticated;
  const factory AuthState.authenticated() = _AuthAuthenticated;
  const factory AuthState.failure() = _AuthFailed;
}

typedef AuthCallback = Future<String?> Function(String? idToken);

class AuthNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator;
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSigned)
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> login() async {
    final token = await _authenticator.getGoogleIdToken();
    if (token != null) {
      final successOrFaild = await _authenticator.loginAccount(token: token);
      successOrFaild.fold(
        (l) => state = const AuthState.unauthenticated(),
        (r) => state = const AuthState.authenticated(),
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> createGoogleAcountCred(AuthCallback authCallback) async {
    await authCallback(await _authenticator.getGoogleIdToken());
  }

  Future<void> createAccount(
    String token, {
    required String currency,
    required String monthlyIncome,
  }) async {
    final failureOrSuccess = await _authenticator.createAccount(
      currency: currency,
      monthlyIncome: monthlyIncome,
      token: token,
    );
    state = failureOrSuccess.fold(
      (l) => const AuthState.unauthenticated(),
      (r) => const AuthState.authenticated(),
    );
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();
    state = failureOrSuccess.fold(
      (l) => const AuthState.failure(),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
