// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      report: ReportElement.fromJson(json['report'] as Map<String, dynamic>),
      categoryReport: (json['categoryReport'] as List<dynamic>?)
              ?.map((e) => CategoryReport.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expenseReportOnTimePeroid: (json['expenseReportOnTimePeroid']
                  as List<dynamic>?)
              ?.map((e) =>
                  ExpenseReportOnTimePeroid.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'report': instance.report.toJson(),
      'categoryReport': instance.categoryReport.map((e) => e.toJson()).toList(),
      'expenseReportOnTimePeroid':
          instance.expenseReportOnTimePeroid.map((e) => e.toJson()).toList(),
    };

_$_CategoryReport _$$_CategoryReportFromJson(Map<String, dynamic> json) =>
    _$_CategoryReport(
      id: json['_id'] as String,
      totalExpenseAmount: json['totalExpenseAmount'] as num,
      avgExpenseAmount: json['avgExpenseAmount'] as num,
      categoryname: json['categoryname'] as String,
    );

Map<String, dynamic> _$$_CategoryReportToJson(_$_CategoryReport instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'totalExpenseAmount': instance.totalExpenseAmount,
      'avgExpenseAmount': instance.avgExpenseAmount,
      'categoryname': instance.categoryname,
    };

_$_ExpenseReportOnTimePeroid _$$_ExpenseReportOnTimePeroidFromJson(
        Map<String, dynamic> json) =>
    _$_ExpenseReportOnTimePeroid(
      totalExpenseAmount: json['totalExpenseAmount'] as num,
      averageExpenseAmount: json['averageExpenseAmount'] as num,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_ExpenseReportOnTimePeroidToJson(
        _$_ExpenseReportOnTimePeroid instance) =>
    <String, dynamic>{
      'totalExpenseAmount': instance.totalExpenseAmount,
      'averageExpenseAmount': instance.averageExpenseAmount,
      'date': instance.date.toIso8601String(),
    };

_$_ReportElement _$$_ReportElementFromJson(Map<String, dynamic> json) =>
    _$_ReportElement(
      id: json['_id'] as String,
      totalExpense: json['totalExpense'] as num,
      averageExpenseAmount: json['averageExpenseAmount'] as num,
      maximumExpenseAmount: json['maximumExpenseAmount'] as num,
      currency: json['currency'] as String,
      monthlyIncome: json['monthlyIncome'] as num,
    );

Map<String, dynamic> _$$_ReportElementToJson(_$_ReportElement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'totalExpense': instance.totalExpense,
      'averageExpenseAmount': instance.averageExpenseAmount,
      'maximumExpenseAmount': instance.maximumExpenseAmount,
      'currency': instance.currency,
      'monthlyIncome': instance.monthlyIncome,
    };
