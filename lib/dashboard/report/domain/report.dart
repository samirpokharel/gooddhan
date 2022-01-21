import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
abstract class Report with _$Report {
  const factory Report({
    required ReportElement report,
    @Default([]) List<CategoryReport> categoryReport,
    @Default([]) List<ExpenseReportOnTimePeroid> expenseReportOnTimePeroid,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

@freezed
abstract class CategoryReport with _$CategoryReport {
  const factory CategoryReport({
    @JsonKey(name: "_id") required String id,
    required num totalExpenseAmount,
    required num avgExpenseAmount,
    required String categoryname,
  }) = _CategoryReport;

  factory CategoryReport.fromJson(Map<String, dynamic> json) =>
      _$CategoryReportFromJson(json);
}

@freezed
abstract class ExpenseReportOnTimePeroid with _$ExpenseReportOnTimePeroid {
  const factory ExpenseReportOnTimePeroid({
    required num totalExpenseAmount,
    required num averageExpenseAmount,
    required DateTime date,
  }) = _ExpenseReportOnTimePeroid;

  factory ExpenseReportOnTimePeroid.fromJson(Map<String, dynamic> json) =>
      _$ExpenseReportOnTimePeroidFromJson(json);
}

@freezed
abstract class ReportElement with _$ReportElement {
  const factory ReportElement({
    @JsonKey(name: "_id") required String id,
    @Default(0) num totalExpense,
    @Default(0) num averageExpenseAmount,
    @Default(0) num maximumExpenseAmount,
    @Default("NRS") String currency,
    @Default(0) num monthlyIncome,
  }) = _ReportElement;

  factory ReportElement.fromJson(Map<String, dynamic> json) =>
      _$ReportElementFromJson(json);
}
