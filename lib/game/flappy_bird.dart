
import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';
class FlappyBird extends FlameGame with TapDetector , HasCollisionDetection{
  Timer interval =  Timer(Config.pipeInterval,repeat : true);
  late Bird bird;
  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
     interval.update(dt);
  }
  @override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    bird.fly();
  }

}
