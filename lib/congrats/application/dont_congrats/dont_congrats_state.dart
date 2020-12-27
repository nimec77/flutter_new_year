part of 'dont_congrats_bloc.dart';

@freezed
abstract class DontCongratsState with _$DontCongratsState {
  const factory DontCongratsState.dontCongrats() = _DontCongratsState;

  const factory DontCongratsState.congrats() = _CongratsState;

  const factory DontCongratsState.deleteFailure() = _DeleteFailure;

  const factory DontCongratsState.writeFailure() = _WriteFailure;
}
