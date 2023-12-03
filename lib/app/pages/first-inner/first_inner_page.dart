import 'package:flutter/material.dart';

import '../../home_routes.dart';

class FirstInnerPage extends StatelessWidget {
  const FirstInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Inner Page'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('First Inner Page'),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(HomeRoutes.firstInner),
              child: const Text(
                'Ir para uma proxima pagina, neste caso outra "First Inner"',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
