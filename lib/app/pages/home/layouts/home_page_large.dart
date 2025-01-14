import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home_routes.dart';
import '../../../root_routes.dart';
import '../../utils/app_loader.dart';
import '../../utils/app_messages.dart';

class HomePageLarge extends ConsumerStatefulWidget {
  const HomePageLarge({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePageLarge> createState() => _HomePageLargeState();
}

class _HomePageLargeState extends ConsumerState<HomePageLarge>
    with AppMessages, AppLoader {
  final navigatorKey = GlobalKey<NavigatorState>();
  bool drawerIsView = true;
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
          appBar: AppBar(
            title: const Text('Home - Large'),
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              onPressed: () {
                setState(() {
                  drawerIsView = !drawerIsView;
                });
              },
              icon: const Icon(Icons.menu),
            ),
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
          body: Row(
            children: [
              // Aqui unico lugar que precisa da key ... o restante é nagevação pelo Navigator.of(context) normal
              Offstage(
                offstage: !drawerIsView,
                child: Drawer(
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
                        },
                      ),
                      ListTile(
                        title: const Text('Second Page'),
                        onTap: () {
                          navigatorKey.currentState!.pushNamedAndRemoveUntil(
                            HomeRoutes.second,
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Navigator(
                  key: navigatorKey,
                  initialRoute: HomeRoutes.first,
                  onGenerateRoute: (settings) => homeOnGenerateRoute(settings),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// // Minhas alterações
//   MaterialPageRoute? homeOnGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case HomeRoutes.first:
//         return MaterialPageRoute(
//           builder: (_) => const FirstPage(),
//         );
//       case HomeRoutes.second:
//         return MaterialPageRoute(
//           builder: (_) => const SecondPage(),
//         );

//       default:
//         return MaterialPageRoute(
//           builder: (_) => const SizedBox.shrink(),
//         );
//     }
//   }
// // Minhas alterações
//   MaterialPageRoute? generateRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (_) => const UserPage(),
//         );
//       case '/settings':
//         return MaterialPageRoute(
//           builder: (_) => const SettingsPage(),
//         );
//       case '/access':
//         return MaterialPageRoute(
//           builder: (_) => const AccessPage(),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const SizedBox.shrink(),
//         );
//     }
//   }
}
