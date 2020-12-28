import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'congrats_cubit.freezed.dart';
part 'congrats_state.dart';

class CongratsCubit extends Cubit<CongratsState> {
  CongratsCubit() : super(const CongratsState.initial());

  void imageAnimationCompleted() {
    emit(const CongratsState.showCongrats());
  }

  void showLineCompleted(int index) {
    emit(CongratsState.showLineSuccess(index));
  }
}
