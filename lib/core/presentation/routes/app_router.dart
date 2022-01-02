import 'package:auto_route/auto_route.dart';
import 'package:gooddhan/splash/presentation/splash_page.dart';

@CupertinoAutoRouter(
  routes: [
    CupertinoRoute(page: SplashPage, initial: true),
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
