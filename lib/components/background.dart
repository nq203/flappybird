import 'dart:async';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
class Background extends SpriteComponent with HasGameRef<FlappyBird> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}