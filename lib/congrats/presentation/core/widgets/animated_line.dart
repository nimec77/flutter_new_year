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
    // return TyperAnimatedTextKit(
    //   text: [
    //     text,
    //   ],
    //   textStyle: Theme.of(context).textTheme.headline4.copyWith(color: const Color(0xff8d2721)),
    //   textAlign: TextAlign.end,
    //   isRepeatingAnimation: false,
    //   repeatForever: false,
    //   onFinished: () {
    //     debugPrint('Finished: $lineIndex');
    //   },
    // );
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }
}
