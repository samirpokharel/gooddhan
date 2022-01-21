import 'package:flutter/material.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseTimePeroidReport extends StatelessWidget {
  final Report report;
  const ExpenseTimePeroidReport({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SplineSeries<ExpenseReportOnTimePeroid, String>> _getSplineTypesSeries(
      List<ExpenseReportOnTimePeroid> reports,
    ) {
      DateFormat _standartDateFormat = DateFormat.MMMd('en_US');

      String formatDate(DateTime date) {
        return _standartDateFormat.format(date);
      }

      return <SplineSeries<ExpenseReportOnTimePeroid, String>>[
        SplineSeries<ExpenseReportOnTimePeroid, String>(
          // splineType: SplineType.cardinal,
          name: "expense",
          enableTooltip: true,
          markerSettings: const MarkerSettings(isVisible: true),
          dataSource: reports,
          xValueMapper: (ExpenseReportOnTimePeroid report, _) =>
              formatDate(report.date),
          yValueMapper: (ExpenseReportOnTimePeroid report, _) =>
              report.totalExpenseAmount,
          width: 3,
          emptyPointSettings: EmptyPointSettings(
            borderColor: Colors.pink,
          ),
        )
      ];
    }

    final currency = Currency.fromCode(report.report.currency).symbol;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      padding: const EdgeInsets.all(20),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Expense Over Time'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),

          // interval: 1,
        ),
        // crosshairBehavior: CrosshairBehavior(
        //   enable: true,
        //   activationMode: ActivationMode.singleTap,
        //   lineColor: Colors.red,
        // ),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryYAxis: NumericAxis(
          labelFormat: '$currency {value}',
          minimum: 0,
          numberFormat: NumberFormat.compact(),
          // maximum: report.report[0].monthlyIncome.toDouble(),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: _getSplineTypesSeries(report.expenseReportOnTimePeroid),
      ),
    );
  }
}
