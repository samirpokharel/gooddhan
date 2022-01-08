import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/core/domain/user.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:gooddhan/dashboard/report/infrastrucutre/report_repository.dart';

part 'report_notifier.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const ReportState._();
  const factory ReportState.initial({User? user}) = _Initial;
  const factory ReportState.loading({User? user}) = _Loading;
  const factory ReportState.success(Report report, {User? user}) = _Success;
  const factory ReportState.failed({GooddhanFailure? failure, User? user}) =
      _Failed;
}

class ReportNotifier extends StateNotifier<ReportState> {
  final ReportRepository _reportRepository;
  final AuthNotifier _authNotifier;

  ReportNotifier(this._reportRepository, this._authNotifier)
      : super(const ReportState.initial());

  void fetchReport() async {
    state = const ReportState.loading();
    final failureOrReport = await _reportRepository.fetchReport();
    failureOrReport.fold(
      (l) => state = ReportState.failed(failure: l),
      (r) => state = ReportState.success(r),
    );
  }

  void loadUser() async {
    if (mounted) {
      state = const ReportState.loading();
      state = _authNotifier.state.maybeWhen(
        authenticated: (_, user) => ProfileState.success(user),
        orElse: () => const ProfileState.initial(),
      );
    }
  }
}
