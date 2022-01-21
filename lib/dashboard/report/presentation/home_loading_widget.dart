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

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade400,
      period: const Duration(milliseconds: 500),
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(height: 15, width: 90, color: Colors.grey),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(height: 25, width: 200, color: Colors.grey),
                const Spacer(),
                const CircleAvatar(radius: 25, backgroundColor: Colors.grey)
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Expanded(
                  child: BuildDashBoardItem(
                    title: "",
                    value: "",
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: BuildDashBoardItem(
                    title: "",
                    value: "",
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
