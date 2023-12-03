import 'package:flutter/material.dart';
import 'package:navigator2_setstate/app/routes.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Settings Page'),
          Center(
            child: ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(HomeRoutes.second),
                child:
                    const Text('Ir para proxima, neste caso outra "Settings"')),
          )
        ],
      ),
    );
  }
}
