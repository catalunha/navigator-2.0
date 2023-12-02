import 'package:flutter/material.dart';

class NotFound404 extends StatelessWidget {
  const NotFound404({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Oops. Página não encontrada. 404 Not Found',
        ),
      ),
    );
  }
}
