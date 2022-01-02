import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? Theme.of(context).primaryColor : null,
          border: Border.all(
            width: 2,
            color: !value ? _getColor(context) : Colors.transparent,
          ),
        ),
        child: TernaryOperator(
          condition: value,
          ifTrue: const Icon(
            CupertinoIcons.check_mark,
            color: Colors.white,
            size: 15,
          ),
          orElse: null,
        ).widget,
      ),
    );
  }

  Color _getColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.grey[800]!;
    }
    return const Color(0xffE9E9E9);
  }
}

class TernaryOperator<T> {
  bool condition;
  T ifTrue;
  T orElse;

  TernaryOperator({
    required this.condition,
    required this.ifTrue,
    required this.orElse,
  });
  T get widget => condition ? ifTrue : orElse;
}
