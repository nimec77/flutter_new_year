import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_new_year/congrats/application/dont_congrats/dont_congrats_bloc.dart';

import '../../constants.dart';

class DontCongrats extends HookWidget {
  const DontCongrats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dontGratsAnimationController = useAnimationController(duration: kDontGratsAnimationDuration);
    dontGratsAnimationController.forward();
    return FadeTransition(
      opacity: dontGratsAnimationController,
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<DontCongratsBloc, DontCongratsState>(
              builder: (context, state) {
                return CheckboxListTile(
                  activeColor: kPrimaryColor,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    'Больше не поздравлять',
                    style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        kTextShadow,
                      ],
                    ),
                  ),
                  value: state.maybeMap(
                    congrats: (_) => false,
                    dontCongrats: (_) => true,
                    orElse: () => true,
                  ),
                  onChanged: (value) {
                    BlocProvider.of<DontCongratsBloc>(context).add(value
                        ? const DontCongratsEvent.congratsChecked()
                        : const DontCongratsEvent.congratsUnchecked());
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              exit(0);
            },
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
            ),
            child: const Text(
              'Спасибо!',
            ),
          ),
        ],
      ),
    );
  }
}
