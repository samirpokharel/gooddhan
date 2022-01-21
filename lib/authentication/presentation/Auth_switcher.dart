import 'package:flutter/material.dart';

import 'create_account.dart';
import 'login_account.dart';

class AuthSwitcherPage extends StatefulWidget {
  const AuthSwitcherPage({Key? key}) : super(key: key);

  @override
  _AuthSwitcherPageState createState() => _AuthSwitcherPageState();
}

class _AuthSwitcherPageState extends State<AuthSwitcherPage> {
  bool isToggle = false;
  void toggleScreen() => setState(() => isToggle = !isToggle);

  @override
  Widget build(BuildContext context) {
    if (isToggle) return CreateAccountPage(toggleScreen: toggleScreen);
    return LoginAccountPage(toggleScreen: toggleScreen);
  }
}
