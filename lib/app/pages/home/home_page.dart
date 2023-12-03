import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/app_layout.dart';
import 'layouts/home_page_large.dart';
import 'layouts/home_page_small.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('HomePage.build');
    return const AppLayout(
      small: HomePageSmall(),
      medium: HomePageSmall(),
      large: HomePageLarge(),
    );
  }
}
