import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseCategoryReport extends StatelessWidget {
  final List<CategoryReport> expenseCategoryReport;
  const ExpenseCategoryReport({
    Key? key,
    required this.expenseCategoryReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarSeries<CategoryReport, String>> _categoryWiseChartData(
      List<CategoryReport> datas,
      BuildContext context,
    ) {
      return [
        BarSeries<CategoryReport, String>(
          color: Theme.of(context).primaryColor,
          yValueMapper: (CategoryReport report, _) => report.totalExpenseAmount,
          xValueMapper: (CategoryReport report, _) => report.categoryname,
          dataSource: datas,
          dataLabelSettings: const DataLabelSettings(
            textStyle: TextStyle(fontSize: 12),
            isVisible: true,
          ),
        ),
      ];
    }

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      padding: const EdgeInsets.all(20),
      child: SfCartesianChart(
        series: _categoryWiseChartData(expenseCategoryReport, context),
        // crosshairBehavior: CrosshairBehavior(
        //   enable: true,
        //   activationMode: ActivationMode.singleTap,
        //   lineColor: Colors.red,
        // ),
        title: ChartTitle(text: 'Expense on Category'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          // labelRotation: 20,
          labelStyle: const TextStyle(color: Colors.grey),
          labelAlignment: LabelAlignment.end,
          labelPosition: ChartDataLabelPosition.outside,
          labelPlacement: LabelPlacement.betweenTicks,
          labelIntersectAction: AxisLabelIntersectAction.rotate45,
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelStyle: const TextStyle(color: Colors.grey),
          numberFormat: NumberFormat.compact(),
        ),
      ),
    );
  }
}
