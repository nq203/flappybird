
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBird>{
  Pipe({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;
  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;
    // TODO: implement onLoad
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);
    switch (pipePosition){
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
@override
void update(double dt) {
  // TODO: implement update
  super.update(dt);
  position.x -= Config.gameSpeed*dt;
  if (position.x  < -size.x){
    removeFromParent();
  }
  // if(gameRef.isHit){
  //   removeFromParent();
  //   gameRef.isHit = false;
  // }
}
}