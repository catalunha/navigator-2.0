import 'dart:developer';

import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  const AppLayout({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        log('Layout.build');
        log('constraints.maxWidth: ${constraints.maxWidth}');
        if (constraints.maxWidth < 600) {
          return small;
        }
        if (constraints.maxWidth < 900) {
          return medium;
        }
        return large;
      },
    );
  }
}
