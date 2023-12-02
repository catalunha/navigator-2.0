import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_setstate/app/pages/splash/controller/controllers.dart';
import 'package:navigator2_setstate/app/routes.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> splash = ref.watch(splashProvider);
    ref.listen<AsyncValue<bool>>(
      splashProvider,
      (previous, next) {
        next.whenData(
          (value) {
            print('passei');
            return Navigator.of(context).pushReplacementNamed(
              InitialRoutes.login,
            );
          },
        );
      },
    );
    return Scaffold(
      body: splash.when(
        data: (data) {
          return const Center(
            child: Text('Inicialização ok.'),
          );
        },
        error: (error, stacktrace) => const Center(
          child: Text('Oops...Um erro apareceu'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

// return Center(child: switch(splash){
//       AsyncData(:final value) => const Text('Oops...Um erro apareceu'),
//       AsyncError() => const Text('Oops...Um erro apareceu'),
//       _ => const CircularProgressIndicator(),
//     },
// );
  }
}
