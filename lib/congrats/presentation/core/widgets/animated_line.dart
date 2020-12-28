import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_year/congrats/application/congrats/congrats_cubit.dart';

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
    return BlocBuilder<CongratsCubit, CongratsState>(
      builder: (context, state) {
        return state.maybeMap(
          showCongrats: (_) {
            if (lineIndex == 0) {
              return buildTypewriterAnimatedTextKit(context);
            }
            return Container();
          },
          showLineSuccess: (showLineSuccess) {
            if (showLineSuccess.index + 1 >= lineIndex) {
              return buildTypewriterAnimatedTextKit(context);
            }
            return Container();
          },
          orElse: () => Container(),
        );
      },
    );
    // return Text(
    //   text,
    //   style: Theme.of(context).textTheme.headline4,
    //   textAlign: TextAlign.center,
    // );
  }

  TypewriterAnimatedTextKit buildTypewriterAnimatedTextKit(BuildContext context) => TypewriterAnimatedTextKit(
        text: [
          text,
        ],
        speed: const Duration(milliseconds: 100),
        pause: const Duration(milliseconds: 100),
        textStyle: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
        isRepeatingAnimation: false,
        repeatForever: false,
        displayFullTextOnTap: true,
        onFinished: () {
          BlocProvider.of<CongratsCubit>(context).showLineCompleted(lineIndex);
        },
      );
}
