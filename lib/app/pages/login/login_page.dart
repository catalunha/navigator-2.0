import 'package:flutter/material.dart';
import 'package:navigator2_setstate/app/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(RootRoutes.home);
              },
              child: const Text('Acessar')),
        ],
      )),
    );
  }
}
