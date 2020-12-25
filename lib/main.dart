import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'congrats/presentation/constants.dart';
import 'congrats/presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // enterFullScreen();
  runApp(MyApp());
}

Future<void> enterFullScreen() async {
  final windowInfo = await window_size.getWindowInfo();
  final screen = windowInfo.screen;
  if (screen != null) {
    window_size.setWindowTitle('Поздравляем С Новым Годом!');
    window_size.setWindowFrame(Rect.fromLTWH(0, 0, screen.frame.width, screen.frame.height));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Поздравление с Новым Годом!',
      theme: kNewYearTheme,
      home: AppWidget(),
    );
  }
}
