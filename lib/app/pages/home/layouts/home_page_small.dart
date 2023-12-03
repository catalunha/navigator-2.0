import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_setstate/app/root_routes.dart';

import '../../../home_routes.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tela principal, não pode voltar'),
            ),
          );
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
            title: const Text('Home - Small'),
            backgroundColor: Colors.blueGrey,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RootRoutes.login,
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.exit_to_app_rounded),
              ),
              IconButton(
                onPressed: () {
                  navigatorKey.currentState!.pushNamedAndRemoveUntil(
                    HomeRoutes.second,
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.person),
              )
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
                  title: const Text('First Page'),
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      HomeRoutes.first,
                      (route) => false,
                    );
                    _scaffoldKey.currentState!.closeDrawer();
                  },
                ),
                ListTile(
                  title: const Text('Second Page'),
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      HomeRoutes.second,
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
}
