import 'package:flutter/material.dart';

class InternalServerError500 extends StatelessWidget {
  const InternalServerError500({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Oops. Erro interno. Impossível continuar. 500 Internal Server Error',
        ),
      ),
    );
  }
}
