// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../../authentication/presentation/Auth_switcher.dart' as _i2;
import '../../../authentication/presentation/register.dart' as _i3;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    AuthSwitcherRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthSwitcherPage());
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.RegisterPage(key: args.key, idToken: args.idToken));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(AuthSwitcherRoute.name, path: '/auth'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthSwitcherPage]
class AuthSwitcherRoute extends _i4.PageRouteInfo<void> {
  const AuthSwitcherRoute() : super(AuthSwitcherRoute.name, path: '/auth');

  static const String name = 'AuthSwitcherRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i4.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i5.Key? key, required String idToken})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(key: key, idToken: idToken));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.idToken});

  final _i5.Key? key;

  final String idToken;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, idToken: $idToken}';
  }
}
