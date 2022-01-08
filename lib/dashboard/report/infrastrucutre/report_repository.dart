import 'package:dartz/dartz.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:gooddhan/dashboard/report/infrastrucutre/report_remote_service.dart';

class ReportRepository {
  final ReportRemoteService _remoteService;

  ReportRepository(this._remoteService);

  Future<Either<GooddhanFailure, Report>> fetchReport() async {
    try {
      return right(await _remoteService.getReport());
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode, e.message));
    }
  }
}
