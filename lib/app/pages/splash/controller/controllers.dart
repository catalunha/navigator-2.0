import 'dart:developer';

import 'package:navigator2_setstate/app/pages/splash/controller/states.dart';
import 'package:navigator2_setstate/app/pages/utils/state_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controllers.g.dart';

// @riverpod
// class SplashController extends _$SplashController {
//   @override
//   Future<SplashState> build() async {
//     log('SplashController build start');
//     // state = AsyncData(SplashState(status: StateStatus.loading));
//     log('SplashController build set state');
//     await Future.delayed(const Duration(seconds: 5));
//     log('SplashController build duration');
//     return SplashState(status: StateStatus.loaded);
//   }
// }

@riverpod
Future<bool> splashController(SplashControllerRef ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return false;
}
