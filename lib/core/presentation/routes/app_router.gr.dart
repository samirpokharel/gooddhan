// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../authentication/presentation/Auth_switcher.dart' as _i2;
import '../../../authentication/presentation/register.dart' as _i3;
import '../../../dashboard/navigation/presentation/dashboard.dart' as _i4;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          opaque: true,
          barrierDismissible: false);
    },
    AuthSwitcherRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.AuthSwitcherPage(),
          opaque: true,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.RegisterPage(key: args.key, idToken: args.idToken),
          opaque: true,
          barrierDismissible: false);
    },
    NavigationRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.NavigationPage(),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/auth', fullMatch: true),
        _i5.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i5.RouteConfig(AuthSwitcherRoute.name, path: '/auth'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register'),
        _i5.RouteConfig(NavigationRoute.name, path: '/nav')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthSwitcherPage]
class AuthSwitcherRoute extends _i5.PageRouteInfo<void> {
  const AuthSwitcherRoute() : super(AuthSwitcherRoute.name, path: '/auth');

  static const String name = 'AuthSwitcherRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i6.Key? key, required String idToken})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(key: key, idToken: idToken));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.idToken});

  final _i6.Key? key;

  final String idToken;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, idToken: $idToken}';
  }
}

/// generated route for
/// [_i4.NavigationPage]
class NavigationRoute extends _i5.PageRouteInfo<void> {
  const NavigationRoute() : super(NavigationRoute.name, path: '/nav');

  static const String name = 'NavigationRoute';
}
