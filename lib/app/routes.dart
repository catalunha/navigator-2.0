import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'pages/first/first_page.dart';
import 'pages/login/login_page.dart';
import 'pages/not_found_404/not_found_404.dart';
import 'pages/second/second_page.dart';
import 'pages/splash/splash_page.dart';

class RootRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String splash = '/';
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
      builder = (_) => const HomePage();
      break;
    default:
      builder = (_) => const NotFound404();
  }
  return MaterialPageRoute(
    builder: builder,
    settings: settings,
  );
}

class HomeRoutes {
  static const String first = '/first';
  static const String second = '/second';
}

// // Minhas alterações
// MaterialPageRoute? homeOnGenerateRoute(RouteSettings settings) {
//   WidgetBuilder builder;
//   switch (settings.name) {
//     case HomeRoutes.first:
//       builder = (_) => const FirstPage();
//       break;
//     case HomeRoutes.second:
//       builder = (_) => const SecondPage();
//       break;
//     default:
//       builder = (_) => const SizedBox.shrink();
//   }
//   return MaterialPageRoute(
//     builder: builder,
//     settings: settings,
//   );
// }
