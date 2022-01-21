import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final void Function()? onPressed;
  const ProfileMenuCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialButton(
      height: 90,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.withOpacity(.2),
            ),
            child: Icon(icon, color: color, size: 25),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(title, style: textTheme.headline2))
        ],
      ),
    );
  }
}
