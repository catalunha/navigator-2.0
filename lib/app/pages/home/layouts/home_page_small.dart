import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_setstate/app/routes.dart';

import '../../first/first_page.dart';
import '../../second/second_page.dart';
import '../../utils/app_loader.dart';
import '../../utils/app_messages.dart';

class HomePageSmall extends ConsumerStatefulWidget {
  const HomePageSmall({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePageSmall> createState() => _HomePageSmallState();
}

class _HomePageSmallState extends ConsumerState<HomePageSmall>
    with AppMessages, AppLoader {
  final navigatorKey = GlobalKey<NavigatorState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (can) {
        if (!navigatorKey.currentState!.canPop()) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Tela principal, não pode voltar'),
          //   ),
          // );
          showMessageError(context, 'Tela principal, não pode voltar');
        }
      },
      child: NavigatorPopHandler(
        onPop: () {
          if (navigatorKey.currentState!.canPop()) {
            navigatorKey.currentState!.pop();
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Navigator 2.0 - SetState - Small'),
            backgroundColor: Colors.blueGrey,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RootRoutes.login);
                  },
                  icon: const Icon(Icons.exit_to_app_rounded))
            ],
          ),
          drawer: Drawer(
            width: 200,
            child: ListView(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),
                ListTile(
                  title: const Text('User'),
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      '/',
                      (route) => false,
                    );
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      '/settings',
                      (route) => false,
                    );
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                ),
                ListTile(
                  title: const Text('Access'),
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      '/access',
                      (route) => false,
                    );
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                ),
              ],
            ),
          ),
          body: Navigator(
            key: navigatorKey,
            initialRoute: HomeRoutes.first,
            onGenerateRoute: (settings) => homeOnGenerateRoute(settings),
          ),
        ),
      ),
    );
  }

// Minhas alterações
  MaterialPageRoute? homeOnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoutes.first:
        return MaterialPageRoute(
          builder: (_) => const FirstPage(),
        );
      case HomeRoutes.second:
        return MaterialPageRoute(
          builder: (_) => const SecondPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox.shrink(),
        );
    }
  }
}
