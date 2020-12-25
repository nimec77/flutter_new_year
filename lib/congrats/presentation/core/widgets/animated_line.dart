import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedLine extends StatelessWidget {
  final int lineIndex;
  final String text;

  const AnimatedLine({
    Key key,
    @required this.text,
    @required this.lineIndex,
  })  : assert(lineIndex != null),
        assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TyperAnimatedTextKit(
      text: [
        text,
      ],
      textStyle: Theme.of(context).textTheme.headline4.copyWith(color: Colors.red.shade400),
      textAlign: TextAlign.center,
      isRepeatingAnimation: false,
      repeatForever: false,
      onFinished: () {
        debugPrint('Finished: $lineIndex');
      },
    );
  }
}
