import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/profile/infrastructure/profile_remote_service.dart';
import 'package:gooddhan/dashboard/profile/infrastructure/profile_repository.dart';

part 'profile_notifier.freezed.dart';

enum ProfileSuccessType { fetched, created, updated, delted }

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(
    User user, {
    @Default(ProfileSuccessType.fetched) ProfileSuccessType profileSuccessType,
  }) = _Success;
  const factory ProfileState.failed(GooddhanFailure failure) = _Failure;
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final AuthNotifier _authNotifier;
  final ProfileRepository _profileRepository;
  ProfileNotifier({
    required AuthNotifier authNotifier,
    required ProfileRepository profileRepository,
  })  : _authNotifier = authNotifier,
        _profileRepository = profileRepository,
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

  void updateProfile({
    required String displayName,
    required String monthlyIncome,
    required String currency,
  }) async {
    state = const ProfileState.loading();
    final successOrfailre = await _profileRepository.updateProfile(
      displayName: displayName,
      monthlyIncome: monthlyIncome,
      currency: currency,
    );
    successOrfailre.fold(
      (l) => state = ProfileState.failed(l),
      (r) => state = ProfileState.success(
        r,
        profileSuccessType: ProfileSuccessType.updated,
      ),
    );
  }

  void logout() async {
    await _authNotifier.signOut();
    state = const ProfileState.initial();
  }
}
