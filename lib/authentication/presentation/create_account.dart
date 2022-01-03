import 'dart:async';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/shared/providers.dart';

import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/shared/widgets/custom_google_button.dart';

class CreateAccountPage extends ConsumerWidget {
  final Function toggleScreen;
  const CreateAccountPage({
    Key? key,
    required this.toggleScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    void registerWithGoogleAccount() {
      final authNotifier = ref.read(authNotifierProvider.notifier);
      authNotifier.createGoogleAcountCred(
        (idToken) {
          if (idToken != null) {
            AutoRouter.of(context).push(
              RegisterRoute(idToken: idToken),
            );
          }
          return Future.value(idToken);
        },
      );
    }

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
                    onTap: registerWithGoogleAccount,
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
