import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants.dart';

class DontCongrats extends StatelessWidget {
  const DontCongrats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
