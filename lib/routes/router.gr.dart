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

import '../app/view/app.dart' as _i3;
import '../home_screen/home_screen.dart' as _i2;
import '../login/login.dart' as _i1;
import '../splash_screen/splash_screen.dart' as _i4;
import 'guard/auth_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginForm());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    AppRoute.name: (routeData) {
      final args =
          routeData.argsAs<AppRouteArgs>(orElse: () => const AppRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.MyApp(key: args.key));
    },
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SplashView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(HomeRoute.name, path: '/home', guards: [authGuard]),
        _i5.RouteConfig(AppRoute.name, path: '/app'),
        _i5.RouteConfig(SplashRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.LoginForm]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.MyApp]
class AppRoute extends _i5.PageRouteInfo<AppRouteArgs> {
  AppRoute({_i6.Key? key})
      : super(AppRoute.name, path: '/app', args: AppRouteArgs(key: key));

  static const String name = 'AppRoute';
}

class AppRouteArgs {
  const AppRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'AppRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}
