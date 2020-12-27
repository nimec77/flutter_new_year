import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'dont_congrats_bloc.freezed.dart';

part 'dont_congrats_event.dart';

part 'dont_congrats_state.dart';

class DontCongratsBloc extends Bloc<DontCongratsEvent, DontCongratsState> {
  final String lockFilePath;

  DontCongratsBloc({@required this.lockFilePath})
      : assert(lockFilePath != null),
        super(const DontCongratsState.dontCongrats()) {
    _createLockFile();
  }

  @override
  Stream<DontCongratsState> mapEventToState(
    DontCongratsEvent event,
  ) async* {
    yield* event.when(
      congratsChecked: () => _mapCongratsCheckedOnState(),
      congratsUnchecked: () => _mapCongratsUncheckedOnState(),
    );
  }

  Stream<DontCongratsState> _mapCongratsCheckedOnState() async* {
    yield const DontCongratsState.dontCongrats();
    try {
      await _createLockFile();
    } on FileSystemException {
      yield const DontCongratsState.writeFailure();
    }
  }

  Stream<DontCongratsState> _mapCongratsUncheckedOnState() async* {
    yield const DontCongratsState.congrats();
    try {
      await _deleteLockFile();
    } on FileSystemException {
      yield const DontCongratsState.deleteFailure();
    }
  }

  Future<void> _createLockFile() async {
    final lockFile = File(lockFilePath);
    if (!(await lockFile.exists())) {
      await lockFile.writeAsString('true');
    }
  }

  Future<void> _deleteLockFile() async {
    final lockFile = File(lockFilePath);
    if (await lockFile.exists()) {
      await lockFile.delete();
    }
  }
}
