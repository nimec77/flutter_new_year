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
  scaffoldBackgroundColor: kPrimaryColor,
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
const kCongratsImage = 'assets/new_year_2021.jpg';
const kImageAnimationDuration = Duration(milliseconds: 1500);
const kDontGratsAnimationDuration = Duration(milliseconds: 500);
const kSprites = 'assets/weathersprites.png';
const kSpriteJson = 'assets/weathersprites.json';
const kFlake0 = 'flake-0.png';
const kFlake1 = 'flake-1.png';
const kFlake2 = 'flake-2.png';
const kFlake3 = 'flake-3.png';
const kFlake4 = 'flake-4.png';
const kFlake5 = 'flake-5.png';
const kFlake6 = 'flake-6.png';
const kFlake7 = 'flake-7.png';
const kFlake8 = 'flake-8.png';
const kSound = 'assets/sound.mp3';
