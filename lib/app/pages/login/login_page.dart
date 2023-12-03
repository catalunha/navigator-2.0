import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_setstate/app/pages/login/controller/controllers.dart';
import 'package:navigator2_setstate/app/pages/utils/app_state_status.dart';
import 'package:navigator2_setstate/app/root_routes.dart';

import '../utils/app_loader.dart';
import '../utils/app_messages.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with AppMessages, AppLoader {
  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (_, next) {
      switch (next.status) {
        case AppStateStatus.initial:
          break;
        case AppStateStatus.loading:
          showLoader(context);
          break;
        case AppStateStatus.updated:
          break;
        case AppStateStatus.loaded:
          hideLoader(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
            RootRoutes.home,
            (route) => false,
          );
          break;
        case AppStateStatus.message:
          break;
      }
    });
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('LOGIN'),
          const SizedBox(height: 50),
          SizedBox(
            width: 200,
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Informe o email'),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Informe a senha'),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () async {
                await ref.read(loginControllerProvider.notifier).access();
              },
              child: const Text('Acessar')),
        ],
      )),
    );
  }
}
