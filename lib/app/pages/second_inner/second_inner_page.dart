import 'package:flutter/material.dart';

class SecondInnerPage extends StatelessWidget {
  final String arg;
  const SecondInnerPage({super.key, required this.arg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Inner with arg (arg: $arg) Page'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(child: Text('Trird Page')),
    );
  }
}
