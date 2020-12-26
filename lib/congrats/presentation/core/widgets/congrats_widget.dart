import 'package:flutter/material.dart';

import '../../constants.dart';
import 'animated_line.dart';
import 'dont_grats.dart';

class CongratsWidget extends StatelessWidget {
  const CongratsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              DontCongrats(),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: kCongratulationsText.length,
              itemBuilder: (context, index) {
                final text = kCongratulationsText[index];
                return AnimatedLine(text: text, lineIndex: index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
