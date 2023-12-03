import 'package:flutter/material.dart';

import '../../home_routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('First Page'),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(HomeRoutes.firstInner),
              child: const Text(
                'Ir para uma proxima pagina, neste caso outra "First"',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'BottomSheet Interno',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              child: const Text('BottomSheet interno'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'BottomSheet Externo',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                useRootNavigator: true,
              ),
              child: const Text('BottomSheet externo'),
            ),
          )
        ],
      ),
    );
  }
}
