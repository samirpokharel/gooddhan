import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ClearFocus extends StatelessWidget {
  final Widget child;
  const ClearFocus({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
