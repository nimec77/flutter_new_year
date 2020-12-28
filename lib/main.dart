import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_year/congrats/application/congrats/congrats_cubit.dart';
import 'package:flutter_new_year/congrats/application/dont_congrats/dont_congrats_bloc.dart';
import 'package:flutter_new_year/congrats/application/simple_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'congrats/presentation/constants.dart';
import 'congrats/presentation/core/app_widget.dart';

Future<void> main() async {
  final lockFilePath = await _getLockFilePath();
  if (await _isLockFileExists(lockFilePath)) {
    exit(0);
  }
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  enterFullScreen();
  runApp(MyApp(lockFilePath: lockFilePath));
}

Future<String> _getLockFilePath() async {
  final tempDir = await getTemporaryDirectory();

  return '${tempDir.path}/dont_congrats.lock';
}

Future<bool> _isLockFileExists(String lockFilePath) async {
  final file = File(lockFilePath);

  return file.exists();
}

Future<void> enterFullScreen() async {
  final windowInfo = await window_size.getWindowInfo();
  final screen = windowInfo.screen;
  if (screen != null) {
    window_size.setWindowTitle('Поздравляем С Новым Годом!');
    // window_size.setWindowFrame(Rect.fromLTWH(0, 0, screen.frame.width, screen.frame.height));
  }
}

class MyApp extends StatelessWidget {
  final String lockFilePath;

  const MyApp({Key key, @required this.lockFilePath})
      : assert(lockFilePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Поздравление с Новым Годом!',
      theme: kNewYearTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CongratsCubit()),
          BlocProvider(create: (context) => DontCongratsBloc(lockFilePath: lockFilePath)),
        ],
        child: AppWidget(),
      ),
    );
  }
}
