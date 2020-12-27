import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_new_year/congrats/application/congrats/congrats_cubit.dart';
import 'package:flutter_new_year/congrats/presentation/constants.dart';

class CongratsImage extends HookWidget {
  const CongratsImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showImageAnimateController = useAnimationController(duration: kImageAnimationDuration);
    showImageAnimateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        BlocProvider.of<CongratsCubit>(context).imageAnimationCompleted();
      }
    });
    showImageAnimateController.forward();
    return FadeTransition(
      opacity: showImageAnimateController,
      child: ScaleTransition(
        scale: showImageAnimateController,
        child: Image.asset(kCongratsImage, fit: BoxFit.cover),
      ),
    );
  }
}
