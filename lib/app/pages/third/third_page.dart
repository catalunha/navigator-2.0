import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trird Page'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(child: Text('Trird Page')),
    );
  }
}
