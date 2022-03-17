import 'package:auto_route/annotations.dart';
import 'package:ms_example/app/view/app.dart';
import 'package:ms_example/home_screen/home_screen.dart';
import 'package:ms_example/login/login.dart';
import 'package:ms_example/splash_screen/splash_screen.dart';

import 'guard/auth_guard.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: LoginForm,
    name: "LoginRoute",
    path: "/login",
  ),
  AutoRoute(
    page: HomeScreen,
    name: "HomeRoute",
    path: "/home",
    guards: [AuthGuard],
  ),
  AutoRoute(
    page: MyApp,
    name: "AppRoute",
    path: "/app",
  ),
  AutoRoute(
    page: SplashView,
    name: "SplashRoute",
    path: "/",
    initial: true,
  )
])
class $AppRouter {}
