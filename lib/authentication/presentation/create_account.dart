import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/shared/widgets/custom_google_button.dart';

class CreateAccountPage extends ConsumerWidget {
  final Function toggleScreen;
  const CreateAccountPage({
    Key? key,
    required this.toggleScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register", style: context.headline1),
                  const SizedBox(height: 16),
                  Text(
                    "Register with google account to continue",
                    style: context.bodyText2,
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: Image.asset("assets/images/register_vector.png"),
                  ),
                  const SizedBox(height: 50),
                  CustomGoogleButton(
                    buttonText: "Register with google",
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ? "),
                      TextButton(
                        onPressed: () => toggleScreen(),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
