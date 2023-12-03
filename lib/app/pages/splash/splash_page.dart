import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_setstate/app/pages/splash/controller/controllers.dart';
import 'package:navigator2_setstate/app/routes.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splash = ref.watch(splashControllerProvider);
    ref.listen<AsyncValue<bool>>(
      splashControllerProvider,
      (_, next) {
        next.when(
          data: (data) {
            switch (data) {
              case true:
                Navigator.of(context).pushReplacementNamed(RootRoutes.home);
                break;
              case false:
                Navigator.of(context).pushReplacementNamed(RootRoutes.login);
                break;
            }
          },
          error: (e, s) {
            log('Erro no Splash. Impossivel continuar');
          },
          loading: () {},
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
          child: Center(
            child: Text('Oops...Um erro apareceu'),
          ),
        ),
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SPLASH'),
              SizedBox(
                height: 20,
              ),
              Text('Preparando ambiente ...'),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
