import 'package:auto_route/auto_route.dart';
import 'package:gooddhan/authentication/presentation/Auth_switcher.dart';
import 'package:gooddhan/authentication/presentation/register.dart';
import 'package:gooddhan/splash/presentation/splash_page.dart';

@CupertinoAutoRouter(
  routes: [
    CupertinoRoute(page: SplashPage, initial: true),
    CupertinoRoute(page: AuthSwitcherPage, path: "/auth"),
    CupertinoRoute(page: RegisterPage, path: "/register"),
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
