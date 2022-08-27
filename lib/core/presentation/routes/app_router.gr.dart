// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../../authentication/presentation/Auth_switcher.dart' as _i2;
import '../../../authentication/presentation/register.dart' as _i3;
import '../../../dashboard/gooddhan/cateogries/list_categories/presentation/category_page.dart'
    as _i5;
import '../../../dashboard/gooddhan/core/domain/expense.dart' as _i14;
import '../../../dashboard/gooddhan/expenses/expense_list/presentation/create_expense_page.dart'
    as _i6;
import '../../../dashboard/gooddhan/expenses/search_expense/presentation/searched_expense_page.dart'
    as _i7;
import '../../../dashboard/navigation/presentation/navigation_page.dart' as _i4;
import '../../../dashboard/profile/presentation/update_account.dart' as _i9;
import '../../../settings/presentation/setting_page.dart' as _i8;
import '../../../settings/presentation/update_date_format_page.dart' as _i11;
import '../../../settings/presentation/update_language_page.dart' as _i10;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SplashPage(),
          opaque: true,
          barrierDismissible: false);
    },
    AuthSwitcherRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.AuthSwitcherPage(),
          opaque: true,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.RegisterPage(key: args.key, idToken: args.idToken),
          opaque: true,
          barrierDismissible: false);
    },
    NavigationRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.NavigationPage(),
          opaque: true,
          barrierDismissible: false);
    },
    CategoriesRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoriesPage());
    },
    CreateExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<CreateExpenseRouteArgs>();
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i6.CreateExpensePage(
              key: args.key,
              isUpdate: args.isUpdate,
              previousExpense: args.previousExpense));
    },
    SearchedExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedExpenseRouteArgs>();
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i7.SearchedExpensePage(args.searchTerm, key: args.key));
    },
    SettingRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingPage());
    },
    UpdateAccountRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i9.UpdateAccountPage());
    },
    UpdateLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateLanguageRouteArgs>(
          orElse: () => const UpdateLanguageRouteArgs());
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i10.UpdateLanguagePage(
              key: args.key, initialLanguage: args.initialLanguage));
    },
    UpdateDateFormatRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateDateFormatRouteArgs>(
          orElse: () => const UpdateDateFormatRouteArgs());
      return _i12.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i11.UpdateDateFormatPage(
              key: args.key, initialDate: args.initialDate));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig('/#redirect',
            path: '/', redirectTo: '/auth', fullMatch: true),
        _i12.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i12.RouteConfig(AuthSwitcherRoute.name, path: '/auth'),
        _i12.RouteConfig(RegisterRoute.name, path: '/register'),
        _i12.RouteConfig(NavigationRoute.name, path: '/nav'),
        _i12.RouteConfig(CategoriesRoute.name, path: '/category'),
        _i12.RouteConfig(CreateExpenseRoute.name, path: '/create-expense'),
        _i12.RouteConfig(SearchedExpenseRoute.name, path: '/searched-expense'),
        _i12.RouteConfig(SettingRoute.name, path: '/settings'),
        _i12.RouteConfig(UpdateAccountRoute.name, path: '/update-account'),
        _i12.RouteConfig(UpdateLanguageRoute.name, path: '/update-language'),
        _i12.RouteConfig(UpdateDateFormatRoute.name,
            path: '/update-date-format')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthSwitcherPage]
class AuthSwitcherRoute extends _i12.PageRouteInfo<void> {
  const AuthSwitcherRoute() : super(AuthSwitcherRoute.name, path: '/auth');

  static const String name = 'AuthSwitcherRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i13.Key? key, required String idToken})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(key: key, idToken: idToken));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.idToken});

  final _i13.Key? key;

  final String idToken;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, idToken: $idToken}';
  }
}

/// generated route for
/// [_i4.NavigationPage]
class NavigationRoute extends _i12.PageRouteInfo<void> {
  const NavigationRoute() : super(NavigationRoute.name, path: '/nav');

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i5.CategoriesPage]
class CategoriesRoute extends _i12.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '/category');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i6.CreateExpensePage]
class CreateExpenseRoute extends _i12.PageRouteInfo<CreateExpenseRouteArgs> {
  CreateExpenseRoute(
      {_i13.Key? key,
      required bool isUpdate,
      required _i14.Expense? previousExpense})
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

  final _i13.Key? key;

  final bool isUpdate;

  final _i14.Expense? previousExpense;

  @override
  String toString() {
    return 'CreateExpenseRouteArgs{key: $key, isUpdate: $isUpdate, previousExpense: $previousExpense}';
  }
}

/// generated route for
/// [_i7.SearchedExpensePage]
class SearchedExpenseRoute
    extends _i12.PageRouteInfo<SearchedExpenseRouteArgs> {
  SearchedExpenseRoute({required String searchTerm, _i13.Key? key})
      : super(SearchedExpenseRoute.name,
            path: '/searched-expense',
            args: SearchedExpenseRouteArgs(searchTerm: searchTerm, key: key));

  static const String name = 'SearchedExpenseRoute';
}

class SearchedExpenseRouteArgs {
  const SearchedExpenseRouteArgs({required this.searchTerm, this.key});

  final String searchTerm;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SearchedExpenseRouteArgs{searchTerm: $searchTerm, key: $key}';
  }
}

/// generated route for
/// [_i8.SettingPage]
class SettingRoute extends _i12.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '/settings');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i9.UpdateAccountPage]
class UpdateAccountRoute extends _i12.PageRouteInfo<void> {
  const UpdateAccountRoute()
      : super(UpdateAccountRoute.name, path: '/update-account');

  static const String name = 'UpdateAccountRoute';
}

/// generated route for
/// [_i10.UpdateLanguagePage]
class UpdateLanguageRoute extends _i12.PageRouteInfo<UpdateLanguageRouteArgs> {
  UpdateLanguageRoute({_i13.Key? key, String initialLanguage = 'english'})
      : super(UpdateLanguageRoute.name,
            path: '/update-language',
            args: UpdateLanguageRouteArgs(
                key: key, initialLanguage: initialLanguage));

  static const String name = 'UpdateLanguageRoute';
}

class UpdateLanguageRouteArgs {
  const UpdateLanguageRouteArgs({this.key, this.initialLanguage = 'english'});

  final _i13.Key? key;

  final String initialLanguage;

  @override
  String toString() {
    return 'UpdateLanguageRouteArgs{key: $key, initialLanguage: $initialLanguage}';
  }
}

/// generated route for
/// [_i11.UpdateDateFormatPage]
class UpdateDateFormatRoute
    extends _i12.PageRouteInfo<UpdateDateFormatRouteArgs> {
  UpdateDateFormatRoute({_i13.Key? key, String initialDate = 'english'})
      : super(UpdateDateFormatRoute.name,
            path: '/update-date-format',
            args:
                UpdateDateFormatRouteArgs(key: key, initialDate: initialDate));

  static const String name = 'UpdateDateFormatRoute';
}

class UpdateDateFormatRouteArgs {
  const UpdateDateFormatRouteArgs({this.key, this.initialDate = 'english'});

  final _i13.Key? key;

  final String initialDate;

  @override
  String toString() {
    return 'UpdateDateFormatRouteArgs{key: $key, initialDate: $initialDate}';
  }
}
