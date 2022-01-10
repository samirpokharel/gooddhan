import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gooddhan/authentication/application/auth_notifier.dart';
import 'package:gooddhan/authentication/shared/providers.dart';
import 'package:gooddhan/core/presentation/routes/app_router.gr.dart';
import 'package:gooddhan/core/presentation/themes/app_theme.dart';
import 'package:gooddhan/core/shared/providers.dart';
import 'package:gooddhan/settings/shared/providers.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  await ref.read(sembastProvider).init();
  ref.read(dioProvider)
    ..options = BaseOptions(
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    )
    ..interceptors.add(ref.read(authInterceptorProvider));
  final settingNotifer = ref.read(settingNotiferProvider.notifier);
  print(settingNotifer.state.savedTheme);
  await settingNotifer.loadSettings();
  print(settingNotifer.state.savedTheme);
  final authNotifier = ref.read(authNotifierProvider.notifier);

  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(initializationProvider, (_, __) {});

    ref.listen<AuthState>(
      authNotifierProvider,
      (previous, next) {
        next.maybeMap(
          orElse: () {},
          authenticated: (_) async {
            appRouter.pushAndPopUntil(
              const NavigationRoute(),
              predicate: (route) => false,
            );
          },
          unauthenticated: (_) {
            appRouter.pushAndPopUntil(
              const AuthSwitcherRoute(),
              predicate: (route) => false,
            );
          },
        );
      },
    );
    final themedata = ref.watch(settingNotiferProvider).themeData;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Gooddhan",
      theme: themedata,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
