import 'package:flutter/material.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';

class CustomValueTile extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? color;

  const CustomValueTile({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
    this.color,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: color,
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 50,
          child: Row(
            children: [
              Text(
                title,
                style: context.headline2?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              _buildTrailing(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildTrailing(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    if (trailing != null) {
      return trailing;
    }
    return Row(
      children: [
        Text(value ?? ""),
        const SizedBox(width: 10),
        Icon(Icons.arrow_forward_ios, color: primaryColor, size: 17)
      ],
    );
  }
}
