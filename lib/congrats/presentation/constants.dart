import 'package:flutter/material.dart';

const kUltimateGray = Color(0xff939597);
const kIlluminating = Color(0xfff5df4d);
// const kPrimaryColor = Color(0xff2e218d);
const kPrimaryColor = Color(0xff0050A0);
const kTextShadow = Shadow(
  offset: Offset(2, 2),
  blurRadius: 2,
// color: Colors.black,
);
final kNewYearTheme = ThemeData.light().copyWith(
  primaryColor: kUltimateGray,
  accentColor: kIlluminating,
  scaffoldBackgroundColor: kUltimateGray,
  textTheme: ThemeData.light().textTheme.copyWith(
        headline4: const TextStyle(
          fontFamily: 'Roboto',
          color: kIlluminating,
          height: 1.4,
          fontWeight: FontWeight.bold,
          shadows: [
            kTextShadow,
          ],
        ),
        bodyText1: ThemeData.light().textTheme.bodyText1.copyWith(
          color: kIlluminating,
          shadows: [
            kTextShadow,
          ],
        ),
      ),
);
const kCongratulationsText = [
  'Уважаемые коллеги!',
  'С наступающим Новым годом!',
  'Отдел 715 желает вам в Новом году ',
  'Крепкого здоровья,',
  'Профессиональных достижений,',
  'Творческих успехов,',
  'Безграничного счастья',
  'И общения без ограничений!',
];
