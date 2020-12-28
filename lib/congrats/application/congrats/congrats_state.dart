part of 'congrats_cubit.dart';

@freezed
abstract class CongratsState with _$CongratsState {
  const factory CongratsState.initial() = _Initial;

  const factory CongratsState.showCongrats() = _ShowCongrats;

  const factory CongratsState.showLineSuccess(int index) = _ShowLineSuccess;
}
