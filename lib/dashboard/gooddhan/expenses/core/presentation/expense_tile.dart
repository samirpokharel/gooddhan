import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/settings/shared/providers.dart';
import 'package:intl/intl.dart';

class ExpenseTile extends ConsumerWidget {
  const ExpenseTile({
    Key? key,
    required this.expense,
  }) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context, ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    DateFormat _timeFormat = DateFormat("jm");

    String formatDate(DateTime date) {
      return ref.read(settingNotiferProvider).formatDate(date);
    }

    return Material(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        onTap: () {},
        leading: getIconFromCategory(expense.category),
        title: Row(
          children: [
            Expanded(
              child: Text(
                expense.category.categoryName,
                style: textTheme.headline2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "- ${expense.currency.symbol} ${expense.amount}",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              expense.title,
              style: textTheme.bodyText2?.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Text(
                  formatDate(expense.createdAt),
                  style: textTheme.bodyText2?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  _timeFormat.format(expense.createdAt),
                  style: textTheme.bodyText2?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
