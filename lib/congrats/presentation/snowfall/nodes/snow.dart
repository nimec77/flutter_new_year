import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:spritewidget/spritewidget.dart';

import '../../constants.dart';

class Snow extends Node {
  final Size size;
  final SpriteSheet spriteSheet;

  final _particles = <ParticleSystem>[];

  Snow({@required this.size, @required this.spriteSheet})
      : assert(size != null),
        assert(spriteSheet != null) {
    _addParticles(spriteSheet[kFlake0], 1.0);
    _addParticles(spriteSheet[kFlake1], 1.0);
    _addParticles(spriteSheet[kFlake2], 1.0);

    _addParticles(spriteSheet[kFlake3], 1.5);
    _addParticles(spriteSheet[kFlake4], 1.5);
    _addParticles(spriteSheet[kFlake5], 1.5);

    _addParticles(spriteSheet[kFlake6], 2.0);
    _addParticles(spriteSheet[kFlake7], 2.0);
    _addParticles(spriteSheet[kFlake8], 2.0);
  }

  void _addParticles(SpriteTexture texture, double distance) {
    final particles = ParticleSystem(
      texture,
      transferMode: BlendMode.srcATop,
      posVar: Offset(size.height, 0),
      direction: 90,
      directionVar: 0,
      speed: 150 / distance,
      speedVar: 50 / distance,
      startSize: 1 / distance,
      startSizeVar: 0.3 / distance,
      endSize: 1.2 / distance,
      endSizeVar: 0.2 / distance,
      life: 20 * distance,
      lifeVar: 10 * distance,
      emissionRate: 2,
      startRotationVar: 360,
      endRotationVar: 360,
      radialAccelerationVar: 10 / distance,
      tangentialAccelerationVar: 10 / distance,
    );
    particles.position = Offset(size.height, -50);
    particles.opacity = 0;

    _particles.add(particles);

    addChild(particles);
  }

  void start() {
    _active();
  }

  void stop() {
    _active(active: false);
  }

  void _active({bool active = true}) {
    motions.stopAll();
    for (final system in _particles) {
      if (active) {
        motions.run(MotionTween<double>((a) => system.opacity = a as double, system.opacity, 1.0, 2.0));
      } else {
        motions.run(MotionTween<double>((a) => system.opacity = a as double, system.opacity, 0.0, 0.5));
      }
    }
  }
}
