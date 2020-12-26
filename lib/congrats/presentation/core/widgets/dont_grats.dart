import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
            child: CheckboxListTile(
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
              value: true,
              onChanged: (_) {},
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
