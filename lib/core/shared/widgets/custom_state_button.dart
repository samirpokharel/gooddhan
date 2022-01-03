import 'package:flutter/material.dart';

enum ButtonStatus { idle, busy }

class CustomStateButton extends StatelessWidget {
  const CustomStateButton({
    Key? key,
    this.onPressed,
    this.text,
    this.textStyle,
    required this.buttonStatus,
    this.color,
  })  : _isLoading = buttonStatus == ButtonStatus.busy,
        super(key: key);

  final void Function()? onPressed;
  final String? text;
  final TextStyle? textStyle;
  final ButtonStatus buttonStatus;
  final bool _isLoading;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_isLoading ? 40 : 10),
      ),
      color: Theme.of(context).primaryColor,
      disabledColor: Colors.grey,
      minWidth: !_isLoading ? double.infinity : null,
      onPressed: onPressed,
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : _buildText(),
    );
  }

  Text _buildText() {
    return Text(
      text ?? "",
      style: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
    );
  }
}
