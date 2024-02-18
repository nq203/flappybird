import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBird>, CollisionCallbacks{
  int score = 0;
  @override
  Future<void> onLoad() async{
    // TODO: implement onLoad
    final birdMidFlap = await gameRef.loadSprite(Assets.bird_midflap);
    final birdUpFlap = await gameRef.loadSprite(Assets.bird_upflap);
    final birdDownFlap = await gameRef.loadSprite(Assets.bird_downflap);
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    current  = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    add(CircleHitbox());
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.y -= Config.birdVelocity*dt;
  }
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }
  void gameOver(){
    FlameAudio.play(Assets.endgame);
    game.isHit = true;
    gameRef.pauseEngine();
    gameRef.overlays.add('gameOver');
  }
  void fly(){
    current = BirdMovement.down;
    add(
      MoveByEffect(
          Vector2(0,-Config.gravity),
          EffectController(duration: 0.2 ,curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.up,
      )
    );
    FlameAudio.play(Assets.flying);
  }

  void reset() {
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    game.overlays.remove('gameOver');
    game.resumeEngine();
    gameRef.bird.score =0;
  }
}