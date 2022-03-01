import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:gooddhan/dashboard/report/infrastrucutre/report_repository.dart';

part 'report_notifier.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const ReportState._();
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.success(Report report) = _Success;
  const factory ReportState.failed({GooddhanFailure? failure}) = _Failed;
}

class ReportNotifier extends StateNotifier<ReportState> {
  bool isCalled = false;
  final ReportRepository _reportRepository;
  ReportNotifier(this._reportRepository) : super(const ReportState.initial()) {
    fetchReport();
    isCalled = true;
  }

  void fetchReport() async {
    final failureOrReport = await _reportRepository.fetchReport();
    failureOrReport.fold(
      (l) => state = ReportState.failed(failure: l),
      (r) => state = ReportState.success(r),
    );
  }
}
