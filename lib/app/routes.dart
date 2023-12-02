import 'package:flutter/material.dart';

import 'pages/internal_server_error/internal_server_error_500.dart';
import 'pages/login/login_page.dart';
import 'pages/not_found_404/not_found_404.dart';
import 'pages/splash/splash_page.dart';

class RootRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String splash = '/';
  static const String internalServerError500 = '/internalServerError500';
}

Route<dynamic> rootOnGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case RootRoutes.splash:
      builder = (_) => const SplashPage();
      break;
    case RootRoutes.login:
      builder = (_) => const LoginPage();
      break;
    case RootRoutes.home:
      builder = (_) => const LoginPage();
      break;
    case RootRoutes.internalServerError500:
      builder = (_) => const InternalServerError500();
      break;
    default:
      builder = (_) => const NotFound404();
  }
  return MaterialPageRoute(
    builder: builder,
    settings: settings,
  );
}
