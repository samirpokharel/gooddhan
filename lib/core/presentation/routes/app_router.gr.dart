// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../../../authentication/presentation/Auth_switcher.dart' as _i2;
import '../../../authentication/presentation/register.dart' as _i3;
import '../../../dashboard/gooddhan/cateogries/list_categories/presentation/category_page.dart'
    as _i5;
import '../../../dashboard/gooddhan/core/domain/expense.dart' as _i10;
import '../../../dashboard/gooddhan/expenses/expense_list/presentation/create_expense_page.dart'
    as _i6;
import '../../../dashboard/navigation/presentation/navigation_page.dart' as _i4;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          opaque: true,
          barrierDismissible: false);
    },
    AuthSwitcherRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.AuthSwitcherPage(),
          opaque: true,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.RegisterPage(key: args.key, idToken: args.idToken),
          opaque: true,
          barrierDismissible: false);
    },
    NavigationRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.NavigationPage(),
          opaque: true,
          barrierDismissible: false);
    },
    CategoriesRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoriesPage());
    },
    CreateExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<CreateExpenseRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i6.CreateExpensePage(
              key: args.key,
              isUpdate: args.isUpdate,
              previousExpense: args.previousExpense));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '/auth', fullMatch: true),
        _i7.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i7.RouteConfig(AuthSwitcherRoute.name, path: '/auth'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register'),
        _i7.RouteConfig(NavigationRoute.name, path: '/nav'),
        _i7.RouteConfig(CategoriesRoute.name, path: '/category'),
        _i7.RouteConfig(CreateExpenseRoute.name, path: '/create-expense')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthSwitcherPage]
class AuthSwitcherRoute extends _i7.PageRouteInfo<void> {
  const AuthSwitcherRoute() : super(AuthSwitcherRoute.name, path: '/auth');

  static const String name = 'AuthSwitcherRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i9.Key? key, required String idToken})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(key: key, idToken: idToken));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.idToken});

  final _i9.Key? key;

  final String idToken;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, idToken: $idToken}';
  }
}

/// generated route for
/// [_i4.NavigationPage]
class NavigationRoute extends _i7.PageRouteInfo<void> {
  const NavigationRoute() : super(NavigationRoute.name, path: '/nav');

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i5.CategoriesPage]
class CategoriesRoute extends _i7.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '/category');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i6.CreateExpensePage]
class CreateExpenseRoute extends _i7.PageRouteInfo<CreateExpenseRouteArgs> {
  CreateExpenseRoute(
      {_i9.Key? key,
      required bool isUpdate,
      required _i10.Expense? previousExpense})
      : super(CreateExpenseRoute.name,
            path: '/create-expense',
            args: CreateExpenseRouteArgs(
                key: key,
                isUpdate: isUpdate,
                previousExpense: previousExpense));

  static const String name = 'CreateExpenseRoute';
}

class CreateExpenseRouteArgs {
  const CreateExpenseRouteArgs(
      {this.key, required this.isUpdate, required this.previousExpense});

  final _i9.Key? key;

  final bool isUpdate;

  final _i10.Expense? previousExpense;

  @override
  String toString() {
    return 'CreateExpenseRouteArgs{key: $key, isUpdate: $isUpdate, previousExpense: $previousExpense}';
  }
}
