import 'package:flutter/material.dart';

import '../../home_routes.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Second Page'),
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(HomeRoutes.secondInner, arguments: '3th'),
                child: const Text(
                    'Ir para outra proxima com argumento, neste caso "Third"')),
          )
        ],
      ),
    );
  }
}
