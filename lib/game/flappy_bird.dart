
import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flutter/material.dart';
class FlappyBird extends FlameGame with TapDetector , HasCollisionDetection{
  Timer interval =  Timer(Config.pipeInterval,repeat : true);
  late Bird bird;
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }
  TextComponent buildScore(){
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x/2,size.y/2*0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Game',color: Colors.orangeAccent,
        )
      )
    );
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
     interval.update(dt);
     score.text = 'Score: ${bird.score}';
  }
  @override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    bird.fly();
  }

}
