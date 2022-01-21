import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewData {
  final String title;
  final num value;

  OverviewData(this.title, this.value);
}

class OverViewChart extends StatelessWidget {
  final ReportElement report;
  const OverViewChart({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CircularSeries<OverviewData, String>> _getDefaultBarSeries() {
      return <PieSeries<OverviewData, String>>[
        PieSeries<OverviewData, String>(
          dataSource: [
            OverviewData("Monthly", report.monthlyIncome),
            OverviewData("Total Expense", report.totalExpense),
            OverviewData("Max Expense", report.maximumExpenseAmount),
            OverviewData(
              "Remaining",
              report.monthlyIncome - report.totalExpense,
            ),
          ],
          // width: 45,
          xValueMapper: (OverviewData data, _) => data.title,
          yValueMapper: (OverviewData data, _) => data.value,
        ),
      ];
    }

    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      padding: const EdgeInsets.all(20),
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          width: "50%",
        ),
        series: _getDefaultBarSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}
