import 'package:flutter/material.dart';
import 'package:gooddhan/dashboard/report/presentation/report_page.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color baseColor = isDark ? Colors.grey.shade800 : Colors.grey.shade300;

    return Shimmer.fromColors(
      baseColor: baseColor,
      period: const Duration(milliseconds: 500),
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: BuildDashBoardItem(
                    title: "",
                    value: "",
                    color: baseColor,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BuildDashBoardItem(
                    title: "",
                    value: "",
                    color: baseColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: baseColor,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: baseColor,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
