import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/dashboard/profile/application/profile_notifier.dart';
import 'package:gooddhan/dashboard/profile/infrastructure/profile_remote_service.dart';
import 'package:gooddhan/dashboard/profile/infrastructure/profile_repository.dart';

final profileRemoteServiceProvider = Provider<ProfileRemoteService>((ref) {
  return ProfileRemoteService(
    ref.watch(dioProvider),
    ref.watch(userlocalStorageProvider),
  );
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(profileRemoteServiceProvider));
});

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(
    authNotifier: ref.watch(authNotifierProvider.notifier),
    profileRepository: ref.watch(
      profileRepositoryProvider,
    ),
  );
});
