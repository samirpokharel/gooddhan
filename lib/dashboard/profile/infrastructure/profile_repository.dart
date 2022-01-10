import 'package:dartz/dartz.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/profile/infrastructure/profile_remote_service.dart';

class ProfileRepository {
  final ProfileRemoteService _remoteService;

  ProfileRepository(this._remoteService);

  Future<Either<GooddhanFailure, User>> updateProfile({
    required String displayName,
    required String monthlyIncome,
    required String currency,
  }) async {
    try {
      final user = await _remoteService.updateProfile(
        displayName: displayName,
        monthlyIncome: monthlyIncome,
        currency: currency,
      );
      return right(user);
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }
}
