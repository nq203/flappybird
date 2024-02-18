import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBird>{
  PipeGroup();
  final _random = Random();

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    final gameHeight = gameRef.size.y - Config.groundHeight;
    final space = 100 +  _random.nextInt(150);
    final centerY = space + _random.nextDouble() *(gameHeight -space) ;
    await addAll([
      Pipe(height:  gameHeight - centerY -space/2, pipePosition: PipePosition.top),
      Pipe(height: centerY - space/2, pipePosition: PipePosition.bottom),
    ]);
  }
  // @override
  // void update(double dt) {
  //   // TODO: implement update
  //   super.update(dt);
  //   position.x -= Config.gameSpeed*dt;
  //   if (position.x  < -size.x){
  //     removeFromParent();
  //   }
  //   // if(gameRef.isHit){
  //   //   removeFromParent();
  //   //   gameRef.isHit = false;
  //   // }
  // }
}