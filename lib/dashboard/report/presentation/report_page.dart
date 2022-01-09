import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';
import 'package:gooddhan/core/shared/widgets/custom_profile_avatar.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/dashboard/profile/application/profile_notifier.dart';

import 'package:gooddhan/dashboard/report/domain/report.dart';
import 'package:gooddhan/dashboard/report/shared/providers.dart';
import 'package:gooddhan/filter/presentation/filter_bar.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

String toString(num value) {
  const units = <num, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}

class ReportPage extends ConsumerStatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportPageState();
}

class _ReportPageState extends ConsumerState<ReportPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ref.read(reportNotifierProvider.notifier).fetchReport();
      ref.read(profileNotifierProvider.notifier).loadUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(reportNotifierProvider);
    final profileState = ref.watch(profileNotifierProvider);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: reportState.maybeMap(
            success: (_) {
              final currency =
                  Currency.fromCode(_.report.report.currency).symbol;
              final report = _.report.report;
              DateFormat _standartDateFormat = DateFormat.yMMMd('en_US');

              String formatDate(DateTime date) {
                return _standartDateFormat.format(date);
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text("Wellcome"),
                    const SizedBox(height: 5),
                    profileState.maybeWhen(
                      success: (user) {
                        return Row(
                          children: [
                            Text(
                              "Hi,${user.displayName.split(" ")[0]}",
                              style: context.headline1,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: ProfileAvatar(
                                radius: 20,
                                strokeWidth: 1,
                                gap: 3,
                                imageUrl: "${user.photoUrl}",
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox(),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: BuildDashBoardItem(
                            title: "Total Expense",
                            value: "$currency ${toString(report.totalExpense)}",
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: BuildDashBoardItem(
                            title: "Monthy Income",
                            value:
                                "$currency ${toString(report.monthlyIncome)}",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    OverViewChart(report: _.report.report),
                    const SizedBox(height: 20),
                    ExpenseCategoryReport(
                      expenseCategoryReport: _.report.categoryReport,
                    ),
                    const SizedBox(height: 20),
                    ExpenseTimePeroidReport(report: _.report),
                  ],
                ),
              );
            },
            failed: (_) => Center(child: Text(_.failure!.message ?? "")),
            loading: (_) => CustomLoadingWraper(
              isLoading: true,
              child: HomeLoading(profileState: profileState),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class HomeLoading extends StatelessWidget {
  const HomeLoading({
    Key? key,
    required this.profileState,
  }) : super(key: key);

  final ProfileState profileState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text("Wellcome"),
          const SizedBox(height: 5),
          profileState.maybeWhen(
            success: (user) {
              return Row(
                children: [
                  Text(
                    "Hi,${user.displayName.split(" ")[0]}",
                    style: context.headline1,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: ProfileAvatar(
                      radius: 20,
                      strokeWidth: 1,
                      gap: 3,
                      imageUrl: "${user.photoUrl}",
                    ),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox(),
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              Expanded(
                child: BuildDashBoardItem(
                  title: "Total Expense",
                  value: "0",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BuildDashBoardItem(
                  title: "Monthy Income",
                  value: "0",
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const OverViewChart(report: ReportElement(id: "random")),
          const SizedBox(height: 20),
          const ExpenseCategoryReport(expenseCategoryReport: []),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

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
        crosshairBehavior: CrosshairBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineColor: Colors.red,
        ),
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
        crosshairBehavior: CrosshairBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineColor: Colors.red,
        ),
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

class BuildDashBoardItem extends StatelessWidget {
  final String title;
  final String value;
  const BuildDashBoardItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 10),
          Text(
            value,
            style: context.headline2!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
