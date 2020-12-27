part of 'dont_congrats_bloc.dart';

@freezed
abstract class DontCongratsEvent with _$DontCongratsEvent {
  const factory DontCongratsEvent.congratsChecked() = _CongratsChecked;

  const factory DontCongratsEvent.congratsUnchecked() = _ConratsUnchecked;
}
