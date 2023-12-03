import 'package:flutter/material.dart';
import 'package:navigator2_setstate/app/pages/second_inner/second_inner_page.dart';

import 'pages/first-inner/first_inner_page.dart';
import 'pages/first/first_page.dart';
import 'pages/second/second_page.dart';

class HomeRoutes {
  static const String first = '/';
  static const String firstInner = '/firstInner';
  static const String second = '/second';
  static const String secondInner = '/secondInner';
}

Route? homeOnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoutes.first:
      return CustomPageRoute(page: const FirstPage());
    case HomeRoutes.firstInner:
      return CustomPageRoute(
        page: const FirstInnerPage(),
        direction: AxisDirection.up,
      );

    case HomeRoutes.second:
      return CustomPageRoute(page: const SecondPage());
    case HomeRoutes.secondInner:
      final argu = settings.arguments as String;
      return CustomPageRoute(
        page: SecondInnerPage(
          arg: argu,
        ),
        direction: AxisDirection.up,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox.shrink(),
      );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;
  CustomPageRoute({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset begin = getOffsetByAxisDirection();
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
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
