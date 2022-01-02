import 'package:flutter/material.dart';
import 'package:gooddhan/authentication/presentation/create_account.dart';
import 'package:gooddhan/authentication/presentation/login_account.dart';

class AuthSwitcherPage extends StatefulWidget {
  const AuthSwitcherPage({Key? key}) : super(key: key);

  @override
  _AuthSwitcherPageState createState() => _AuthSwitcherPageState();
}

class _AuthSwitcherPageState extends State<AuthSwitcherPage> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() => isToggle = !isToggle);
  }

  @override
  Widget build(BuildContext context) {
    return isToggle
        ? CreateAccountPage(toggleScreen: toggleScreen)
        : LoginAccountPage(toggleScreen: toggleScreen);
  }
}
