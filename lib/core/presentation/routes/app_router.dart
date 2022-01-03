import 'package:auto_route/auto_route.dart';
import 'package:gooddhan/authentication/presentation/Auth_switcher.dart';
import 'package:gooddhan/authentication/presentation/register.dart';
import 'package:gooddhan/dashboard/presentation/dashboard.dart';
import 'package:gooddhan/splash/presentation/splash_page.dart';

@CustomAutoRouter(
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: AuthSwitcherPage, path: "/auth"),
    AutoRoute(page: RegisterPage, path: "/register"),
    AutoRoute(page: DashboardPage, path: "/dashboard"),
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
