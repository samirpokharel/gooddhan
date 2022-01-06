import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gooddhan/core/shared/widgets/custom_conformation_sheet.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/expenses/core/presentation/expense_tile.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({
    Key? key,
    required this.expense,
    required this.onDeleteExpense,
    required this.onUpdate,
  }) : super(key: key);

  final Expense expense;
  final VoidCallback onDeleteExpense;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(
        //   closeOnCancel: true,
        //   onDismissed: () => onDeleteExpense(),
        //   confirmDismiss: () async {
        //     return await showModalBottomSheet(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return ConformationSheet(
        //           leadTitle: "Remove Expense ?",
        //           summary: "Are you sure wanna Remove this expense",
        //           onNo: () => Navigator.of(context).pop(false),
        //           onYes: () => Navigator.of(context).pop(true),
        //         );
        //       },
        //     );
        //   },
        // ),
        children: [
          SlidableAction(
            onPressed: (context) {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ConformationSheet(
                    leadTitle: "Remove Expense ?",
                    summary: "Are you sure wanna Remove this Expense",
                    onNo: () => Navigator.pop(context),
                    onYes: () {
                      Navigator.of(context).pop(true);
                      onDeleteExpense();
                    },
                  );
                },
              );
            },
            backgroundColor: Colors.red.withOpacity(.2),
            foregroundColor: Colors.red,
            icon: CupertinoIcons.delete,
            label: 'Remove',
          ),
          SlidableAction(
            onPressed: (context) => onUpdate(),
            backgroundColor: Colors.green.withOpacity(.2),
            foregroundColor: Colors.green,
            icon: Icons.edit,
            label: 'Update',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpenseTile(expense: expense),
      ),
    );
  }
}
