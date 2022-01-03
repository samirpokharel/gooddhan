import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/authentication/domain/auth_failure.dart';
import 'package:gooddhan/authentication/infrastructure/authenticator.dart';
import 'package:gooddhan/core/domain/user.dart';

part 'auth_notifier.freezed.dart';

enum AuthStatus { ideal, busy }

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial({
    @Default(AuthStatus.ideal) AuthStatus? status,
  }) = _AuthInitial;
  const factory AuthState.unauthenticated({
    @Default(AuthStatus.ideal) AuthStatus? status,
  }) = _AuthUnauthenticated;
  const factory AuthState.authenticated({
    @Default(AuthStatus.ideal) AuthStatus? status,
  }) = _AuthAuthenticated;
  const factory AuthState.failure(
    AuthFailure failure, {
    @Default(AuthStatus.ideal) AuthStatus? status,
  }) = _AuthFailed;
}

typedef AuthCallback = void Function(String? idToken);

class AuthNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator;
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSigned)
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> login() async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(status: AuthStatus.busy);
    final token = await _authenticator.getGoogleIdToken();
    if (token != null) {
      final successOrFaild = await _authenticator.loginAccount(token: token);
      return successOrFaild.fold(
        (l) => state = AuthState.failure(l, status: AuthStatus.ideal),
        (r) => state = const AuthState.authenticated(status: AuthStatus.ideal),
      );
    } else {
      state = const AuthState.unauthenticated(status: AuthStatus.ideal);
    }
  }

  Future<void> createGoogleAcountCred(AuthCallback authCallback) async {
    final token = await _authenticator.getGoogleIdToken();
    authCallback(token);
  }

  Future<void> createAccount(
    String? token, {
    required String currency,
    required String monthlyIncome,
  }) async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(status: AuthStatus.busy);
    if (token != null) {
      final failureOrSuccess = await _authenticator.createAccount(
        currency: currency,
        monthlyIncome: monthlyIncome,
        token: token,
      );
      return failureOrSuccess.fold(
        (l) => state = AuthState.failure(l, status: AuthStatus.ideal),
        (r) => state = const AuthState.authenticated(status: AuthStatus.ideal),
      );
    }
    state = const AuthState.unauthenticated(status: AuthStatus.ideal);
  }

  Future<void> signOut() async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(status: AuthStatus.busy);
    final failureOrSuccess = await _authenticator.signOut();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l, status: AuthStatus.ideal),
      (r) => const AuthState.unauthenticated(status: AuthStatus.ideal),
    );
  }
}
