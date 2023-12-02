import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controllers.g.dart';

@riverpod
FutureOr<bool> splash(SplashRef ref) async {
  log('Iniciando App no Splash...');
  await Future.delayed(const Duration(seconds: 2));
  return true;
}
