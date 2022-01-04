import 'package:flutter/material.dart';
import 'package:gooddhan/core/presentation/themes/app_icons.dart';

import 'dart:math' as math;

import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

class CategoryItemTile extends StatelessWidget {
  final Category category;
  final Widget? trailing;
  const CategoryItemTile({Key? key, required this.category, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          getIconFromCategory(category),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              category.categoryName,
              style: textTheme.headline2,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}

Widget getIconFromCategory(Category category, [int? iconSize]) {
  final colors = [Colors.teal, Colors.amberAccent, Colors.blue, Colors.pink];
  final randomColor = colors[math.Random().nextInt(colors.length - 1)];

  switch (category.categoryName.toLowerCase()) {
    case "shopping":
      return _categoryIcon(color: Colors.yellow, icon: AppIcon.shoppingBag);
    case "subscription":
      return _categoryIcon(
        color: Colors.deepPurple,
        icon: AppIcon.recurringBill,
      );
    case "food":
      return _categoryIcon(color: Colors.red, icon: AppIcon.restaurant);
    case "cloothing":
      return _categoryIcon(color: Colors.blue, icon: AppIcon.shopping);
    case "transportation":
      return _categoryIcon(color: Colors.green, icon: AppIcon.car);
    default:
      return _categoryIcon(color: randomColor, icon: Icons.dashboard_customize);
  }
}

Widget _categoryIcon({required Color color, required IconData icon}) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: color.withOpacity(.2),
    ),
    child: Icon(icon, color: color, size: 22),
  );
}
