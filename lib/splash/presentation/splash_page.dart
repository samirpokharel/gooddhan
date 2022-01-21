import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/shared/constant.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoPath),
              const SizedBox(height: 30),
              Text("Gooddhan", style: context.headline2),
            ],
          ),
        ),
      ),
    );
  }
}
