import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controllers.g.dart';

// @riverpod
// class SplashController extends _$SplashController {
//   @override
//   Future<SplashState> build() async {
//     // state = AsyncData(SplashState(status: StateStatus.loading));
//     log('SplashController build set state');
//     await Future.delayed(const Duration(seconds: 5));
//     log('SplashController build duration');
//     return SplashState(status: StateStatus.loaded);
//   }
// }

@riverpod
Future<bool> splashController(SplashControllerRef ref) async {
  log('SplashController start');
  await Future.delayed(const Duration(seconds: 2));
  return false;
}
