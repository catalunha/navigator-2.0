import 'package:navigator2_setstate/app/pages/login/controller/states.dart';
import 'package:navigator2_setstate/app/pages/utils/app_state_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controllers.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> access() async {
    state = state.copyWith(status: AppStateStatus.loading);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(status: AppStateStatus.loaded);
  }
}
