import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';

import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/infrastructure/text_theme_extension.dart';

import 'package:gooddhan/core/shared/widgets/custom_google_button.dart';
import 'package:gooddhan/core/shared/widgets/custom_loading_wrapper.dart';

class LoginAccountPage extends ConsumerWidget {
  final Function toggleScreen;
  const LoginAccountPage({
    Key? key,
    required this.toggleScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomLoadingWraper(
          isLoading: ref.watch(authNotifierProvider).status == AuthStatus.busy,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(height: 20),
                    Text("Gooddhan", style: context.headline1),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "a app to track and manage your expences on you income",
                        style: context.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16 * 4),
                    CustomGoogleButton(
                      buttonText: "Login with google",
                      onTap: () async {
                        await ref.read(authNotifierProvider.notifier).login();
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ? "),
                        TextButton(
                          onPressed: () => toggleScreen(),
                          child: const Text(
                            "Signup",
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
      ),
    );
  }
}
