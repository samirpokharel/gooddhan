import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

enum ToastFlavouer { error, warn, success }

_colorBaseOnFlavour(ToastFlavouer _) {
  switch (_) {
    case ToastFlavouer.success:
      return [Colors.green, Icons.check];
    case ToastFlavouer.warn:
      return [Colors.amber, Icons.warning];
    default:
      return [Colors.red, Icons.error];
  }
}

void showFlashToast(
  BuildContext context, {
  String? message = "Something went wrong",
  Duration? dismissDuration,
  ToastFlavouer flavouer = ToastFlavouer.error,
  bool barrierDismissible = false,
}) {
  // if (message!.startsWith("Dublicate field")) {
  //   message = "This Email is already used";
  // }
  showFlash(
    context: context,
    builder: (context, _) {
      final color = _colorBaseOnFlavour(flavouer)[0] as MaterialColor;
      final icon = _colorBaseOnFlavour(flavouer)[1] as IconData;

      return Flash.bar(
        controller: _,
        backgroundColor: color.withOpacity(.2),
        margin: const EdgeInsets.only(
          bottom: 30,
          left: 10,
          right: 10,
        ),
        behavior: FlashBehavior.floating,
        barrierDismissible: barrierDismissible,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 3),
              Text(message!, style: TextStyle(color: color)),
            ],
          ),
        ),
      );
    },
    duration: dismissDuration,
  );
}
