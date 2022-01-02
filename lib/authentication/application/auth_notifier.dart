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

class AuthNotifier extends StateNotifier<AuthState> {
  final Authenticator _authenticator;
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSigned)
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }
}
