import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets/animated_line.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/5.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Expanded(
              child: Center(
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
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    activeColor: Colors.red.shade600,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade600,
                  ),
                  child: const Text(
                    'Спасибо!',
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
