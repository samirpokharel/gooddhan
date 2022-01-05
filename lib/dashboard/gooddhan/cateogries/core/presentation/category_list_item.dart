import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gooddhan/core/shared/widgets/custom_conformation_sheet.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/presentation/category_tile.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key? key,
    required this.category,
    required this.deleteCategory,
  }) : super(key: key);

  final Category category;
  final Function deleteCategory;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          onDismissed: () => deleteCategory(),
          confirmDismiss: () async {
            return await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ConformationSheet(
                  leadTitle: "Remove Category ?",
                  summary: "Are you sure wanna Remove this category",
                  onNo: () => Navigator.of(context).pop(false),
                  onYes: () => Navigator.of(context).pop(true),
                );
              },
            );
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red[100]!,
            foregroundColor: Colors.red,
            icon: CupertinoIcons.delete,
            label: 'Remove',
          ),
        ],
      ),
      child: CategoryItemTile(category: category),
    );
  }
}
