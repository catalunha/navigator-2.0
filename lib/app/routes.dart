import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';
import 'pages/splash/splash_page.dart';

class InitialRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
}

Route<dynamic> initialOnGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case InitialRoutes.splash:
      builder = (_) => const SplashPage();
      break;
    case InitialRoutes.login:
      builder = (_) => const LoginPage();
      break;
    default:
      throw Exception('Rota não encontrada');
  }
  return MaterialPageRoute(
    builder: builder,
    settings: settings,
  );
}
