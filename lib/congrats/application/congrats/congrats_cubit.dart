import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'congrats_state.dart';

part 'congrats_cubit.freezed.dart';

class CongratsCubit extends Cubit<CongratsState> {
  CongratsCubit() : super(const CongratsState.initial());

  Future<void> imageAnimationCompleted() async {
    emit(const CongratsState.showCongrats());
  }
}
