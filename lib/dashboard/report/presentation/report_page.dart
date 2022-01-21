import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/shared/widgets/custom_profile_avatar.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/dashboard/profile/shared/providers.dart';

import 'package:gooddhan/dashboard/report/presentation/expense_category_report.dart';
import 'package:gooddhan/dashboard/report/presentation/expense_time_period_report.dart';
import 'package:gooddhan/dashboard/report/presentation/home_loading_widget.dart';
import 'package:gooddhan/dashboard/report/presentation/overview_chart.dart';
import 'package:gooddhan/dashboard/report/shared/providers.dart';

import 'package:intl/intl.dart';

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
              final report = _.report.report;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text("Wellcome"),
                    const SizedBox(height: 5),
                    profileState.maybeWhen(
                      orElse: () => const SizedBox(),
                      success: (user, _) {
                        return Row(
                          children: [
                            Text(
                              "Hi,${user.displayName.split(" ")[0]}",
                              style: context.headline1,
                            ),
                            const Spacer(),
                            ProfileAvatar(
                              radius: 20,
                              strokeWidth: 1,
                              gap: 3,
                              imageUrl: user.photoUrl,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: BuildDashBoardItem(
                            title: "Total Expense",
                            value: NumberFormat.compact().format(
                              report.totalExpense,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: BuildDashBoardItem(
                            title: "Monthy Income",
                            value: NumberFormat.compact().format(
                              report.monthlyIncome,
                            ),
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
            failed: (_) {
              return const HomeLoading();
            },
            loading: (_) => const HomeLoading(),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class BuildDashBoardItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  const BuildDashBoardItem({
    Key? key,
    required this.title,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).appBarTheme.backgroundColor,
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
