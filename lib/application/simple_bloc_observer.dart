import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    debugPrint('onError $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    debugPrint('onEvent $event');
    super.onEvent(bloc, event);
  }
}
