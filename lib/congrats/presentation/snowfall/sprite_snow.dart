import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_desktop/flutter_audio_desktop.dart';
import 'package:flutter_new_year/congrats/presentation/snowfall/nodes/snow_world.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spritewidget/spritewidget.dart';

import '../constants.dart';

class SpriteSnow extends StatefulWidget {
  @override
  _SpriteSnowState createState() => _SpriteSnowState();
}

class _SpriteSnowState extends State<SpriteSnow> {
  final _audioPlayer = AudioPlayer();
  final _imageMap = ImageMap(rootBundle);
  SpriteSheet _spriteSheet;
  Future<void> _future;
  StreamSubscription<void> _soundSubscription;

  @override
  void initState() {
    super.initState();
    _future = _loadAssets(rootBundle);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _soundSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        final size = MediaQuery.of(context).size;
        if (snapshot.connectionState == ConnectionState.done) {
          return SpriteWidget(SnowWorld(size: size, spriteSheet: _spriteSheet));
        }
        return Container();
      },
    );
  }

  Future<void> _loadAssets(AssetBundle bundle) async {
    await _imageMap.load([kSprites]);
    final json = await DefaultAssetBundle.of(context).loadString(kSpriteJson);
    _spriteSheet = SpriteSheet(_imageMap[kSprites], json);
    final tempDirectory = await getTemporaryDirectory();
    final tempFile = '${tempDirectory.path}/sound.mp3';
    final file = File(tempFile);
    final soundAsset = await DefaultAssetBundle.of(context).load(kSound);
    await file.writeAsBytes(soundAsset.buffer.asUint8List());
    _loopingPlayback(file.path);
  }

  Future<void> _loopingPlayback(String path) async {
    debugPrint(path);
    await _audioPlayer.load(path);
    await _audioPlayer.play();
    final duration = await _audioPlayer.getDuration() as Duration;
    _soundSubscription = Stream.periodic(duration).listen((_) async {
      await _audioPlayer.load(path);
      await _audioPlayer.play();
    });
  }
}
