import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showErrorToast(
  BuildContext context, {
  String? message = "Something went wrong",
  Duration? dismissDuration,
}) {
  if (message!.startsWith("Dublicate field")) {
    message = "This Email is already used";
  }
  showFlash(
    context: context,
    builder: (context, _) {
      if (dismissDuration != null) {
        Future.delayed(dismissDuration).then(
          (value) => _.dismiss(),
        );
      }
      return Flash.bar(
        controller: _,
        backgroundColor: Colors.red[100],
        margin: const EdgeInsets.only(bottom: 30),
        behavior: FlashBehavior.floating,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message!, style: const TextStyle(color: Colors.red)),
        ),
      );
    },
  );
}
