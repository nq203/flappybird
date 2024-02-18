import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flutter/material.dart';
class GameOverScreen extends StatelessWidget {
  static const String id = "gameOver";
  final FlappyBird game;
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Score: ${game.bird.score}',style: TextStyle(fontSize: 50,color: Colors.orangeAccent,fontFamily: 'Game'),),
            const Image(
              image: AssetImage(Assets.gameOver),
            ),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                child: const Text('Restart',style: TextStyle(fontSize: 20,color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
  void onRestart(){
    game.bird.reset();
  }
}
