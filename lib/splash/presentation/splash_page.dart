import 'package:flutter/material.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              const SizedBox(height: 30),
              Text("Gooddhan", style: context.headline2)
            ],
          ),
        ),
      ),
    );
  }
}