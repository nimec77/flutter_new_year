import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

import 'snow.dart';

class SnowWorld extends NodeWithSize {
  final SpriteSheet spriteSheet;

  SnowWorld({@required Size size, @required this.spriteSheet})
      : assert(size != null),
        assert(spriteSheet != null),
        super(size) {
    final snow = Snow(size: size, spriteSheet: spriteSheet);
    addChild(snow);
    snow.start();
  }
}
