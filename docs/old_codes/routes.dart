import 'package:flutter/material.dart';

import 'pages/first/first_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/layouts/home_page_large.dart';
import 'pages/login/login_page.dart';
import 'pages/not_found_404/not_found_404.dart';
import 'pages/second/second_page.dart';
import 'pages/splash/splash_page.dart';
import 'pages/third/third_page.dart';

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
  static const String first = '/';
  static const String second = '/second';
  static const String third = '/third';
}

// Minhas alterações
Route? homeOnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoutes.first:
      return CustomPageRoute(page: const FirstPage());
    // case HomeRoutes.first:
    //   return PageRouteBuilder(
    //       pageBuilder: (context, animation, secondaryAnimation) =>
    //           const FirstPage(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return child;
    //       });
    case HomeRoutes.second:
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SecondPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          });
    case HomeRoutes.third:
      final argu = settings.arguments as String;
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ThirdPage(
                arg: argu,
              ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          });
    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox.shrink(),
      );
  }
  // return null;
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;
  CustomPageRoute({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
          // transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset begin = getOffsetByAxisDirection();
    // const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
    // return ScaleTransition(
    //   scale: animation,
    //   child: child,
    // );
    // return child;
    // TODO: implement buildTransitions
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
  }

  Offset getOffsetByAxisDirection() {
    return switch (direction) {
      AxisDirection.up => const Offset(0, 1),
      AxisDirection.down => const Offset(0, -1),
      AxisDirection.right => const Offset(-1, 0),
      AxisDirection.left => const Offset(1, 0),
    };
  }
}



/*
MaterialPageRoute? homeOnGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case HomeRoutes.first:
      builder = (_) => const FirstPage();
      break;
    case HomeRoutes.second:
      builder = (_) => const SecondPage();
      break;
    case HomeRoutes.third:
      builder = (_) => const ThirdPage();
      break;
    default:
      builder = (_) => const SizedBox.shrink();
  }
  return MaterialPageRoute(
    builder: builder,
    settings: settings,
  );
}
*/