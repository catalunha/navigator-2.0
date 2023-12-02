import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigator2_setstate/app/pages/utils/state_status.dart';

part 'states.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(StateStatus.initial) StateStatus status,
    String? message,
  }) = _LoginState;
}
