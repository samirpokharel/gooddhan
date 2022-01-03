import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/domain/user.dart';

part 'profile_notifier.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(User user) = _Success;
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(
    authNotifier: ref.watch(authNotifierProvider.notifier),
  );
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final AuthNotifier _authNotifier;
  ProfileNotifier({required AuthNotifier authNotifier})
      : _authNotifier = authNotifier,
        super(const ProfileState.initial());

  void loadUser() async {
    if (mounted) {
      state = const ProfileState.loading();
      state = _authNotifier.state.maybeWhen(
        authenticated: (_, user) => ProfileState.success(user),
        orElse: () => const ProfileState.initial(),
      );
    }
  }

  void logout() async {
    await _authNotifier.signOut();
    state = const ProfileState.initial();
  }
}
