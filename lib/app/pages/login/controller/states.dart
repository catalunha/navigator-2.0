import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigator2_setstate/app/pages/utils/app_state_status.dart';

part 'states.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(AppStateStatus.initial) AppStateStatus status,
    String? message,
  }) = _LoginState;
}
