import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/dashboard/report/application/report_notifier.dart';
import 'package:gooddhan/dashboard/report/infrastrucutre/report_remote_service.dart';
import 'package:gooddhan/dashboard/report/infrastrucutre/report_repository.dart';

final reportRemoteServiceProvider = Provider<ReportRemoteService>((ref) {
  return ReportRemoteService(ref.watch(dioProvider));
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(ref.watch(reportRemoteServiceProvider));
});

final reportNotifierProvider =
    StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  return ReportNotifier(ref.watch(reportRepositoryProvider));
});
