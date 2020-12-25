import 'package:flutter/material.dart';
import 'package:flutter_new_year/congrats/presentation/core/widgets/dont_grats.dart';

import '../constants.dart';
import 'widgets/animated_line.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/new_year_2021.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
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
        ),
      ),
    );
  }
}
