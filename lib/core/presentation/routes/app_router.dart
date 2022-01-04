import 'package:auto_route/auto_route.dart';
import 'package:gooddhan/authentication/presentation/Auth_switcher.dart';
import 'package:gooddhan/authentication/presentation/register.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/list_categories/presentation/category_page.dart';
import 'package:gooddhan/dashboard/navigation/presentation/navigation_page.dart';
import 'package:gooddhan/splash/presentation/splash_page.dart';

@CustomAutoRouter(
  routes: [
    AutoRoute(
      page: SplashPage,
    ),
    AutoRoute(page: AuthSwitcherPage, initial: true, path: "/auth"),
    AutoRoute(page: RegisterPage, path: "/register"),
    AutoRoute(page: NavigationPage, path: "/nav"),
    CupertinoRoute(page: CategoriesPage, path: "/category")
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
